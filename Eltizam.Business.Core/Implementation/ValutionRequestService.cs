using Eltizam.Business.Core.Interface;
using Eltizam.Business.Core.ModelMapper;
using Eltizam.Business.Models;
using Eltizam.Data.DataAccess.Core.Repositories;
using Eltizam.Data.DataAccess.Core.UnitOfWork;
using Eltizam.Data.DataAccess.Entity;
using Eltizam.Data.DataAccess.Helper;
using Eltizam.Utility;
using Eltizam.Utility.Enums;
using Eltizam.Utility.Utility;
using Microsoft.Extensions.Configuration;
using System.Data;
using System.Data.SqlClient;
using static Eltizam.Utility.Enums.GeneralEnum;

namespace Eltizam.Business.Core.Implementation
{
    public class ValutionRequestService : IValuationRequestService
    {
        #region Properties

        private readonly IUnitOfWork _unitOfWork;
        private readonly IMapperFactory _mapperFactory;
        private readonly IConfiguration _configuration;
        private IRepository<ValuationRequest> _repository { get; set; }
        private IRepository<SiteDescription> _siterepository { get; set; }
        private IRepository<ComparableEvidence> _evidencerepository { get; set; }
        private IRepository<ValuationAssesment> _assesmenterepository { get; set; }
        private IRepository<ValuationRequestStatus> _statusrepository { get; set; }
        private IRepository<ValuationQuotation> _valuationQuotationrepository { get; set; }
        private IRepository<ValuationRequestApproverLevel> _valuationRequestApproverLevel { get; set; }
        private readonly IAuditLogService _auditLogService;
        private readonly IHelper _helper;
        private readonly INotificationService _notificationService;

        #endregion Properties

        #region Constructor
        public ValutionRequestService(IAuditLogService auditLogService, IUnitOfWork unitOfWork, IMapperFactory mapperFactory, IHelper helper, IConfiguration configuration, INotificationService notificationService)
        {
            _unitOfWork = unitOfWork;
            _mapperFactory = mapperFactory;
            _statusrepository = _unitOfWork.GetRepository<ValuationRequestStatus>();
            _repository = _unitOfWork.GetRepository<ValuationRequest>();
            _siterepository = _unitOfWork.GetRepository<SiteDescription>();
            _evidencerepository = _unitOfWork.GetRepository<ComparableEvidence>();
            _assesmenterepository = _unitOfWork.GetRepository<ValuationAssesment>();
            _configuration = configuration;
            _helper = helper;
            _notificationService = notificationService;
            _auditLogService = auditLogService;
            _valuationQuotationrepository = _unitOfWork.GetRepository<ValuationQuotation>();
            _valuationRequestApproverLevel = _unitOfWork.GetRepository<ValuationRequestApproverLevel>();
        }
        #endregion Constructor


