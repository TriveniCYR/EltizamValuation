using Eltizam.Business.Core.Interface;
using Eltizam.Business.Core.ModelMapper;
using Eltizam.Business.Models;
using Eltizam.Data.DataAccess.Core.Repositories;
using Eltizam.Data.DataAccess.Core.UnitOfWork;
using Eltizam.Data.DataAccess.Entity;
using Eltizam.Data.DataAccess.Helper;
using Eltizam.Utility;
using Eltizam.Utility.Enums;
using MailKit.Net.Smtp;
using Microsoft.Extensions.Caching.Memory;
using Microsoft.Extensions.Configuration;
using MimeKit;
using MimeKit.Text;
using System.Data;
using static Eltizam.Utility.Enums.GeneralEnum;

namespace Eltizam.Business.Core.Implementation
{
    public class MasterNotificationService : INotificationService
    {
        private readonly IConfiguration _configuration;
        private readonly IUnitOfWork _unitOfWork;
        private readonly IMapperFactory _mapperFactory;
        private IRepository<MasterNotification> _repository { get; set; }
        private IRepository<ValuationRequest> _valuationrepository { get; set; }
        private IRepository<ValuationRequestStatus> _statusrepository { get; set; }
        private IRepository<MasterUser> _userrepository { get; set; }
        private readonly IMemoryCache _memoryCache;
        public MasterNotificationService(IUnitOfWork unitOfWork, IConfiguration configuration, IMapperFactory mapperFactory, IMemoryCache memoryCache)
        {
            _unitOfWork = unitOfWork;
            _repository = _unitOfWork.GetRepository<MasterNotification>();
            _configuration = configuration;
            _mapperFactory = mapperFactory;
            _valuationrepository = _unitOfWork.GetRepository<ValuationRequest>();
            _statusrepository = _unitOfWork.GetRepository<ValuationRequestStatus>(); 
            _userrepository=_unitOfWork.GetRepository<MasterUser>();
            _memoryCache = memoryCache;
        }

        /// <summary>
        /// Send email and log entry into DB
        /// </summary>
        /// <param name="request"></param>
        /// <param name="valuationrequestId"></param>
        /// <param name="statusId"></param>
        /// <returns></returns>
        public async Task<DBOperation> SendEmail(SendNotificationModel request)
        {
            try
            {
                request.Body = request.Body?.Replace("[PValRefNoP]", request.ValRefNo).Replace("[PClientP]", request.Client).Replace("[PPropertyP]", request.Property)
                                            .Replace("[PLocationP]", request.Location).Replace("[PStatusP]", request.Status).Replace("[PIdP]", request.ValId.ToString());

                var message = new MimeMessage();
                message.From.Add(MailboxAddress.Parse(_configuration.GetSection("SMTPDetails:FromEmail").Value));

                //Parse email data
                var Em = request.ToEmailList;
                if (Em.Contains(';'))
                {
                    foreach (var mail in Em.Split(';'))
                        message.To.Add(MailboxAddress.Parse(mail.Trim()));
                }
                else
                    message.To.Add(MailboxAddress.Parse(Em));

                // message.To.Add(MailboxAddress.Parse(request.ToEmailList));
                message.Subject = _configuration.GetSection("ApiInfo:Environment").Value + " " + request.Subject;
                message.Body = new TextPart(TextFormat.Html) { Text = request.Body };

                using var smtp = new SmtpClient();
                smtp.Connect(_configuration.GetSection("SMTPDetails:Host").Value, 587, MailKit.Security.SecureSocketOptions.StartTls);
                smtp.Authenticate(_configuration.GetSection("SMTPDetails:UserName").Value,
                    _configuration.GetSection("SMTPDetails:Password").Value);

                //Send email 
                smtp.Send(message);
                smtp.Disconnect(true);

                //Log email entry
                var notification = new MasterNotification
                {
                    ValuationRequestId = request.ValId,
                    StatusId = request.StatusId,
                    Subject = request.Subject,
                    ToEmails = request.ToEmailList,
                    Body = request.Body,
                    SentDatetime = DateTime.Now,
                    IsEmailSent = true,
                    CreatedBy = 1,
                    CreatedDate = DateTime.Now,
                    ReadBy = 0,
                    ReadDate = null,
                };

                _repository.AddAsync(notification);
                await _unitOfWork.SaveChangesAsync();
            }
            catch (Exception ex)
            {

            }

            return DBOperation.Success;
        }

        public SendNotificationModel GetValuationNotificationData(RecepientActionEnum subjectEnum, int valiadtionRequestId)
        {
            DbParameter[] osqlParameter =
            {
                new DbParameter("Action", subjectEnum, SqlDbType.Int),
                new DbParameter("ValId",  valiadtionRequestId, SqlDbType.Int),
            };

            var result = EltizamDBHelper.ExecuteMappedReader<SendNotificationModel>(ProcedureMetastore.usp_ValuationRequest_GetNotificationData,
                         DatabaseConnection.ConnString, System.Data.CommandType.StoredProcedure, osqlParameter).FirstOrDefault();

            return result;
        }

