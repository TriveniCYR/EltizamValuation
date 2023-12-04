using Eltizam.Business.Core.Interface;
using Eltizam.Business.Core.ModelMapper;
using Eltizam.Business.Models;
using Eltizam.Data.DataAccess.Core.Repositories;
using Eltizam.Data.DataAccess.Core.UnitOfWork;
using Eltizam.Data.DataAccess.Entity;
using Eltizam.Data.DataAccess.Helper;
using Eltizam.Utility;
using Eltizam.Utility.Enums;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Transactions;
using static Eltizam.Utility.Enums.GeneralEnum;
using static Microsoft.EntityFrameworkCore.DbLoggerCategory.Database;

namespace Eltizam.Business.Core.Implementation
{
    public class ValuationInvoiceService : IValuationInvoiceService
    {
        #region Properties
        private readonly IUnitOfWork _unitOfWork;
        private readonly IMapperFactory _mapperFactory;
        private readonly Microsoft.Extensions.Configuration.IConfiguration _configuration;
        private IRepository<ValuationInvoice> _repository;
        private readonly IHelper _helper;
        private readonly int? _LoginUserId;
        private readonly INotificationService _notificationService;
        private readonly IRepository<MasterUser> _masteruserrepository;
        private readonly IRepository<MasterDictionaryDetail> _masterdictionaryrepository;
        private readonly IAuditLogService _auditLogService;
        #endregion Properties

        #region Constructor
        public ValuationInvoiceService(IUnitOfWork unitOfWork, IMapperFactory mapperFactory, IHelper helper, IAuditLogService auditLogService, INotificationService notificationService)
        {
            _unitOfWork = unitOfWork;
            _mapperFactory = mapperFactory;
            _repository = _unitOfWork.GetRepository<ValuationInvoice>();
            _helper = helper;
            _auditLogService = auditLogService; 
            _LoginUserId = _helper.GetLoggedInUser()?.UserId;
            _notificationService = notificationService;
            _masteruserrepository = _unitOfWork.GetRepository<MasterUser>();
            _masterdictionaryrepository = _unitOfWork.GetRepository<MasterDictionaryDetail>();
        }
        #endregion Constructor


        public async Task<List<ValuationInvoiceListModel>> GetInvoiceList(int requestId)
        {
            DbParameter[] osqlParameter2 =
            {
                    new DbParameter("RequestId", requestId, SqlDbType.Int),
                };

            var invoiceList = EltizamDBHelper.ExecuteMappedReader<ValuationInvoiceListModel>(ProcedureMetastore.usp_Invoice_GetInvoiceByRequestId,
                                DatabaseConnection.ConnString, System.Data.CommandType.StoredProcedure, osqlParameter2);

            return invoiceList; 
        }