        public async Task<DataTableResponseModel> GetAll(DataTableAjaxPostModel model, ValuationRequestFilters filters) // string? userName, string? clientName, string? propertyName, int requestStatusId, int resourceId, int propertyTypeId, int countryId, int stateId, int cityId, string? fromDate, string? toDate, string? valRef)
        {
            string ColumnName = model.order.Count > 0 ? model.columns[model.order[0].column].data : string.Empty;
            string SortDir = model.order[0]?.dir;
            //  string SortDir = "asc";

            SqlParameter[] osqlParameter =
            {
                new SqlParameter(AppConstants.P_CurrentPageNumber,  model.start),
                new SqlParameter(AppConstants.P_PageSize,           model.length),
                new SqlParameter(AppConstants.P_SortColumn,         ColumnName),
                new SqlParameter(AppConstants.P_SortDirection,      SortDir),
                new SqlParameter(AppConstants.P_SearchText,         model.search?.value),
                 new SqlParameter(AppConstants.LogInUserId,          filters.logInUserId),
                new SqlParameter("UserName",                        filters.userName),
                new SqlParameter("ClientName",                      filters.clientName),
                new SqlParameter("PropertyName",                    filters.propertyName),
                new SqlParameter("ValuationStatus",                 filters.requestStatusId),
                new SqlParameter("ValuationMethod",                 filters.resourceId),
                new SqlParameter("@PropertyTypeId",                 filters.propertyTypeId),
                new SqlParameter("CountryId",                       filters.countryId),
                new SqlParameter("StateId",                         filters.stateId),
                new SqlParameter("CityId",                          filters.cityId),
                new SqlParameter("FromDate",                        filters.fromDate),
                new SqlParameter("ToDate",                          filters.toDate),
                new SqlParameter("ValRef",                          filters.valRef)               
            };

            var Results = await _repository.GetBySP(ProcedureMetastore.usp_Valution_GetValuationList, CommandType.StoredProcedure, osqlParameter);

            //Get Pagination information
            var res = UtilityHelper.GetPaginationInfo(Results);

            DataTableResponseModel oDataTableResponseModel = new DataTableResponseModel(model.draw, res.Item1, res.Item1, Results.DataTableToList<ValutionRequestListModel>());
            return oDataTableResponseModel;
        }

        public async Task<DBOperation> AssignApprover(AssignApprovorRequestModel model)
        {
            var VRIDs = model.RequestIds;
            if (model.ApprovorId > 0)
            {
                if (VRIDs != null && VRIDs.Length > 0)
                {
                    int[] ids = VRIDs.Split(',').Select(int.Parse).ToArray();

                    if (ids.Length > 0)
                    {
                        foreach (int id in ids)
                        {
                            ValuationRequest OldEntity = null;
                            OldEntity = _repository.GetNoTracking(id);
                            var TableName = Enum.GetName(TableNameEnum.ValuationRequest);

                            var valuationEntity = _repository.Get(id);
                            valuationEntity.ApproverId = model.ApprovorId;
                            valuationEntity.AssignRemark = model.Remarks;
                            valuationEntity.ModifiedBy = model.LogInUserId;

                            _repository.UpdateAsync(valuationEntity);
                            //_repository.UpdateGraph(valuationEntity, EntityState.Modified);

                            //Do Audit Log --AUDITLOG 
                            await _auditLogService.CreateAuditLog<ValuationRequest>(AuditActionTypeEnum.Update, OldEntity, valuationEntity, TableName, id);

                            /*
                                var newstatusname = _statusrepository.GetAll().Where(x => x.Id == valuationEntity.StatusId).Select(x => x.StatusName).FirstOrDefault(); 
                                var oldstatusname = _statusrepository.GetAll().Where(x => x.Id == OldEntity.StatusId).Select(x => x.StatusName).FirstOrDefault(); 
                                await SenddDetailsToEmail("Request Status Change", oldstatusname, newstatusname, valuationEntity.Id, valuationEntity.ReferenceNo, valuationEntity.StatusId);
                            */
                        }
                        await _unitOfWork.SaveChangesAsync();
                    }

                    return DBOperation.Success;
                }
            }
            else
            {
                return DBOperation.NotFound;
            }
            return DBOperation.Success;
        }

