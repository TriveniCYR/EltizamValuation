﻿using Eltizam.Business.Core.Interface;
using Eltizam.Business.Core.ModelMapper;
using Eltizam.Business.Models;
using Eltizam.Data.DataAccess.Core.Repositories;
using Eltizam.Data.DataAccess.Core.UnitOfWork;
using Eltizam.Data.DataAccess.Entity;
using Eltizam.Data.DataAccess.Helper;
using Eltizam.Utility;
using Eltizam.Utility.Enums;
using Eltizam.Utility.Utility;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Internal;
using Microsoft.Extensions.Configuration;
using System.Data;
using System.Data.SqlClient;
using static Eltizam.Utility.Enums.GeneralEnum;

namespace Eltizam.Business.Core.Implementation
{
    public class ValutionRequestService : IValutionRequestService
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
        }
        #endregion Constructor


        public async Task<DataTableResponseModel> GetAll(DataTableAjaxPostModel model, string? userName, string? clientName, string? propertyName, int requestStatusId, int resourceId, int propertyTypeId, int countryId, int stateId, int cityId, string? fromDate, string? toDate)
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
                new SqlParameter("UserName",                        userName),
                new SqlParameter("ClientName",                     clientName),
                new SqlParameter("PropertyName",                    propertyName),
                new SqlParameter("ValuationStatus",                 requestStatusId),
                new SqlParameter("ValuationMethod",                 resourceId),
                new SqlParameter("@PropertyTypeId",                 propertyTypeId),
                new SqlParameter("CountryId",                       countryId),
                new SqlParameter("StateId",                         stateId),
                new SqlParameter("CityId",                          cityId),
                new SqlParameter("FromDate",                        fromDate),
                new SqlParameter("ToDate",                          toDate)
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

                            var newstatusname = _statusrepository.GetAll().Where(x => x.Id == valuationEntity.StatusId).Select(x => x.StatusName).FirstOrDefault();

                            var oldstatusname = _statusrepository.GetAll().Where(x => x.Id == OldEntity.StatusId).Select(x => x.StatusName).FirstOrDefault();

                            await SenddDetailsToEmail("Request Status Change", oldstatusname, newstatusname, valuationEntity.Id, valuationEntity.ReferenceNo, valuationEntity.StatusId);
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

                    //Do Audit Log --AUDITLOG 
                    await _auditLogService.CreateAuditLog<ValuationRequest>(AuditActionTypeEnum.Update, OldEntity, valuationEntity, TableName, model.ValuationRequestId);

                    var newstatusname = _statusrepository.GetAll().Where(x => x.Id == valuationEntity.StatusId).Select(x => x.StatusName).FirstOrDefault();

                    var oldstatusname = _statusrepository.GetAll().Where(x => x.Id == OldEntity.StatusId).Select(x => x.StatusName).FirstOrDefault();

                    await SenddDetailsToEmail("Request Status Change", oldstatusname, newstatusname, valuationEntity.Id, valuationEntity.ReferenceNo, valuationEntity.StatusId);
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
                if (model.Id > 0)
                {
                    ValuationRequest OldEntity = null;
                    OldEntity = _repository.GetNoTracking(model.Id);

                    var valuationEntity = _repository.Get(model.Id);
                    var TableName = Enum.GetName(TableNameEnum.ValuationRequest);

                    valuationEntity.StatusId = model.StatusId;
                    valuationEntity.ModifiedBy = model.LogInUserId;
                    valuationEntity.ApproverComment = model.ApproverComment;

                    _repository.UpdateAsync(valuationEntity);
                    //_repository.UpdateGraph(valuationEntity, EntityState.Modified);
                    await _unitOfWork.SaveChangesAsync();

                    //Do Audit Log --AUDITLOG 
                    await _auditLogService.CreateAuditLog<ValuationRequest>(AuditActionTypeEnum.Update, OldEntity, valuationEntity, TableName, model.Id);

                    var newstatusname = _statusrepository.GetAll().Where(x => x.Id == valuationEntity.StatusId).Select(x => x.StatusName).FirstOrDefault();

                    var oldstatusname = _statusrepository.GetAll().Where(x => x.Id == OldEntity.StatusId).Select(x => x.StatusName).FirstOrDefault();

                    await SenddDetailsToEmail("Request Status Change", oldstatusname, newstatusname, valuationEntity.Id, valuationEntity.ReferenceNo, valuationEntity.StatusId);
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
                OldEntity = _repository.GetNoTracking(entityValuation.Id);

                if (entityValuation.Id > 0)
                {
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

                        //Do Audit Log --AUDITLOGUSER
                        await _auditLogService.CreateAuditLog<ValuationRequest>(AuditActionTypeEnum.Update, OldEntity, objValuation, MainTableName, MainTableKey);
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
                }

                if (objValuation.Id == 0)
                    return DBOperation.Error;

                var newstatusname = _statusrepository.GetAll().Where(x => x.Id == objValuation.StatusId).Select(x => x.StatusName).FirstOrDefault();

                var oldstatusname = _statusrepository.GetAll().Where(x => x.Id == OldEntity.StatusId).Select(x => x.StatusName).FirstOrDefault();

                await SenddDetailsToEmail("Request Status Change", oldstatusname, newstatusname, objValuation.Id, objValuation.ReferenceNo, objValuation.StatusId);
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
            _ValuationEntity = _mapperFactory.Get<ValuationRequest, ValuationRequestModel>(await _repository.GetAsync(id));
            _ValuationEntity.ValuationAssesment = new ValuationAssesmentActionModel();
            _ValuationEntity.ValuationAssesment.SiteDescription = new SiteDescriptionModel();
            _ValuationEntity.ValuationAssesment.comparableEvidenceModel = new ComparableEvidenceModel();
            _ValuationEntity.ValuationAssesment.valuationAssessementModel = new ValuationAssessementModel();
            // siteDescription = _mapperFactory.Get<SiteDescription, SiteDescriptionModel>(_siterepository.Get(x => x.ValuationRequestId == id));

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

        public async Task<bool> SenddDetailsToEmail(string subject, string? oldstatus, string? newstatus, int valuationrequestId, string referenceno, int statusid = 0)
        {
            var referencenumber = _repository.GetAll().Where(x => x.Id == valuationrequestId).Select(x => x.ReferenceNo);
            string strHtml = File.ReadAllText(@"wwwroot\Uploads\HTMLTemplates\ValuationRequest_StatusChange.html");
            strHtml = strHtml.Replace("[PValRefNoP]", referencenumber.ToString());
            strHtml = strHtml.Replace("[PDateP]", DateTime.Now.ToString());
            strHtml = strHtml.Replace("[PNewStatusP]", newstatus);
            strHtml = strHtml.Replace("[POldStatusP]", oldstatus);
            if (referenceno != null)
            {
                strHtml = strHtml.Replace("[PValRefNoP]", referenceno);
            }
            var receipientemail = _notificationService.GetToEmail(RecepientActionEnum.ValidationRequestChange.ToString(), valuationrequestId);
            var sendemaildetails = new SendEmailModel
            {
                ToEmailList = receipientemail.ToEmailList,
                Body = strHtml,
                Subject = subject,

            };
            await _notificationService.SendEmail(sendemaildetails, valuationrequestId, statusid);

            return true;
        }
    }
}
