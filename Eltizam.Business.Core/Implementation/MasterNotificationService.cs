using Eltizam.Business.Core.Interface;
using Eltizam.Business.Core.ModelMapper;
using Eltizam.Business.Models;
using Eltizam.Data.DataAccess.Core.Repositories;
using Eltizam.Data.DataAccess.Core.UnitOfWork;
using Eltizam.Data.DataAccess.Entity;
using Eltizam.Data.DataAccess.Helper;
using Eltizam.Utility.Enums;
using Eltizam.Utility;
using MailKit.Net.Smtp;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Configuration;
using MimeKit;
using MimeKit.Text;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using static Eltizam.Utility.Enums.GeneralEnum;
using System.Drawing;

namespace Eltizam.Business.Core.Implementation
{
    public class MasterNotificationService: INotificationService
    {
        private readonly IConfiguration _configuration;
        private readonly IUnitOfWork _unitOfWork;
        private readonly IMapperFactory _mapperFactory;
        private IRepository<MasterNotification> _repository { get; set; }
        private IRepository<ValuationRequest> _valuationrepository { get; set; }
        public MasterNotificationService(IUnitOfWork unitOfWork,IConfiguration configuration,IMapperFactory mapperFactory)
        {
            _unitOfWork = unitOfWork;
            _repository = _unitOfWork.GetRepository<MasterNotification>();
            _configuration = configuration;
            _mapperFactory = mapperFactory;
            _valuationrepository= _unitOfWork.GetRepository<ValuationRequest>();
        }
        public async Task<DBOperation> SendEmail(SendEmailModel request,int valuationrequestId,int statusId)
        {
            var message = new MimeMessage();
            message.From.Add(MailboxAddress.Parse(_configuration.GetSection("SMTPDetails:FromEmail").Value));
            message.To.Add(MailboxAddress.Parse(request.ToEmailList));
            message.Subject = request.Subject;
            message.Body = new TextPart(TextFormat.Html) { Text = request.Body };
            using var smtp = new SmtpClient();
            smtp.Connect(_configuration.GetSection("SMTPDetails:Host").Value, 587, MailKit.Security.SecureSocketOptions.StartTls);
            smtp.Authenticate(_configuration.GetSection("SMTPDetails:UserName").Value,
                _configuration.GetSection("SMTPDetails:Password").Value);
            smtp.Send(message);
            smtp.Disconnect(true);
            try
            {
                var notification = new MasterNotification
                {
                    ValuationRequestId = valuationrequestId,
                    StatusId = statusId,
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

                throw ex;
            }
       
            return DBOperation.Success;
        }
        public SendEmailModel GetToEmail(string action, int valiadtionRequestId)
        {
            DbParameter[] osqlParameter =
            {
                new DbParameter("Action", action, SqlDbType.VarChar),
                new DbParameter("ValiadtionRequestId",valiadtionRequestId,SqlDbType.Int),
            };

            var result = EltizamDBHelper.ExecuteMappedReader<SendEmailModel>(ProcedureMetastore.usp_EmailToList,
                              DatabaseConnection.ConnString, System.Data.CommandType.StoredProcedure, osqlParameter).FirstOrDefault();
            return result;
        }

        public List<MasterNotificationEntitty> GetAll(int? viewmore)
        {
            var notificationresult = _repository.GetAllAsync().Result.ToList();
            var valuationrequest = _valuationrepository.GetAllAsync().Result.ToList();

            var result = from notification in notificationresult
                         join valuation in valuationrequest on notification.ValuationRequestId equals valuation.Id
                         orderby notification.Id
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
                             StatusId = notification.StatusId
                         };

            List<MasterNotificationEntitty> finalResult;
            if (viewmore > 0)
            {
                finalResult = result.ToList();
            }
            else
            {
                finalResult = result.Where(x=>x.Readby==0).Take(10).ToList();
            }

            return finalResult;
        }


        public async Task<DBOperation>UpdateNotification(int notificationid, int readBy)
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
    }
}