        public async Task<DBOperation> AssignApproverStatus(ApprovorStatusRequestModel model)
        {
            if (model.ApprovorId > 0 && model.ValuationRequestId > 0)
            {
                if (model.StatusId > 0)
                {
                    ValuationRequest OldEntity = null;
                    OldEntity = _repository.GetNoTracking(model.ValuationRequestId);
                    var TableName = Enum.GetName(TableNameEnum.ValuationRequest);

                    var valuationEntity = _repository.Get(model.ValuationRequestId);
                    valuationEntity.ApproverId = model.ApprovorId;
                    valuationEntity.ApproverComment = model.ApprovorComment;
                    valuationEntity.StatusId = model.StatusId;
                    valuationEntity.ModifiedBy = model.LogInUserId;

                    _repository.UpdateAsync(valuationEntity);
                    //_repository.UpdateGraph(OldEntity, EntityState.Modified);

                    await _unitOfWork.SaveChangesAsync();

                    try
                    {
                        //Do Audit Log --AUDITLOG 
                        await _auditLogService.CreateAuditLog<ValuationRequest>(AuditActionTypeEnum.Update, OldEntity, valuationEntity, TableName, model.ValuationRequestId);

                        var newstatusname = _statusrepository.GetAll().Where(x => x.Id == valuationEntity.StatusId).Select(x => x.StatusName).FirstOrDefault();
                        var oldstatusname = _statusrepository.GetAll().Where(x => x.Id == OldEntity.StatusId).Select(x => x.StatusName).FirstOrDefault();
                        if (newstatusname != oldstatusname)
                            await SenddDetailsToEmail(RecepientActionEnum.ValuationStatusChanged, valuationEntity.Id);
                    }
                    catch (Exception ex)
                    {

                    }
                }
                else
                {
                    return DBOperation.NotFound;
                }
            }
            else
            {
                return DBOperation.NotFound;
            }
            return DBOperation.Success;
        }

        public async Task<DBOperation> ReviewerRequestStatus(ValutionRequestForApproverModel model)
        {

            if (model.StatusId > 0 && model.Id > 0)
            {
                if (model.StatusId > 0)
                {
                    var d = _valuationRequestApproverLevel.Get(a => a.ValuationRequestId == model.Id && a.StatusId == null);
                    if (d != null)
                    {
                        ValuationRequestApproverLevel oldentity = null;
                        //oldentity = _valuationRequestApproverLevel.GetNoTracking(model.Id);
                        oldentity = _valuationRequestApproverLevel.Get(x=>x.ValuationRequestId==model.Id);
                        
                        oldentity.ApproverComment = model.ApproverComment;
                        oldentity.StatusId = model.StatusId;
                        oldentity.ModifiedBy = d.ModifiedBy;
                        _valuationRequestApproverLevel.UpdateAsync(oldentity);
                        await _unitOfWork.SaveChangesAsync();

                    }
                    else
                    {

                        ValuationRequest OldEntity = null;
                        OldEntity = _repository.GetNoTracking(model.Id);
                        var TableName = Enum.GetName(TableNameEnum.ValuationRequest);

                        var valuationEntity = _repository.Get(model.Id);
                         valuationEntity.ApproverComment = model.ApproverComment;
                        valuationEntity.StatusId = model.StatusId;
                        valuationEntity.ModifiedBy = 2;

                        _repository.UpdateAsync(valuationEntity);
                        //_repository.UpdateGraph(OldEntity, EntityState.Modified);

                        await _unitOfWork.SaveChangesAsync();

                        //try
                        //{
                        //    //Do Audit Log --AUDITLOG 
                        //    await _auditLogService.CreateAuditLog<ValuationRequest>(AuditActionTypeEnum.Update, OldEntity, valuationEntity, TableName, model.Id);

                        //    var newstatusname = _statusrepository.GetAll().Where(x => x.Id == valuationEntity.StatusId).Select(x => x.StatusName).FirstOrDefault();
                        //    var oldstatusname = _statusrepository.GetAll().Where(x => x.Id == OldEntity.StatusId).Select(x => x.StatusName).FirstOrDefault();
                        //    if (newstatusname != oldstatusname)
                        //        await SenddDetailsToEmail(RecepientActionEnum.ValuationStatusChanged, valuationEntity.Id);
                        //}
                        //catch (Exception ex)
                        //{

                        //}
                    }
                }
                else
                {
                    return DBOperation.NotFound;
                }
            }
            else
            {
                return DBOperation.NotFound;
            }
            return DBOperation.Success;
        }

