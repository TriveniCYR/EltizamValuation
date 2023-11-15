using Eltizam.Business.Core.Interface;
using Eltizam.Business.Core.ModelMapper;
using Eltizam.Business.Models;
using Eltizam.Data.DataAccess.Core.Repositories;
using Eltizam.Data.DataAccess.Core.UnitOfWork;
using Eltizam.Data.DataAccess.Entity;
using Eltizam.Data.DataAccess.Helper;
using Eltizam.Resource;
using Eltizam.Utility.Enums;
using Eltizam.Utility.Utility;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.Localization;
using System.Data;
using System.Data.SqlClient;
using static Eltizam.Utility.Enums.GeneralEnum;

namespace Eltizam.Business.Core.Implementation
{
    public class MasterLocationService : IMasterLocationService
    {
        private readonly IUnitOfWork _unitOfWork;
        private readonly IMapperFactory _mapperFactory;
        private readonly IStringLocalizer<Errors> _stringLocalizerError;
        private readonly IConfiguration configuration;


        private IRepository<MasterLocation> _repository { get; set; }
        private readonly IHelper _helper;
        private IRepository<EmailLogHistory> _emailLog { get; set; }
        private readonly IAuditLogService _auditLogService;
        private readonly int? _LoginUserId;

        public MasterLocationService(IUnitOfWork unitOfWork, IMapperFactory mapperFactory, IHelper helper, IConfiguration _configuration, IAuditLogService auditLogService)
        {
            _unitOfWork = unitOfWork;
            _mapperFactory = mapperFactory;

            _repository = _unitOfWork.GetRepository<MasterLocation>();
            configuration = _configuration;
            _helper = helper;
            _auditLogService = auditLogService;
        }

        // get all recoreds from Location list with sorting and pagination
        //public async Task<DataTableResponseModel> GetAll(DataTableAjaxPostModel model)
        //{
        //    var _dbParams = new[]
        //     {
        //       //  new DbParameter("Id", 0,SqlDbType.Int),
        //         new DbParameter("PageSize", model.length, SqlDbType.Int),
        //         new DbParameter("PageNumber", model.start, SqlDbType.Int),
        //         new DbParameter("OrderClause", "LocationName", SqlDbType.VarChar),
        //         new DbParameter("ReverseSort", 1, SqlDbType.Int)
        //     };

        //    int _count = 0;
        //    var lstStf = EltizamDBHelper.ExecuteMappedReaderWithOutputParameter<MasterLocationEntity>(ProcedureMetastore.usp_Location_SearchAllList,

        //     DatabaseConnection.ConnString, out _count, CommandType.StoredProcedure, _dbParams); 

        //    DataTableResponseModel oDataTableResponseModel = new DataTableResponseModel(model.draw, _count, 0, lstStf); 
        //    return oDataTableResponseModel;
        //    }
        public async Task<DataTableResponseModel> GetAll(DataTableAjaxPostModel model)
        {
            //  string ColumnName = model.order.Count > 0 ? model.columns[model.order[0].column].data : string.Empty;
            //   string SortDir = model.order[0]?.dir;

            SqlParameter[] osqlParameter =
            {
                new SqlParameter(AppConstants.P_CurrentPageNumber,  model.start),
                new SqlParameter(AppConstants.P_PageSize,           model.length),
                new SqlParameter(AppConstants.P_SortColumn,       "ID"),
                new SqlParameter(AppConstants.P_SortDirection,      "ASC"),
                new SqlParameter(AppConstants.P_SearchText,         model.search?.value)
            };

            var Results = await _repository.GetBySP(ProcedureMetastore.usp_Location_SearchAllList, CommandType.StoredProcedure, osqlParameter);
            //Get Pagination information
            var res = UtilityHelper.GetPaginationInfo(Results);

            DataTableResponseModel oDataTableResponseModel = new DataTableResponseModel(model.draw, res.Item1, res.Item1, Results.DataTableToList<MasterLocationEntity>());

            return oDataTableResponseModel;
        }
        public async Task<MasterLocationEntity> GetById(int id)
        {
            var _LocationEntity = new MasterLocationEntity();
            _LocationEntity = _mapperFactory.Get<MasterLocation, MasterLocationEntity>(await _repository.GetAsync(id));

            return _LocationEntity;
        }

        public async Task<DBOperation> AddUpdateLocationClient(MasterLocationEntity entityLocation)
        {

            MasterLocation objLocation;
            string MainTableName = Enum.GetName(TableNameEnum.Master_Location);
            int MainTableKey = entityLocation.Id;

            if (entityLocation.Id > 0)
            {
                MasterLocation OldEntity = null;
                OldEntity = _repository.GetNoTracking(entityLocation.Id);
                objLocation = _repository.Get(entityLocation.Id);

                if (objLocation != null)
                {
                    //   objLocation.LocationName = entityLocation.LocationName;
                    objLocation.CountryId = entityLocation.CountryId;
                    objLocation.StateId = entityLocation.StateId;
                    objLocation.CityId = entityLocation.CityId;
                    objLocation.Sector = entityLocation.Sector;
                    objLocation.Latitude = entityLocation.Latitude;
                    objLocation.Longitude = entityLocation.Longitude;
                    objLocation.Status = entityLocation.Status;
                    objLocation.LocationName = entityLocation.LocationName;
                    objLocation.ModifiedDate = AppConstants.DateTime;
                    objLocation.IsActive = entityLocation.IsActive;
                    objLocation.ModifiedBy = entityLocation.ModifiedBy;

                    _repository.UpdateAsync(objLocation);
                    _repository.UpdateGraph(objLocation, EntityState.Modified);
                    await _unitOfWork.SaveChangesAsync();

                    //Do Audit Log --AUDITLOGUSER
                    await _auditLogService.CreateAuditLog<MasterLocation>(AuditActionTypeEnum.Update, OldEntity, objLocation, MainTableName, MainTableKey);
                }
                else
                {
                    return DBOperation.NotFound;
                }
            }
            else
            {
                objLocation = _mapperFactory.Get<MasterLocationEntity, MasterLocation>(entityLocation);

                objLocation.CountryId = entityLocation.CountryId;
                objLocation.StateId = entityLocation.StateId;
                objLocation.CityId = entityLocation.CityId;
                objLocation.Sector = entityLocation.Sector;
                objLocation.Latitude = entityLocation.Latitude;
                objLocation.Longitude = entityLocation.Longitude;
                objLocation.HomeCurrencyId = entityLocation.HomeCurrencyId;
                objLocation.ForeignCurrencyId = entityLocation.ForeignCurrencyId;
                objLocation.Status = entityLocation.Status;
                objLocation.CreatedBy = entityLocation.CreatedBy;
                objLocation.IsActive = entityLocation.IsActive;
                _repository.AddAsync(objLocation);
                await _unitOfWork.SaveChangesAsync();
            }
            //  await _unitOfWork.SaveChangesAsync();
            if (objLocation.Id == 0)
                return DBOperation.Error;

            return DBOperation.Success;
        }

        public async Task<DBOperation> Delete(int id)
        {
            var entityLocation = _repository.Get(x => x.Id == id);

            if (entityLocation == null)
                return DBOperation.NotFound;

            _repository.Remove(entityLocation);

            await _unitOfWork.SaveChangesAsync();

            return DBOperation.Success;
        }
    }
}
