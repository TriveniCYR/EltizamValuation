using Eltizam.Business.Core.Interface;
using Eltizam.Business.Core.ModelMapper;
using Eltizam.Business.Models;
using Eltizam.Data.DataAccess.Core.Repositories;
using Eltizam.Data.DataAccess.Core.UnitOfWork;
using Eltizam.Data.DataAccess.Entity;
using Eltizam.Data.DataAccess.Helper;
using Eltizam.Resource;
using Eltizam.Utility;
using Eltizam.Utility.Utility;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Internal;
using Microsoft.Extensions.Localization;
using Newtonsoft.Json.Linq;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using static Eltizam.Utility.Enums.GeneralEnum;

namespace Eltizam.Business.Core.Implementation
{
    public class ValutionRequestService: IValutionRequestService
    {
        #region Properties
        private readonly IUnitOfWork _unitOfWork;
        private readonly IMapperFactory _mapperFactory;
        private readonly IStringLocalizer<Errors> _stringLocalizerError;
        private readonly Microsoft.Extensions.Configuration.IConfiguration configuration;
        private IRepository<ValuationRequest> _repository { get; set; }
        //private IRepository<MasterPropertySubType> _subrepository { get; set; }
        private readonly IHelper _helper;
        private readonly int? _LoginUserId;

        #endregion Properties

