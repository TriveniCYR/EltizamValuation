using Eltizam.Business.Core.Interface;
using Eltizam.Business.Core.ModelMapper;
using Eltizam.Business.Models;
using Eltizam.Data.DataAccess.Core.Repositories;
using Eltizam.Data.DataAccess.Core.UnitOfWork;
using Eltizam.Data.DataAccess.Entity;
using Eltizam.Data.DataAccess.Helper;
using Eltizam.Resource;
using Eltizam.Utility;
using Eltizam.Utility.Enums;
using Microsoft.AspNetCore.Hosting;
using Microsoft.EntityFrameworkCore.Metadata.Internal;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using static Eltizam.Utility.Enums.GeneralEnum;

namespace Eltizam.Business.Core.Implementation
{
    public class ValuationQuatationService : IValuationQuatationService
    {
        #region Properties

        private readonly IUnitOfWork _unitOfWork;
        private readonly IMapperFactory _mapperFactory;
        private IRepository<ValuationQuotation> _repository { get; set; }
        private IRepository<MasterDocument> _repositoryDocument { get; set; }
        private readonly IHelper _helper;

        private readonly IAuditLogService _auditLogService;
        private readonly int? _LoginUserId;
        private readonly INotificationService _notificationService;
        private readonly IHostingEnvironment _hostingEnvironment;
        private readonly IRepository<MasterUser> _masteruserrepository;
        #endregion Properties

        #region Constructor
        public ValuationQuatationService(IUnitOfWork unitOfWork, IMapperFactory mapperFactory, IHelper helper, IAuditLogService auditLogService, INotificationService notificationService)
        {
            _unitOfWork = unitOfWork;
            _mapperFactory = mapperFactory;
            _repository = _unitOfWork.GetRepository<ValuationQuotation>();
            _repositoryDocument = _unitOfWork.GetRepository<MasterDocument>();
            _helper = helper;
            _auditLogService = auditLogService;
            _LoginUserId = _helper.GetLoggedInUser()?.UserId;
            _notificationService = notificationService;
            _masteruserrepository = _unitOfWork.GetRepository<MasterUser>();
        }

        #endregion Constructor


        public async Task<List<ValuationQuatationListModel>> GetQuatationList(int requestId)
        {
            DbParameter[] osqlParameter2 =
            {
                    new DbParameter("RequestId", requestId, SqlDbType.Int),
                };

            var quottationList = EltizamDBHelper.ExecuteMappedReader<ValuationQuatationListModel>(ProcedureMetastore.usp_Quotation_GetQuotationByRequestId,
                                DatabaseConnection.ConnString, System.Data.CommandType.StoredProcedure, osqlParameter2);

            return quottationList; 
        }