        public async Task<DBOperation> Upsert(ValuationInvoiceListModel entityInvoice)
        { 
            ValuationInvoice objInvoice;
            string MainTableName = Enum.GetName(TableNameEnum.ValuationInvoice);
            int MainTableKey = entityInvoice.Id;

            if (entityInvoice.Id > 0)
            { 
                ValuationInvoice OldEntity = null;
                OldEntity = _repository.GetNoTracking(entityInvoice.Id);

                objInvoice = _repository.Get(entityInvoice.Id);

                if (objInvoice != null)
                {
                    objInvoice.ReferenceNo = entityInvoice.ReferenceNo;
                    objInvoice.ValuationRequestId = entityInvoice.ValuationRequestId;
                    objInvoice.TransactionModeId = entityInvoice.TransactionModeId;
                    objInvoice.TransactionStatusId = entityInvoice.TransactionStatusId;
                    objInvoice.Amount = entityInvoice.Amount;
                    objInvoice.CheckNumer = entityInvoice.CheckNumer;
                    objInvoice.CheckBankName = entityInvoice.CheckBankName;
                    objInvoice.CheckDate = entityInvoice.CheckDate;
                    objInvoice.CardNumber = entityInvoice.CardNumber;
                    objInvoice.CardBankName = entityInvoice.CardBankName;
                    objInvoice.CardHolderName = entityInvoice.CardHolderName;
                    objInvoice.ExpireDate = entityInvoice.ExpireDate;
                    objInvoice.AccountBankName = entityInvoice.AccountBankName;
                    objInvoice.AccountHolderName = entityInvoice.AccountHolderName;
                    objInvoice.Note = entityInvoice.Note;
                    objInvoice.ModifiedDate = AppConstants.DateTime;
                    objInvoice.ModifiedBy = entityInvoice.ModifiedBy; 

                    _repository.UpdateAsync(objInvoice);
                    await _unitOfWork.SaveChangesAsync();

                    //Do Audit Log --AUDITLOGUSER
                    await _auditLogService.CreateAuditLog<ValuationInvoice>(AuditActionTypeEnum.Update, OldEntity, objInvoice, MainTableName, MainTableKey);
                }
                else
                {
                    return DBOperation.NotFound;
                }
            }
            else
            {
                objInvoice = _mapperFactory.Get<ValuationInvoiceListModel, ValuationInvoice>(entityInvoice);


                var lastReq = _repository.GetAll().OrderByDescending(a => a.Id).FirstOrDefault();
                objInvoice.ReferenceNo = string.Format("{0}{1}", AppConstants.ID_InvoiceRequest, lastReq?.Id + 1);

                objInvoice.CreatedDate = AppConstants.DateTime;
                objInvoice.CreatedBy = entityInvoice.CreatedBy ?? 1;

                _repository.AddAsync(objInvoice);
                await _unitOfWork.SaveChangesAsync();
            } 

            if (objInvoice.Id == 0)
                return DBOperation.Error;
            try
            {
                string? username = _masteruserrepository.GetAll().Where(x => x.Id == objInvoice.CreatedBy).Select(x=>x.UserName).FirstOrDefault();
                string transactionstatus = _masterdictionaryrepository.Get(x => x.Id == objInvoice.TransactionStatusId).Description;
                string strHtml = File.ReadAllText(@"wwwroot\Uploads\HTMLTemplates\ValuationRequest_InvoiceCreate.html");
                strHtml = strHtml.Replace("[PDateP]", objInvoice.CreatedDate.ToString());
                strHtml = strHtml.Replace("[PCreatedByP]", username);
                strHtml = strHtml.Replace("[PValRefNoP]", objInvoice.ReferenceNo);
                strHtml = strHtml.Replace("[Amount]", objInvoice.Amount.ToString());
                strHtml = strHtml.Replace("[Transaction]", transactionstatus);
                TransactionModeEnum mode = (TransactionModeEnum)objInvoice.TransactionModeId;
                string? paymentmode = Enum.GetName(typeof(TransactionModeEnum), mode);
                strHtml = strHtml.Replace("[PaymentMode]", paymentmode);
                strHtml = strHtml.Replace("[Date]", objInvoice.TransactionDate.ToString());

                var receipientemail = _notificationService.GetToEmail(RecepientActionEnum.InvoiceCreation.ToString(), objInvoice.Id);
                var sendemaildetails = new SendEmailModel
                {
                    ToEmailList = receipientemail.ToEmailList,
                    Body = strHtml,
                    Subject = "Valuation Invoice Creation",

                };
                await _notificationService.SendEmail(sendemaildetails, objInvoice.ValuationRequestId,0);
            }
            catch (Exception ex)
            {

                throw ex;
            }
            return DBOperation.Success;
        }

        public async Task<ValuationInvoiceListModel> GetInvoiceById(int id)
        {
            var _quatationEntity = new ValuationInvoiceListModel();
            _quatationEntity = _mapperFactory.Get<ValuationInvoice, ValuationInvoiceListModel>(await _repository.GetAsync(id));

            return _quatationEntity;
        }

        public async Task<DBOperation> InvoiceDelete(int id)
        {
            var entityInvoice = _repository.Get(x => x.Id == id);

            if (entityInvoice == null)
                return DBOperation.NotFound;

            _repository.Remove(entityInvoice);

            await _unitOfWork.SaveChangesAsync();

            return DBOperation.Success;
        }
    }
}
