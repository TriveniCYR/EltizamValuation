using Eltizam.Business.Core.Interface;
using Eltizam.Business.Core.ModelMapper;
using Eltizam.Business.Models;
using Eltizam.Data.DataAccess.Core.Repositories;
using Eltizam.Data.DataAccess.Core.UnitOfWork;
using Eltizam.Data.DataAccess.Entity;
using Eltizam.Data.DataAccess.Helper;
using Eltizam.Utility;
using Eltizam.Utility.Enums;
using Microsoft.AspNetCore.Hosting;
using System.Data;
using System.Data.SqlClient;
using System.Dynamic;
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
        private IRepository<ValuationRequestApproverLevel> _repositoryApproverLevel { get; set; }
        private readonly IHelper _helper;

        private readonly IAuditLogService _auditLogService;
        private readonly int? _LoginUserId;
        private readonly INotificationService _notificationService;
        private readonly IHostingEnvironment _hostingEnvironment;
        private readonly IRepository<MasterUser> _masteruserrepository;
        private IRepository<MasterValuationStatus> _statusrepository { get; set; }
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
            _statusrepository = _unitOfWork.GetRepository<MasterValuationStatus>();
            _repositoryApproverLevel = _unitOfWork.GetRepository<ValuationRequestApproverLevel>();
        }

        #endregion Constructor


        public async Task<dynamic> GetValuationPDFData(int valId)
        {
            SqlParameter[] osqlParameter =
            {
                new SqlParameter("@Id", valId)
            };

            DataSet dsCommercial = await _repository.GetDataSetBySP("usp_ValuationRequest_ReportData", System.Data.CommandType.StoredProcedure, osqlParameter);

            dynamic pdfObjects = new ExpandoObject();
            pdfObjects.ValuationRequest = dsCommercial.Tables[0];      
            return dsCommercial;
        }

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


        public async Task<DBOperation> QuatationDelete(int id, int? by)
        {
            try
            {
                var applevels = _repositoryApproverLevel.GetAllAsync(a => a.ValuationQuotationId == id).Result.ToList();

                if (applevels != null && applevels.Count > 0)
                {
                    foreach (var applevel in applevels)
                    {
                        //Delete Approver level for quotation
                        var applevl = _repositoryApproverLevel.Get(x => x.Id == applevel.Id);

                        _repositoryApproverLevel.Remove(applevl);
                        await _unitOfWork.SaveChangesAsync();
                    }
                }

                
                //Delete quotations
                var entityQuatation = _repository.Get(x => x.Id == id); 
                if (entityQuatation == null)
                    return DBOperation.NotFound;

                _repository.Remove(entityQuatation); 
                await _unitOfWork.SaveChangesAsync();


                return DBOperation.Success;
            }
            catch (Exception ex)
            { 
                throw ex;
            }
        }


        public async Task<DBOperation> Upsert(ValuationQuatationListModel entityQuatation)
        {

            ValuationQuotation objQuatation;
            MasterDocument objDocument;
            ValuationRequestApproverLevel objApproverLevel;

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
                    objQuatation.ValuationFee = (decimal)entityQuatation.ValuationFee;
                    objQuatation.Vat = (decimal)entityQuatation.Vat;
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

                var id = string.Format("{0}-{1}", AppConstants.ID_QuotationsRequest, entityQuatation.ValuationRequestId);
                objQuatation.ReferenceNo = string.Format("{0}{1}", id, lastReq?.Id + 1);
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
                        objDocument.CreatedBy = entityQuatation.CreatedBy;

                        _repositoryDocument.AddAsync(objDocument);
                        await _unitOfWork.SaveChangesAsync();
                    }
                }
            }
            if (entityQuatation.ApproverIds != "" && entityQuatation.ApproverIds != null)
            {
                DbParameter[] osqlParameter =
                {
                    new DbParameter("ValReqId", entityQuatation.ValuationRequestId, SqlDbType.Int),

                    new DbParameter("CreatedBy", entityQuatation.CreatedBy, SqlDbType.Int),
                     new DbParameter("ValQuotId", objQuatation.Id, SqlDbType.Int),
                     new DbParameter("RequestData", entityQuatation.ApproverIds, SqlDbType.VarChar),
                };

                EltizamDBHelper.ExecuteNonQuery(ProcedureMetastore.usp_ValuationRequest_UpsertApproverLevels, DatabaseConnection.ConnString, CommandType.StoredProcedure, osqlParameter);

            }
            try
            {
                var statusid = _statusrepository.GetAll().Where(x => x.Status == "Quoted").Select(x => x.Id).FirstOrDefault();
                _notificationService.UpdateValuationRequestStatus(statusid, objQuatation.ValuationRequestId);

                string strHtml = File.ReadAllText(@"wwwroot\Uploads\HTMLTemplates\ValuationRequest_QuotationCreate.html");

                strHtml = strHtml.Replace("[PDateP]", objQuatation.CreatedDate.ToString("dd-MMM-yyyy"));
                strHtml = strHtml.Replace("[ValuationFees]", objQuatation.ValuationFee.ToString());
                strHtml = strHtml.Replace("[VAT]", objQuatation.Vat.ToString());
                strHtml = strHtml.Replace("[OtherCharges]", objQuatation.OtherCharges.ToString());
                strHtml = strHtml.Replace("[ValuationInstructorCharges]", objQuatation.InstructorCharges.ToString());
                strHtml = strHtml.Replace("[Discount]", objQuatation.Discount.ToString());
                strHtml = strHtml.Replace("[TotalevaluationFees]", objQuatation.TotalFee.ToString());

                var notificationModel = _notificationService.GetValuationNotificationData(RecepientActionEnum.QuaotationCreation, objQuatation.ValuationRequestId);
                notificationModel.Subject = EnumHelper.GetDescription(RecepientActionEnum.QuaotationCreation);
                notificationModel.Body = strHtml;

                await _notificationService.SendEmail(notificationModel);
            }
            catch (Exception ex)
            {
                throw ex;
            }

            return DBOperation.Success;
        }

        public async Task<List<ValuationRequestApproverLevelModel>> GetApproverLevel(decimal Amount, int ValReqId)
        {
            DbParameter[] osqlParameter =
            {
                new DbParameter("Amount", Amount, SqlDbType.Decimal),
                new DbParameter("ValReqId", ValReqId, SqlDbType.Int),
            };

            var lstStf = EltizamDBHelper.ExecuteMappedReader<ValuationRequestApproverLevelModel>(ProcedureMetastore.usp_ValuationRequest_ApproverLevel, DatabaseConnection.ConnString, CommandType.StoredProcedure, osqlParameter);

            return lstStf;
        }

    }
}