        #region Constructor
        public ValutionRequestService(IUnitOfWork unitOfWork, IMapperFactory mapperFactory, IStringLocalizer<Errors> stringLocalizerError,
          IHelper helper,
           Microsoft.Extensions.Configuration.IConfiguration _configuration)
        {
            _unitOfWork = unitOfWork;
            _mapperFactory = mapperFactory;

            _repository = _unitOfWork.GetRepository<ValuationRequest>();
            configuration = _configuration;
            _helper = helper; 
            _LoginUserId = _helper.GetLoggedInUser()?.UserId;
        }
        #endregion Constructor
        public async Task<DataTableResponseModel> GetAll(DataTableAjaxPostModel model, string? userName, string? clientName, string? propertyName, int requestStatusId,int resourceId, int propertyTypeId,int countryId, int stateId, int cityId, string? fromDate, string? toDate)
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
                new SqlParameter("ToDate",                          toDate),
               
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
                if(VRIDs != null && VRIDs.Length > 0)
                {
                    int[] ids = VRIDs.Split(',').Select(int.Parse).ToArray();

                    if(ids.Length > 0)
                    {
                        foreach(int id in ids)
                        {
                            var valuationEntity = _repository.Get(id);
                            valuationEntity.ApproverId = model.ApprovorId;
                            valuationEntity.AssignRemark = model.Remarks;
                            valuationEntity.ModifiedBy = _LoginUserId;
                            valuationEntity.ModifiedDate = AppConstants.DateTime;
                            _repository.UpdateAsync(valuationEntity);
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
                    var valuationEntity = _repository.Get(model.ValuationRequestId);
                    valuationEntity.ApproverId = model.ApprovorId;
                    valuationEntity.ApproverComment = model.ApprovorComment;
                    valuationEntity.StatusId = model.StatusId;
                    valuationEntity.ModifiedBy = _LoginUserId;
                    valuationEntity.ModifiedDate = AppConstants.DateTime;
                    _repository.UpdateAsync(valuationEntity);

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

            if (entityValuation.Id > 0)
            {
                objValuation = _repository.Get(entityValuation.Id);
                var OldObjValuation = objValuation;
                if (objValuation != null)
                {
                    objValuation.ReferenceNo = entityValuation.ReferenceNo;
                    objValuation.OtherReferenceNo = entityValuation.OtherReferenceNo;
                    objValuation.StatusId = entityValuation.StatusId;
                    objValuation.ValuationTimeFrame = entityValuation.ValuationTimeFrame;
                    objValuation.ApproverId = entityValuation.ApproverId;
                    objValuation.ValuerId = entityValuation.ValuerId;
                    objValuation.ValuationDate = entityValuation.ValuationDate;
                    objValuation.ValuationModeId = entityValuation.ValuationModeId;
                    objValuation.PropertyId = entityValuation.PropertyId;
                    objValuation.ClientId = entityValuation.ClientId;
                    //objValuation.ValuerId = entityValuation.ValuerId;

                    //objValuation.CarpetAreaInSqMtr = entityValuation.CarpetAreaInSqMtr;

                    objValuation.ModifiedDate = AppConstants.DateTime;
                    objValuation.ModifiedBy = entityValuation.CreatedBy;
                    _repository.UpdateAsync(objValuation);
                    _repository.UpdateGraph(objValuation, EntityState.Modified);
                    await _unitOfWork.SaveChangesAsync();
                }
                else
                {
                    return DBOperation.NotFound;
                }
            }
            else
            {
                objValuation = _mapperFactory.Get<ValuationRequestModel, ValuationRequest>(entityValuation);
                objValuation.CreatedDate = AppConstants.DateTime;
                objValuation.CreatedBy = entityValuation.CreatedBy;
                objValuation.ModifiedDate = AppConstants.DateTime;
                objValuation.ModifiedBy = entityValuation.CreatedBy;
                _repository.AddAsync(objValuation);
            }
            await _unitOfWork.SaveChangesAsync();
            if (objValuation.Id == 0)
                return DBOperation.Error;

            return DBOperation.Success;
        }

        public async Task<ValuationRequestModel> GetById(int id)
        {
            var _ValuationEntity = new ValuationRequestModel();
            _ValuationEntity = _mapperFactory.Get<ValuationRequest, ValuationRequestModel>(await _repository.GetAsync(id));
            //_ValuationEntity.ClientTypeId = 

            //DbParameter[] osqlParameter1 =
            //{
            //        new DbParameter("PropertyId", id, SqlDbType.Int),
            //    };
            //var detailLocation = EltizamDBHelper.ExecuteSingleMappedReader<MasterPropertyDetailModel>(ProcedureMetastore.usp_PropertyLocation_GetLocationByPropertyId, DatabaseConnection.ConnString, System.Data.CommandType.StoredProcedure, osqlParameter1);



            DbParameter[] osqlParameter =
           {
                new DbParameter("Id", id, SqlDbType.Int),
            };
            var ValuationRequestDependencies = EltizamDBHelper.ExecuteMappedReader<ValuationRequestDependencies>(ProcedureMetastore.usp_ValuationRequest_GetDependencies, DatabaseConnection.ConnString, System.Data.CommandType.StoredProcedure, osqlParameter);
            //var ValuationRequestDependencies = EltizamDBHelper.ExecuteMappedReader<ValuationRequestDependencies>(ProcedureMetastore.usp_ValuationRequest_GetDependencies, DatabaseConnection.ConnString, System.Data.CommandType.StoredProcedure, osqlParameter);
            // return amenityList;
            _ValuationEntity.ClientId = ValuationRequestDependencies[0].ClientId;
            _ValuationEntity.ClientTypeId = ValuationRequestDependencies[0].ClientTypeId;
            _ValuationEntity.ClientName = ValuationRequestDependencies[0].ClientName;
            _ValuationEntity.PropertyTypeId = ValuationRequestDependencies[0].PropertyTypeId;
            _ValuationEntity.PropertyName = ValuationRequestDependencies[0].PropertyType;
            _ValuationEntity.PropertySubTypeId = ValuationRequestDependencies[0].PropertySubTypeId;
            _ValuationEntity.PropertySubType = ValuationRequestDependencies[0].PropertySubType;
            _ValuationEntity.OwnershipTypeId = ValuationRequestDependencies[0].OwnershipTypeId;
            _ValuationEntity.OwnershipType = ValuationRequestDependencies[0].OwnershipType;
            _ValuationEntity.PropertyId = ValuationRequestDependencies[0].PropertyId;
            _ValuationEntity.PropertyName = ValuationRequestDependencies[0].PropertyName;
            return _ValuationEntity;
        }


        public async Task<DBOperation> Delete(int id)
        {
            var entityValuation= _repository.Get(x => x.Id == id);

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
                    valuationEntity.ApproverComment= model.ApproverComment;
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
