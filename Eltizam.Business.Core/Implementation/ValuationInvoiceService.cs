using Eltizam.Business.Core.Interface;
using Eltizam.Business.Core.ModelMapper;
using Eltizam.Business.Models;
using Eltizam.Data.DataAccess.Core.Repositories;
using Eltizam.Data.DataAccess.Core.UnitOfWork;
using Eltizam.Data.DataAccess.Entity;
using Eltizam.Data.DataAccess.Helper;
using Eltizam.Utility;
using Eltizam.Utility.Enums;
using Microsoft.EntityFrameworkCore.Metadata.Internal;
using Org.BouncyCastle.Asn1.Ocsp;
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
        private IRepository<ValuationPaymentInvoice> _InvoiceMap;
        private IRepository<MasterDocument> _repositoryDocument { get; set; }
        private readonly IHelper _helper;
        private readonly int? _LoginUserId;
        private readonly IMasterNotificationService _notificationService;
        private readonly IRepository<MasterUser> _masteruserrepository;
        //private readonly IRepository<MasterDictionaryDetail> _masterdictionaryrepository;
        private readonly IAuditLogService _auditLogService;
        private IRepository<MasterValuationStatus> _statusrepository { get; set; }
        #endregion Properties

        #region Constructor
        public ValuationInvoiceService(IUnitOfWork unitOfWork, IMapperFactory mapperFactory, IHelper helper, IAuditLogService auditLogService, IMasterNotificationService notificationService)
        {
            _unitOfWork = unitOfWork;
            _mapperFactory = mapperFactory;
            _repository = _unitOfWork.GetRepository<ValuationInvoice>();
            _repositoryDocument = _unitOfWork.GetRepository<MasterDocument>();
            _helper = helper;
            _auditLogService = auditLogService;
            _LoginUserId = _helper.GetLoggedInUser()?.UserId;
            _notificationService = notificationService;
            _masteruserrepository = _unitOfWork.GetRepository<MasterUser>();
            //_masterdictionaryrepository = _unitOfWork.GetRepository<MasterDictionaryDetail>();
            _statusrepository = _unitOfWork.GetRepository<MasterValuationStatus>();
            _InvoiceMap = _unitOfWork.GetRepository<ValuationPaymentInvoice>();
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
            MasterDocument objDocument;
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

                var id = string.Format("{0}-{1}", AppConstants.ID_InvoiceRequest, entityInvoice.ValuationRequestId);
                objInvoice.ReferenceNo = string.Format("{0}{1}", id, lastReq?.Id + 1);

                objInvoice.CreatedDate = AppConstants.DateTime;
                objInvoice.CreatedBy = entityInvoice.CreatedBy ?? 1;

                _repository.AddAsync(objInvoice);
                await _unitOfWork.SaveChangesAsync();
            }

            if (objInvoice.Id == 0)
                return DBOperation.Error;

            else
            {
                if (entityInvoice.uploadDocument != null)
                {
                    foreach (var doc in entityInvoice.uploadDocument)
                    {
                        objDocument = _mapperFactory.Get<MasterDocumentModel, MasterDocument>(doc);
                        objDocument.IsActive = doc.IsActive;
                        objDocument.TableKeyId = objInvoice.Id;
                        objDocument.TableName = Enum.GetName(TableNameEnum.ValuationInvoice);
                        objDocument.DocumentName = doc.DocumentName;
                        objDocument.FileName = doc.FileName;
                        objDocument.FilePath = doc.FilePath;
                        objDocument.FileType = doc.FileType;
                        objDocument.CreatedBy = objInvoice.CreatedBy;

                        _repositoryDocument.AddAsync(objDocument);
                        await _unitOfWork.SaveChangesAsync();
                    }
                }
            }
            try
            {
                var statusid = _statusrepository.GetAll().Where(x => x.Status == "Paymented").Select(x => x.Id).FirstOrDefault();
                _notificationService.UpdateValuationRequestStatus(statusid, objInvoice.ValuationRequestId);

                string? username = _masteruserrepository.GetAll().Where(x => x.Id == objInvoice.CreatedBy).Select(x => x.UserName).FirstOrDefault();
                string transactionstatus = _statusrepository.Get(x => x.Id == objInvoice.TransactionStatusId).Status;
                TransactionModeEnum mode = (TransactionModeEnum)objInvoice.TransactionModeId;
                string? paymentmode = Enum.GetName(typeof(TransactionModeEnum), mode);

                string strHtml = File.ReadAllText(@"wwwroot\Uploads\HTMLTemplates\ValuationRequest_InvoiceCreate.html");
                strHtml = strHtml.Replace("[PDateP]", objInvoice.CreatedDate.ToString("dd-MMM-yyyy"));
                strHtml = strHtml.Replace("[Amount]", objInvoice.Amount.ToString());
                strHtml = strHtml.Replace("[Transaction]", transactionstatus);
                strHtml = strHtml.Replace("[PaymentMode]", paymentmode);
                strHtml = strHtml.Replace("[Date]", objInvoice.TransactionDate?.ToString("dd-MMM-yyyy"));

                var notificationModel = _notificationService.GetValuationNotificationData(RecepientActionEnum.InvoiceCreation, objInvoice.ValuationRequestId);
                notificationModel.Body = strHtml;
                notificationModel.Subject = EnumHelper.GetDescription(RecepientActionEnum.InvoiceCreation);

                await _notificationService.SendEmail(notificationModel);
            }
            catch (Exception ex)
            {
            }
            return DBOperation.Success;
        }

        public async Task<ValuationInvoiceListModel> GetInvoiceById(int id)
        {
            var tableName = Enum.GetName(TableNameEnum.ValuationInvoice);

            //var _quatationEntity = new ValuationInvoiceListModel();
            var _quatationEntity = _mapperFactory.Get<ValuationInvoice, ValuationInvoiceListModel>(await _repository.GetAsync(id));

            if (_quatationEntity != null)
            {
                DbParameter[] osqlParameter2 =
                {
                    new DbParameter(AppConstants.TableKeyId, id, SqlDbType.Int),
                    new DbParameter(AppConstants.TableName,  tableName, SqlDbType.VarChar),
                };

                var quatationDocuments = EltizamDBHelper.ExecuteMappedReader<MasterDocumentModel>(ProcedureMetastore.usp_Document_GetDocumentByTableKeyId,
                                    DatabaseConnection.ConnString, System.Data.CommandType.StoredProcedure, osqlParameter2);

                if (quatationDocuments != null)
                    _quatationEntity.Documents = quatationDocuments;
            }
            return _quatationEntity;
        }

        public async Task<DBOperation> InvoiceDelete(int id, int? by)
        {
            var entityInvoice = _repository.Get(x => x.Id == id);
            entityInvoice.ModifiedBy = by ?? entityInvoice.ModifiedBy;
            if (entityInvoice == null)
                return DBOperation.NotFound;

            _repository.Remove(entityInvoice);

            await _unitOfWork.SaveChangesAsync();

            return DBOperation.Success;
        }
        public async Task<DBOperation> DeleteDocument(int id, int? by)
        {
            if (id > 0)
            {

                var entityDoc = _repositoryDocument.Get(id);
                if (entityDoc != null)
                {
                    _repositoryDocument.Remove(entityDoc);
                    await _unitOfWork.SaveChangesAsync();
                }
            }
            // Return a success operation indicating successful deletion.
            return DBOperation.Success;
        }

        public async Task<DBOperation> UpsertInvoice(ValuationInvoicePaymentModel invoice)
        {

            
            ValuationPaymentInvoice objIvoiceType;

            // Check if the entity has an ID greater than 0 (indicating an update).
            if (invoice.Id > 0)
            {
                // Get the existing entity from the repository.
                objIvoiceType = _InvoiceMap.Get(invoice.Id);

                // If the entity exists, update its invoice.
                if (objIvoiceType != null)
                {
                    objIvoiceType.InvoiceNo = invoice.InvoiceNo;
                    objIvoiceType.Amount = invoice.Amount;
                    objIvoiceType.Balance = invoice.Balance;
                    objIvoiceType.Note = invoice.Note;
                    objIvoiceType.TransactionModeId=invoice.TransactionModeId;
                    objIvoiceType.TransactionDate = invoice.TransactionDate;
                    objIvoiceType.ModifiedDate = AppConstants.DateTime;
                    objIvoiceType.ModifiedBy = invoice.ModifiedBy;

                    // Update the entity in the repository asynchronously.
                    _InvoiceMap.UpdateAsync(objIvoiceType);
                }
                else
                {
                    // Return a not found operation if the entity does not exist.
                    return DBOperation.NotFound;
                }
            }
            else
            {
                
                objIvoiceType = _mapperFactory.Get<ValuationInvoicePaymentModel, ValuationPaymentInvoice>(invoice);
                objIvoiceType.CreatedDate = AppConstants.DateTime;
                objIvoiceType.ModifiedDate = AppConstants.DateTime;
                objIvoiceType.ModifiedBy = invoice.ModifiedBy;
                objIvoiceType.CreatedBy = invoice.CreatedBy;

                // Insert the new entity into the repository asynchronously.
                _InvoiceMap.AddAsync(objIvoiceType);
            }

            // Save changes to the database asynchronously.
            await _unitOfWork.SaveChangesAsync();

            // Return an appropriate operation result.
            if (objIvoiceType.Id == 0)
                return DBOperation.Error;

            return DBOperation.Success;
        }

        public async Task<ValuationInvoicePaymentModel> PaymentInvoiceById(int id)
        {
            var _LocationEntity = new ValuationInvoicePaymentModel();
            _LocationEntity = _mapperFactory.Get<ValuationPaymentInvoice, ValuationInvoicePaymentModel>(await _InvoiceMap.GetAsync(id));

            return _LocationEntity;
        }


        public async Task<List<ValuationInvoicePaymentModel>> GetPaymentInvoiceById(int requestId)
        {
            DbParameter[] osqlParameter =
            {
                new DbParameter("RequestId", requestId, SqlDbType.Int),
            };
            var res = EltizamDBHelper.ExecuteMappedReader<ValuationInvoicePaymentModel>(ProcedureMetastore.usp_Invoice_GetInvoicePaymentByValuationRequestId,
                      DatabaseConnection.ConnString, CommandType.StoredProcedure, osqlParameter);
            return res;
        }


        public async Task<DBOperation> DeletePyamentInvoice(int id, int? by)
        {
            if (id > 0)
            {

                var payment = _InvoiceMap.Get(id);
                if (payment != null)
                {
                    _InvoiceMap.Remove(payment);
                    await _unitOfWork.SaveChangesAsync();
                }
            }
            // Return a success operation indicating successful deletion.
            return DBOperation.Success;
        }


    }
}