        public async Task<List<ValuationMethod>> GetAllValuationMethod()
        {

            var lstStf = EltizamDBHelper.ExecuteMappedReader<ValuationMethod>(ProcedureMetastore.usp_ValuationMethod_AllList,
                          DatabaseConnection.ConnString, CommandType.StoredProcedure, null);

            return lstStf;
        }

        public async Task<DBOperation> Upsert(ValuationRequestModel entityValuation)
        {
            ValuationRequest objValuation;
            string MainTableName = Enum.GetName(TableNameEnum.ValuationRequest);
            int MainTableKey = entityValuation.Id;
            
            try
            {
                ValuationRequest OldEntity = null;

                if (entityValuation.Id > 0)
                {
                    if (entityValuation.ValuationApprovalValues != null)
                    {
                        var quotid = _valuationQuotationrepository.GetAll().Where(x => x.ValuationRequestId == entityValuation.Id).Select(x => x.Id).First();
                await UpsertApproverLevels(entityValuation.Id, 1, quotid, entityValuation.ValuationApprovalValues);
                    }

                    OldEntity = _repository.GetNoTracking(entityValuation.Id);
                    objValuation = _repository.Get(entityValuation.Id);

                    if (objValuation != null)
                    {
                        objValuation.ReferenceNo = entityValuation.ReferenceNo ?? "";
                        objValuation.OtherReferenceNo = entityValuation.OtherReferenceNo;
                        objValuation.StatusId = entityValuation.StatusId;
                        objValuation.ValuationTimeFrame = entityValuation.ValuationTimeFrame;
                        objValuation.ApproverId = entityValuation.ApproverId == 0 ? null : entityValuation.ApproverId;
                        objValuation.ValuerId = entityValuation.ValuerId == 0 ? null : entityValuation.ValuerId;
                        objValuation.ValuationDate = entityValuation.ValuationDate;
                        objValuation.ValuationModeId = entityValuation.ValuationModeId;
                        objValuation.PropertyId = entityValuation.PropertyId;
                        objValuation.ClientId = entityValuation.ClientId;
                        objValuation.ModifiedBy = entityValuation.ModifiedBy;
                        _repository.UpdateAsync(objValuation);
                        //_repository.UpdateGraph(objValuation, EntityState.Modified);

                        await _unitOfWork.SaveChangesAsync();

                        try
                        {
                            var newstatusname = _statusrepository.GetAll().Where(x => x.Id == objValuation.StatusId).Select(x => x.StatusName).FirstOrDefault();
                            var oldstatusname = _statusrepository.GetAll().Where(x => x.Id == OldEntity.StatusId).Select(x => x.StatusName).FirstOrDefault();

                            if (newstatusname != oldstatusname)
                                await SenddDetailsToEmail(RecepientActionEnum.ValuationStatusChanged, objValuation.Id);

                            //Do Audit Log --AUDITLOGUSER
                            await _auditLogService.CreateAuditLog<ValuationRequest>(AuditActionTypeEnum.Update, OldEntity, objValuation, MainTableName, MainTableKey);
                        }
                        catch (Exception ex)
                        {
                        }
                    }
                    else
                    {
                        return DBOperation.NotFound;
                    }
                }
                else
                {
                    var lastReq = _repository.GetAll().OrderByDescending(a => a.Id).FirstOrDefault();

                    objValuation = _mapperFactory.Get<ValuationRequestModel, ValuationRequest>(entityValuation);
                    objValuation.CreatedBy = (int)entityValuation.CreatedBy;
                    objValuation.ReferenceNo = string.Format("{0}{1}", AppConstants.ID_ValuationRequest, lastReq?.Id + 1);
                    objValuation.ApproverId = objValuation.ApproverId == 0 ? null : objValuation.ApproverId;
                    objValuation.ValuerId = objValuation.ValuerId == 0 ? null : objValuation.ValuerId;

                    _repository.AddAsync(objValuation);
                    await _unitOfWork.SaveChangesAsync();

                    try
                    {
                        await SenddDetailsToEmail(RecepientActionEnum.ValuationCreated, objValuation.Id);
                    }
                    catch (Exception ex)
                    {
                    }
                }

                if (objValuation.Id == 0)
                    return DBOperation.Error;

                return DBOperation.Success;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }


        public async Task<ValuationRequestModel> GetById(int id)
        {
            var sitetableName = Enum.GetName(TableNameEnum.SiteDescription);
            var evidencetableName = Enum.GetName(TableNameEnum.Comparable_Evidence);
            var assesmenttableName = Enum.GetName(TableNameEnum.Valuation_Assessement);
            var _ValuationEntity = new ValuationRequestModel();

            var _assesmentAction = new ValuationAssesmentActionModel();
            var siteDescription = new SiteDescriptionModel();
            var compevidence = new ComparableEvidenceModel();
            var assement = new ValuationAssessementModel();
            var approvellevel = new List<ValuationRequestApproverLevelModel>();
            _ValuationEntity = _mapperFactory.Get<ValuationRequest, ValuationRequestModel>(await _repository.GetAsync(id));
            _ValuationEntity.ValuationAssesment = new ValuationAssesmentActionModel();
            _ValuationEntity.ValuationAssesment.SiteDescription = new SiteDescriptionModel();
            _ValuationEntity.ValuationAssesment.comparableEvidenceModel = new ComparableEvidenceModel();
            _ValuationEntity.ValuationAssesment.valuationAssessementModel = new ValuationAssessementModel();
            _ValuationEntity.ValuationRequestApproverLevel = new List<ValuationRequestApproverLevelModel>();

            DbParameter[] osqlParameter =
            {
                new DbParameter("Id", id, SqlDbType.Int),
            };

            var res = EltizamDBHelper.ExecuteMappedReader<ValuationRequestDependencies>(ProcedureMetastore.usp_ValuationRequest_GetDependencies,
                      DatabaseConnection.ConnString, CommandType.StoredProcedure, osqlParameter).FirstOrDefault();

            if (res != null)
            {
                _ValuationEntity.ClientId = res.ClientId;
                _ValuationEntity.ClientTypeId = res.ClientTypeId;
                _ValuationEntity.ClientName = res.ClientName;
                _ValuationEntity.PropertyTypeId = res.PropertyTypeId;
                _ValuationEntity.PropertyName = res.PropertyType;
                _ValuationEntity.PropertySubTypeId = res.PropertySubTypeId;
                _ValuationEntity.PropertySubType = res.PropertySubType;
                _ValuationEntity.OwnershipTypeId = res.OwnershipTypeId;
                _ValuationEntity.OwnershipType = res.OwnershipType;
                _ValuationEntity.PropertyId = res.PropertyId;
                _ValuationEntity.PropertyName = res.PropertyName;
                _ValuationEntity.LocationCountryId = res.LocationCountryId;
                _ValuationEntity.LocationStateId = res.LocationStateId;
                _ValuationEntity.LocationCityId = res.LocationCityId;

                siteDescription = _mapperFactory.Get<SiteDescription, SiteDescriptionModel>(_siterepository.Get(x => x.ValuationRequestId == id));
                approvellevel = await GetApproverLevel(0,id);
                _ValuationEntity.ValuationRequestApproverLevel = approvellevel; 
                if (siteDescription != null)
                {
                    _ValuationEntity.ValuationAssesment.SiteDescription = siteDescription;
                    DbParameter[] osqlParameter2 =
               {
                    new DbParameter(AppConstants.TableKeyId, siteDescription.Id, SqlDbType.Int),
                    new DbParameter(AppConstants.TableName,  sitetableName, SqlDbType.VarChar),
                };

                    var siteDocuments = EltizamDBHelper.ExecuteMappedReader<MasterDocumentModel>(ProcedureMetastore.usp_Document_GetDocumentByTableKeyId,
                                        DatabaseConnection.ConnString, System.Data.CommandType.StoredProcedure, osqlParameter2);
                    if (siteDocuments != null)
                    {
                        _ValuationEntity.ValuationAssesment.SiteDescription.Documents = siteDocuments;
                    }

                }


                //comprable
                compevidence = _mapperFactory.Get<ComparableEvidence, ComparableEvidenceModel>(_evidencerepository.Get(x => x.RequestId == id));

                if (compevidence != null)
                {

                    _ValuationEntity.ValuationAssesment.comparableEvidenceModel = compevidence;
                    DbParameter[] osqlParameter3 =
                    {
                        new DbParameter(AppConstants.TableKeyId, compevidence.Id, SqlDbType.Int),
                        new DbParameter(AppConstants.TableName,  evidencetableName, SqlDbType.VarChar),
                    };

                    var compDocument = EltizamDBHelper.ExecuteMappedReader<MasterDocumentModel>(ProcedureMetastore.usp_Document_GetDocumentByTableKeyId,
                                        DatabaseConnection.ConnString, System.Data.CommandType.StoredProcedure, osqlParameter3);
                    if (compDocument != null)
                    {
                        _ValuationEntity.ValuationAssesment.comparableEvidenceModel.Documents = compDocument;
                    }
                }

                /////Assesment 
                assement = _mapperFactory.Get<ValuationAssesment, ValuationAssessementModel>(_assesmenterepository.Get(x => x.RequestId == id));

                if (assement != null)
                {

                    _ValuationEntity.ValuationAssesment.valuationAssessementModel = assement;
                    DbParameter[] osqlParameter4 =
               {
                    new DbParameter(AppConstants.TableKeyId, compevidence.Id, SqlDbType.Int),
                    new DbParameter(AppConstants.TableName,  assesmenttableName, SqlDbType.VarChar),
                };

                    var assesmentDocument = EltizamDBHelper.ExecuteMappedReader<MasterDocumentModel>(ProcedureMetastore.usp_Document_GetDocumentByTableKeyId,
                                        DatabaseConnection.ConnString, System.Data.CommandType.StoredProcedure, osqlParameter4);
                    if (assesmentDocument != null)
                    {
                        _ValuationEntity.ValuationAssesment.valuationAssessementModel.Documents = assesmentDocument;
                    }
                }

                
            }

            return _ValuationEntity;
        }


        public async Task<DBOperation> Delete(int id)
        {
            var entityValuation = _repository.Get(x => x.Id == id);

            if (entityValuation == null)
                return DBOperation.NotFound;

            _repository.Remove(entityValuation);

            await _unitOfWork.SaveChangesAsync();

            return DBOperation.Success;
        }

        public async Task<bool> SenddDetailsToEmail(RecepientActionEnum subjectEnum, int valuationrequestId)
        {
            try
            { 
                var notificationModel = _notificationService.GetValuationNotificationData(subjectEnum, valuationrequestId);  

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

                await _notificationService.SendEmail(notificationModel); 
                return true;
            }
            catch (Exception)
            {
                return false;
            }
        }


        public async Task<DBOperation> UpsertApproverLevels(int ValReqId, int CreatedBy, int ValQuotId, string RequestData)
        {
            DbParameter[] osqlParameter =
            {
                new DbParameter("ValReqId", ValReqId, SqlDbType.Int),
                new DbParameter("CreatedBy", CreatedBy, SqlDbType.Int),
                 new DbParameter("ValQuotId", ValQuotId, SqlDbType.Int),
                 new DbParameter("RequestData", RequestData, SqlDbType.VarChar),
            };
             EltizamDBHelper.ExecuteNonQuery(ProcedureMetastore.usp_ValuationRequest_UpsertApproverLevels, DatabaseConnection.ConnString, CommandType.StoredProcedure, osqlParameter);

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
