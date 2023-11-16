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
using Microsoft.EntityFrameworkCore;
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
        private readonly IAuditLogService _auditLogService;
        private readonly IHelper _helper;
        private readonly int? _LoginUserId;

        #endregion Properties

        #region Constructor
        public ValutionRequestService(IUnitOfWork unitOfWork, IMapperFactory mapperFactory, IHelper helper, IConfiguration configuration)
        {
            _unitOfWork = unitOfWork;
            _mapperFactory = mapperFactory;

            _repository = _unitOfWork.GetRepository<ValuationRequest>();
            _configuration = configuration;
            _helper = helper;

            _LoginUserId = _helper.GetLoggedInUser()?.UserId;
        }
        #endregion Constructor


        public async Task<DataTableResponseModel> GetAll(DataTableAjaxPostModel model, string? userName, string? clientName, string? propertyName, int requestStatusId, int resourceId, int propertyTypeId, int countryId, int stateId, int cityId, string? fromDate, string? toDate)
        {
            string ColumnName = model.order.Count > 0 ? model.columns[model.order[0].column].data : string.Empty;
            //string SortDir = model.order[0]?.dir;
            string SortDir = "asc";

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
                            valuationEntity.ModifiedBy = _LoginUserId;

                            _repository.UpdateAsync(valuationEntity);
                            _repository.UpdateGraph(valuationEntity, EntityState.Modified);

                            //Do Audit Log --AUDITLOG 
                            //await _auditLogService.CreateAuditLog<ValuationRequest>(AuditActionTypeEnum.Update, OldEntity, valuationEntity, TableName, id);
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
                    valuationEntity.ModifiedBy = _LoginUserId;
                    _repository.UpdateAsync(valuationEntity);
                    _repository.UpdateGraph(OldEntity, EntityState.Modified);

                    //Do Audit Log --AUDITLOG 
                    await _auditLogService.CreateAuditLog<ValuationRequest>(AuditActionTypeEnum.Update, OldEntity, valuationEntity, TableName, model.ValuationRequestId);

                    await _unitOfWork.SaveChangesAsync();
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
                if (entityValuation.Id > 0)
                {
                    ValuationRequest OldEntity = null;
                    OldEntity = _repository.GetNoTracking(entityValuation.Id);

                    objValuation = _repository.Get(entityValuation.Id);

                    if (objValuation != null)
                    {
                        objValuation.ReferenceNo = entityValuation.ReferenceNo ?? "";
                        objValuation.OtherReferenceNo = entityValuation.OtherReferenceNo;
                        objValuation.StatusId = entityValuation.StatusId;
                        objValuation.ValuationTimeFrame = entityValuation.ValuationTimeFrame;
                        objValuation.ApproverId = entityValuation.ApproverId;
                        objValuation.ValuerId = entityValuation.ValuerId;
                        objValuation.ValuationDate = entityValuation.ValuationDate;
                        objValuation.ValuationModeId = entityValuation.ValuationModeId;
                        objValuation.PropertyId = entityValuation.PropertyId;
                        objValuation.ClientId = entityValuation.ClientId;
                        objValuation.ModifiedBy = entityValuation.ModifiedBy;
                        _repository.UpdateAsync(objValuation);
                        _repository.UpdateGraph(objValuation, EntityState.Modified);

                        await _unitOfWork.SaveChangesAsync();

                        //Do Audit Log --AUDITLOGUSER
                        await _auditLogService.CreateAuditLog<ValuationRequest>(AuditActionTypeEnum.Update, OldEntity, objValuation, MainTableName, MainTableKey); 

                        //Notification
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
                    objValuation.CreatedBy= (int)entityValuation.CreatedBy;
                    objValuation.ReferenceNo = string.Format("{0}{1}", AppConstants.ID_ValuationRequest, lastReq?.Id);
                    
                    _repository.AddAsync(objValuation);
                    await _unitOfWork.SaveChangesAsync();
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
            var _ValuationEntity = new ValuationRequestModel();
            _ValuationEntity = _mapperFactory.Get<ValuationRequest, ValuationRequestModel>(await _repository.GetAsync(id));

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


        public async Task<DBOperation> ReviewerRequestStatus(ValutionRequestForApproverModel model)
        {

            var LoginUserId = _helper.GetLoggedInUser()?.UserId;
            if (model.StatusId > 0 && model.Id > 0)
            {
                if (model.Id > 0)
                {
                    var valuationEntity = _repository.Get(model.Id);

                    valuationEntity.StatusId = model.StatusId;
                    valuationEntity.ModifiedBy = _LoginUserId;
                    valuationEntity.ModifiedDate = AppConstants.DateTime;
                    valuationEntity.ApproverComment = model.ApproverComment;
                    _repository.UpdateAsync(valuationEntity);
                    _repository.UpdateGraph(valuationEntity, EntityState.Modified);
                    await _unitOfWork.SaveChangesAsync();

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

    }

}
