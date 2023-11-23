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
using Eltizam.Utility.Utility;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Localization;
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
    public class MasterValuationFeesService : IMasterValuationFeesService
    {
        private readonly IUnitOfWork _unitOfWork;
        private readonly IMapperFactory _mapperFactory;
        //private readonly IStringLocalizer<Errors> _stringLocalizerError;
        private readonly Microsoft.Extensions.Configuration.IConfiguration configuration;
        private readonly string _dbConnection;
        private readonly IAuditLogService _auditLogService;
        private IRepository<MasterValuationFee> _repository { get; set; }
        private readonly IHelper _helper;
        public MasterValuationFeesService(IUnitOfWork unitOfWork, IMapperFactory mapperFactory,
                                  IHelper helper,
                                 Microsoft.Extensions.Configuration.IConfiguration _configuration)
        {
            _unitOfWork = unitOfWork;
            _mapperFactory = mapperFactory;

            _repository = _unitOfWork.GetRepository<MasterValuationFee>();
            configuration = _configuration;
            _helper = helper;
            _dbConnection = DatabaseConnection.ConnString;
        }

        // get all recoreds from ValuationFees list with sorting and pagination
        public async Task<DataTableResponseModel> GetAll(DataTableAjaxPostModel model) 
        { 
            string ColumnName = (model.order.Count > 0 ? model.columns[model.order[0].column].data : string.Empty);
            string SortDir = model.order[0]?.dir;  

            SqlParameter[] osqlParameter =
            {
                new SqlParameter(AppConstants.P_CurrentPageNumber,  model.start),
                new SqlParameter(AppConstants.P_PageSize,           model.length),
                new SqlParameter(AppConstants.P_SortColumn,         ColumnName),
                new SqlParameter(AppConstants.P_SortDirection,      SortDir),
                new SqlParameter(AppConstants.P_SearchText,         model.search?.value)
            }; 

            var ListRes = await _repository.GetBySP(ProcedureMetastore.usp_ValuationFees_SearchAllList, System.Data.CommandType.StoredProcedure, osqlParameter);

            //Get Pagination information
            var res = UtilityHelper.GetPaginationInfo(ListRes);

            DataTableResponseModel oDataTableResponseModel = new DataTableResponseModel(model.draw, res.Item1, res.Item1, ListRes);

            return oDataTableResponseModel;
        }
        public async Task<MasterValuationFeesModel> GetById(int id)
        {
            var _ValuationFeesEntity = new MasterValuationFeesModel();
            _ValuationFeesEntity = _mapperFactory.Get<MasterValuationFee, MasterValuationFeesModel>(await _repository.GetAsync(id));

            return _ValuationFeesEntity;
        }
        public async Task<DBOperation> Upsert(MasterValuationFeesModel entityValuationFees)
        {

            MasterValuationFee objValuationFees;
            string MainTableName = Enum.GetName(TableNameEnum.Master_ValuationFee);
            int MainTableKey = entityValuationFees.Id;

            if (entityValuationFees.Id > 0)
            {
                MasterValuationFee OldEntity = null;
                OldEntity = _repository.GetNoTracking(entityValuationFees.Id);

                objValuationFees = _repository.Get(entityValuationFees.Id);
                //var OldEntity = objValuationFees;
                if (objValuationFees != null)
                {
                    objValuationFees.PropertyTypeId = entityValuationFees.PropertyTypeId;
                    objValuationFees.PropertySubTypeId = entityValuationFees.PropertySubTypeId;
                    objValuationFees.OwnershipTypeId = entityValuationFees.OwnershipTypeId;
                    objValuationFees.CarpetAreaInSqFt = entityValuationFees.CarpetAreaInSqFt;
                    objValuationFees.CarpetAreaInSqMtr = entityValuationFees.CarpetAreaInSqMtr;
                    objValuationFees.ClientTypeId = entityValuationFees.ClientTypeId;
                    objValuationFees.ValuationType = entityValuationFees.ValuationType;
                    objValuationFees.ValuationFeeTypeId = entityValuationFees.ValuationFeeTypeId;
                    objValuationFees.ValuationFees = entityValuationFees.ValuationFees;
                    objValuationFees.Vat = entityValuationFees.Vat;
                    objValuationFees.OtherCharges = entityValuationFees.OtherCharges;
                    objValuationFees.TotalValuationFees = entityValuationFees.TotalValuationFees;
                    objValuationFees.FixedvaluationFees = entityValuationFees.FixedvaluationFees;
                    objValuationFees.ModifiedDate = AppConstants.DateTime;
                    objValuationFees.ModifiedBy = entityValuationFees.ModifiedBy;
                    _repository.UpdateAsync(objValuationFees);
                    //_repository.UpdateGraph(objValuationFees, EntityState.Modified);

                    await _unitOfWork.SaveChangesAsync();

                    //Do Audit Log --AUDITLOGUSER
                    await _auditLogService.CreateAuditLog<MasterValuationFee>(AuditActionTypeEnum.Update, OldEntity, objValuationFees, MainTableName, MainTableKey);

                }
                else
                {
                    return DBOperation.NotFound;
                }
            }
            else
            {
                objValuationFees = _mapperFactory.Get<MasterValuationFeesModel, MasterValuationFee>(entityValuationFees);
                objValuationFees.CreatedDate = AppConstants.DateTime;
                objValuationFees.CreatedBy = entityValuationFees.CreatedBy;
                objValuationFees.ModifiedDate = AppConstants.DateTime;
                objValuationFees.CreatedBy = entityValuationFees.CreatedBy;
                _repository.AddAsync(objValuationFees);
            }
            await _unitOfWork.SaveChangesAsync();
            if (objValuationFees.Id == 0)
                return DBOperation.Error;

            return DBOperation.Success;
        }

        public async Task<DBOperation> Delete(int id)
        {
            var entityValuationFees = _repository.Get(x => x.Id == id);

            if (entityValuationFees == null)
                return DBOperation.NotFound;

            _repository.Remove(entityValuationFees);

            await _unitOfWork.SaveChangesAsync();

            return DBOperation.Success;
        }
    }
}