        public List<MasterNotificationEntitty> GetAll(int? viewmore, int? userId, int? valId)
        {
            var cacheKey = $"NotificationsCache_{viewmore}_{userId}_{valId}";

            // Get from cache first
            var cacheData = _memoryCache.Get<List<MasterNotificationEntitty>>(cacheKey);
            if (cacheData != null)
            {
                return cacheData;
            }
            var notificationresult = _repository.GetAllAsync().Result.ToList();
            var valuationrequest = _valuationrepository.GetAllAsync().Result.ToList();

            var result = from notification in notificationresult
                         join valuation in valuationrequest on notification.ValuationRequestId equals valuation.Id
                         orderby notification.Id descending
                         select new MasterNotificationEntitty
                         {
                             Id = notification.Id,
                             ValuationRequestId = notification.ValuationRequestId,
                             Subject = notification.Subject,
                             ToEmails = notification.ToEmails,
                             Body = notification.Body,
                             SentDatetime = notification.SentDatetime,
                             Readby = notification.ReadBy,
                             ReadDate = notification.ReadDate,
                             ValRefNo = valuation.ReferenceNo,
                             StatusId = notification.StatusId,
                             CreatedBy = valuation.CreatedBy,
                             ApproverId = valuation.ApproverId,
                             ValuerId = valuation.ValuerId
                         };


            if (userId != null && userId != 0)
            {

                //Get the role for userId
                var roleId = _userrepository.GetAll().Where(user => user.Id == userId).First().RoleId;
                if (roleId == (int)RoleEnum.Approver)
                {
                    result = result.Where(a => a.ApproverId == userId).ToList();
                }
                else if (roleId == (int)RoleEnum.Valuer)
                {
                    result = result.Where(a => a.ValuerId == userId).ToList();
                }
                else
                    result = result.Where(a => a.CreatedBy == userId).ToList();
            }

            if (valId != null && valId != 0)
                result = result.Where(a => a.ValuationRequestId == valId).ToList();

            List<MasterNotificationEntitty> finalResult;
            if (viewmore > 0)
            {
                finalResult = result.ToList();
            }
            else
            {
                finalResult = result.Where(x => x.Readby == 0).ToList();
            }
            var expirationTime = DateTimeOffset.Now.AddMinutes(60.0);
            _memoryCache.Set(cacheKey, finalResult, expirationTime);
            return finalResult;
        }


        public async Task<DBOperation> UpdateNotification(int notificationid, int readBy)
        {
            var tobeupdateddata = _repository.Get(notificationid);
            if (tobeupdateddata != null)
            {
                tobeupdateddata.ReadBy = readBy;
                tobeupdateddata.ReadDate = DateTime.Now.Date;
                _repository.UpdateAsync(tobeupdateddata);
                await _unitOfWork.SaveChangesAsync();
            }
            return DBOperation.Success;

        }


        public async void UpdateValuationRequestStatus(int newStatusId, int id)
        {
            try
            {
                ValuationRequest result = null;

                if (newStatusId > 0)
                {
                    result = _valuationrepository.Get(id);
                    result.StatusId = newStatusId;
                    _valuationrepository.UpdateAsync(result);
                    await _unitOfWork.SaveChangesAsync();
                    await SenddDetailsToEmail(RecepientActionEnum.ValuationStatusChanged, id);
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        public async Task<bool> SenddDetailsToEmail(RecepientActionEnum subjectEnum, int valuationrequestId)
        {
            try
            {
                var notificationModel = GetValuationNotificationData(subjectEnum, valuationrequestId);

                string strHtml = File.ReadAllText(@"wwwroot\Uploads\HTMLTemplates\ValuationRequest_StatusChange.html");
                if (subjectEnum == RecepientActionEnum.ValuationCreated)
                {
                    strHtml = File.ReadAllText(@"wwwroot\Uploads\HTMLTemplates\ValuationRequest_Created.html");
                }
                strHtml = strHtml.Replace("[PValRefNoP]", notificationModel.ValRefNo);
                strHtml = strHtml.Replace("[PDateP]", DateTime.Now.ToString("dd-MMM-yyyy"));
                strHtml = strHtml.Replace("[PNewStatusP]", notificationModel.Status);

                notificationModel.Subject = EnumHelper.GetDescription(subjectEnum);
                notificationModel.Body = strHtml;

                await SendEmail(notificationModel);
                return true;
            }
            catch (Exception)
            {
                return false;
            }
        }
    }
}