        public async Task<ValuationQuatationListModel> GetQuatationById(int id)
        {
            var tableName = Enum.GetName(TableNameEnum.ValuationQuotation);

            // var _quatationEntity = new ValuationQuatationListModel();
            var _quatationEntity = _mapperFactory.Get<ValuationQuotation, ValuationQuatationListModel>(await _repository.GetAsync(id));

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


        public async Task<DBOperation> QuatationDelete(int id)
        {
            var entityQuatation = _repository.Get(x => x.Id == id);

            if (entityQuatation == null)
                return DBOperation.NotFound;

            _repository.Remove(entityQuatation);

            await _unitOfWork.SaveChangesAsync();

            return DBOperation.Success;
        }


        public async Task<DBOperation> Upsert(ValuationQuatationListModel entityQuatation)
        {
          
            ValuationQuotation objQuatation; 
            MasterDocument objDocument;

            string MainTableName = Enum.GetName(TableNameEnum.ValuationQuotation);
            int MainTableKey = entityQuatation.Id;

            if (entityQuatation.Id > 0)
            {
                ValuationQuotation OldEntity = null;
                OldEntity = _repository.GetNoTracking(entityQuatation.Id);

                objQuatation = _repository.Get(entityQuatation.Id);

                var OldObjDepartment = objQuatation;
                if (objQuatation != null)
                {
                    objQuatation.ReferenceNo = entityQuatation.ReferenceNo;
                    objQuatation.ValuationRequestId = entityQuatation.ValuationRequestId;
                    objQuatation.ValuationFee = entityQuatation.ValuationFee;
                    objQuatation.Vat = entityQuatation.Vat;
                    objQuatation.OtherCharges = entityQuatation.OtherCharges;
                    objQuatation.InstructorCharges = entityQuatation.InstructorCharges;
                    objQuatation.Discount = entityQuatation.Discount;
                    objQuatation.TotalFee = entityQuatation.TotalFee;
                    objQuatation.StatusId = entityQuatation.StatusId;
                    objQuatation.ModifiedDate = AppConstants.DateTime;
                    objQuatation.ModifiedBy = entityQuatation.ModifiedBy;

                    _repository.UpdateAsync(objQuatation);
                    await _unitOfWork.SaveChangesAsync();

                    //Do Audit Log --AUDITLOGUSER
                    await _auditLogService.CreateAuditLog<ValuationQuotation>(AuditActionTypeEnum.Update, OldEntity, objQuatation, MainTableName, MainTableKey);
                }
                else
                {
                    return DBOperation.NotFound;
                }
            }
            else
            {
                var lastReq = _repository.GetAll().OrderByDescending(a => a.Id).FirstOrDefault();
                objQuatation = _mapperFactory.Get<ValuationQuatationListModel, ValuationQuotation>(entityQuatation);

                objQuatation.ReferenceNo = string.Format("{0}{1}", AppConstants.ID_QuotationsRequest, lastReq?.Id); 
                objQuatation.CreatedDate = AppConstants.DateTime;
                objQuatation.CreatedBy = entityQuatation.CreatedBy ?? 1;

                _repository.AddAsync(objQuatation);
                await _unitOfWork.SaveChangesAsync();
            }
            
            if (objQuatation.Id == 0)
                return DBOperation.Error;

            else
            {
                if (entityQuatation.uploadDocument != null)
                {
                    foreach (var doc in entityQuatation.uploadDocument)
                    {
                        objDocument = _mapperFactory.Get<MasterDocumentModel, MasterDocument>(doc);
                        objDocument.IsActive = doc.IsActive;
                        objDocument.TableKeyId = objQuatation.Id;
                        objDocument.TableName = Enum.GetName(TableNameEnum.ValuationQuotation);
                        objDocument.DocumentName = doc.DocumentName;
                        objDocument.FileName = doc.FileName;
                        objDocument.FilePath = doc.FilePath;
                        objDocument.FileType = doc.FileType;
                        objDocument.CreatedBy = doc.CreatedBy;

                        _repositoryDocument.AddAsync(objDocument);
                        await _unitOfWork.SaveChangesAsync();
                    }
                }
            }
            try
            {
                string? username = _masteruserrepository.GetAll().Where(x => x.Id == objQuatation.CreatedBy).Select(x => x.UserName).FirstOrDefault();
                string strHtml = File.ReadAllText(@"wwwroot\Uploads\HTMLTemplates\ValuationRequest_QuotationCreate.html");
        
                strHtml = strHtml.Replace("[PDateP]", objQuatation.CreatedDate.ToString());
                strHtml = strHtml.Replace("[PCreatedByP]", username);
                strHtml = strHtml.Replace("[PValRefNoP]", objQuatation.ReferenceNo);
                strHtml = strHtml.Replace("[ValuationFees]", objQuatation.ValuationFee.ToString());
                strHtml = strHtml.Replace("[VAT]", objQuatation.Vat.ToString());
                strHtml = strHtml.Replace("[OtherCharges]", objQuatation.OtherCharges.ToString());
                strHtml = strHtml.Replace("[ValuationInstructorCharges]", objQuatation.InstructorCharges.ToString());
                strHtml = strHtml.Replace("[Discount]", objQuatation.Discount.ToString());
                strHtml = strHtml.Replace("[TotalevaluationFees]", objQuatation.TotalFee.ToString());
                var receipientemail = _notificationService.GetToEmail(RecepientActionEnum.QuaotationCreation.ToString(), objQuatation.Id);
                var sendemaildetails = new SendEmailModel
                {
                    ToEmailList = receipientemail.ToEmailList,
                    Body = strHtml,
                    Subject = "Valuation Quotation Creation",

                };
                await _notificationService.SendEmail(sendemaildetails, objQuatation.ValuationRequestId, objQuatation.StatusId);
            }
            catch (Exception ex)
            {

                throw ex;
            }
            return DBOperation.Success;
        
        }
    }
}
