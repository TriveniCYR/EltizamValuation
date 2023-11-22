using AutoMapper;
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
using System.Data;
using System.Data.SqlClient;
using static Eltizam.Utility.Enums.GeneralEnum;

namespace Eltizam.Business.Core.Implementation
{
    public class MasterCityService : IMasterCityService
    {
        private readonly IUnitOfWork _unitOfWork; 
        private readonly IMapperFactory _mapperFactory;
      //  private readonly IMapper _mapper;
        private readonly IAuditLogService _auditLogService;
        private readonly Microsoft.Extensions.Configuration.IConfiguration configuration;
        private readonly string _dbConnection;

        private IRepository<MasterCity> _repository { get; set; }
        private readonly IHelper _helper;
        public MasterCityService(IUnitOfWork unitOfWork, IMapperFactory mapperFactory, IAuditLogService auditLogService, //IStringLocalizer<Errors> stringLocalizerError, IMapper mapper, 
                                 IHelper helper, Microsoft.Extensions.Configuration.IConfiguration _configuration)
        {
            _unitOfWork = unitOfWork;
            _mapperFactory = mapperFactory;
            _auditLogService = auditLogService; 

            _repository = _unitOfWork.GetRepository<MasterCity>();
            configuration = _configuration;
            _helper = helper;
            _dbConnection = _configuration[AppConstants.ConnectionStringkey];  
        }

        // get all recoreds from City list with sorting and pagination
        public async Task<DataTableResponseModel> GetAll(DataTableAjaxPostModel model)
        {
            string SortDir = model.order == null ? "ASC" : model.order[0].dir;
            SqlParameter[] osqlParameter =
            {
                new SqlParameter(AppConstants.P_CurrentPageNumber,  model.start),
                new SqlParameter(AppConstants.P_PageSize,           model.length),
                new SqlParameter(AppConstants.P_SortColumn,         ""),
                new SqlParameter(AppConstants.P_SortDirection,      SortDir),
                new SqlParameter(AppConstants.P_SearchText,         model.search?.value)
            };

            var Results = await _repository.GetBySP(ProcedureMetastore.usp_User_SearchAllList, CommandType.StoredProcedure, osqlParameter);

            //Get Pagination information
            var res = UtilityHelper.GetPaginationInfo(Results);

            DataTableResponseModel oDataTableResponseModel1 = new DataTableResponseModel(model.draw, res.Item1, res.Item1, Results.DataTableToList<MasterUserListModel>());

            //return oDataTableResponseModel;

            var _dbParams = new[]
             {
                 new DbParameter("CityId", 0,SqlDbType.Int),
                 new DbParameter("PageSize", model.length, SqlDbType.Int),
                 new DbParameter("PageNumber", model.start, SqlDbType.Int),
                 new DbParameter("OrderClause", "CityName", SqlDbType.VarChar),
                 new DbParameter("ReverseSort", 1, SqlDbType.Int)
             };

            int _count = 0;
            var lstStf = EltizamDBHelper.ExecuteMappedReaderWithOutputParameter<MasterCityEntity>(ProcedureMetastore.usp_City_SearchAllList, 
             _dbConnection, out _count, CommandType.StoredProcedure, _dbParams);


            DataTableResponseModel oDataTableResponseModel = new DataTableResponseModel(model.draw, _count, 0, lstStf);

            return oDataTableResponseModel;
        }

        public async Task<MasterCityEntity> GetById(int id)
        {
            // var _CityEntity = new MasterCityEntity();
            // var d = await _repository.GetAsync(id);

            var d = _repository.Get(id);
            //var dd = _mapper.Map<MasterCityEntity>(d);

            var _CityEntity = _mapperFactory.Get<MasterCity, MasterCityEntity>(d); 
            return _CityEntity;
        }

        public async Task<MasterCity?> GetById1(int id)
        {
            // var _CityEntity = new MasterCityEntity();
            var d1 = await _repository.GetAsync(id);

            var d = _repository.Get(id);
           // var dd = _mapper.Map<MasterCityEntity>(d);

            var _CityEntity = _mapperFactory.Get<MasterCity, MasterCityEntity>(d); 
            return d;
        }

        public async Task<DBOperation> Upsert(MasterCityEntity entityCity)
        { 
            try
            {
                MasterCity objCity;

                if (entityCity.Id > 0)
                {
                    //Get Audit Log --AUDITLOGUSER
                    var MainTableName = Enum.GetName(TableNameEnum.Master_Client);
                    var MainTableKey = entityCity.Id; 
                    MasterCity OldEntity = null;
                    OldEntity = _repository.GetNoTracking(entityCity.Id); 

                    objCity = _repository.Get(entityCity.Id); 
                    if (objCity != null)
                    {
                        objCity.CityName = entityCity.CityName;
                        objCity.CountryId = entityCity.CountryId;
                        objCity.StateId = entityCity.StateId;
                        objCity.Stdcode = entityCity.STDCode;
                        objCity.IsActive = entityCity.IsActive;
                        objCity.ModifiedDate = AppConstants.DateTime;
                        objCity.ModifiedBy = entityCity.CreatedBy;

                        _repository.UpdateAsync(objCity); 
                       // _repository.UpdateGraph(objCity, EntityState.Modified);
                        await _unitOfWork.SaveChangesAsync(); 

                        //Do Audit Log --AUDITLOGUSER
                        _auditLogService.CreateAuditLog<MasterCity>(AuditActionTypeEnum.Update, OldEntity, objCity, MainTableName, MainTableKey);
                    }
                    else
                    {
                        return DBOperation.NotFound;
                    }
                }
                else
                {
                    objCity = _mapperFactory.Get<MasterCityEntity, MasterCity>(entityCity);

                    objCity.CityName = entityCity.CityName;
                    objCity.CountryId = entityCity.CountryId;
                    objCity.StateId = entityCity.StateId;
                    objCity.Stdcode = entityCity.STDCode;
                    objCity.IsActive = entityCity.IsActive;
                    objCity.CreatedDate = AppConstants.DateTime;
                    objCity.CreatedBy = entityCity.CreatedBy;
                    objCity.ModifiedDate = AppConstants.DateTime;
                    objCity.ModifiedBy = entityCity.CreatedBy;

                    _repository.AddAsync(objCity);
                    await _unitOfWork.SaveChangesAsync(); 
                }
               
                if (objCity.Id == 0)
                    return DBOperation.Error;

                return DBOperation.Success;
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }

        public async Task<DBOperation> Delete(int id)
        {
            var entityCity = _repository.Get(x => x.Id == id);

            if (entityCity == null)
                return DBOperation.NotFound;

            _repository.Remove(entityCity);

            await _unitOfWork.SaveChangesAsync();

            return DBOperation.Success;
        }


        public async Task<List<MasterCityEntity>> GetCityList()
        {

            var lstStf = EltizamDBHelper.ExecuteMappedReader<MasterCityEntity>(ProcedureMetastore.usp_City_AllList,
             DatabaseConnection.ConnString, CommandType.StoredProcedure, null);

            return lstStf;
        }

        public async Task<List<MasterCityEntity>> GetCityListByStateId(int stateId)
        {
            var cityList = new List<MasterCityEntity>();
            var stateListAsync = _repository.GetAllAsync(x => x.StateId == stateId).Result.ToList();
            // Use a mapper to map the data from the repository to the model asynchronously.
            cityList = _mapperFactory.GetList<MasterCity, MasterCityEntity>(stateListAsync);
            return cityList;
        }
    }
}
