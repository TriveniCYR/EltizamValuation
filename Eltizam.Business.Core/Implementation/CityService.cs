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
    public class CityService : ICityService
    {
        private readonly IUnitOfWork _unitOfWork;
        private readonly IMapperFactory _mapperFactory;
        private readonly IStringLocalizer<Errors> _stringLocalizerError;
        private readonly Microsoft.Extensions.Configuration.IConfiguration configuration;
        private readonly string _dbConnection;

        private IRepository<MasterCity> _repository { get; set; }
        private readonly IHelper _helper;
        public CityService(IUnitOfWork unitOfWork, IMapperFactory mapperFactory, IStringLocalizer<Errors> stringLocalizerError,
                                  IHelper helper,
                                 Microsoft.Extensions.Configuration.IConfiguration _configuration)
        {
            _unitOfWork = unitOfWork;
            _mapperFactory = mapperFactory;

            _repository = _unitOfWork.GetRepository<MasterCity>();
            configuration = _configuration;
            _helper = helper;
            _dbConnection = DatabaseConnection.EltizamDatabaseConnection;
        }

        // get all recoreds from City list with sorting and pagination
        public async Task<DataTableResponseModel> GetAll(DataTableAjaxPostModel model)
        {
            var _dbParams = new[]
             {
                 new DbParameter("CityId", 0,SqlDbType.Int),
                 new DbParameter("PageSize", model.length, SqlDbType.Int),
                 new DbParameter("PageNumber", model.start, SqlDbType.Int),
                 new DbParameter("OrderClause", "CityName", SqlDbType.VarChar),
                 new DbParameter("ReverseSort", 1, SqlDbType.Int)
             };

            int _count = 0;
            var lstStf = FJDBHelper.ExecuteMappedReaderWithOutputParameter<MasterCityEntity>("usp_City_SearchAllList",

             _dbConnection, out _count, CommandType.StoredProcedure, _dbParams);


            DataTableResponseModel oDataTableResponseModel = new DataTableResponseModel(model.draw, _count, 0, lstStf);

            return oDataTableResponseModel;
        }
        public async Task<MasterCityEntity> GetById(int id)
        {
            var _CityEntity = new MasterCityEntity();
            _CityEntity = _mapperFactory.Get<MasterCity, MasterCityEntity>(await _repository.GetAsync(id));

            return _CityEntity;
        }
        public async Task<DBOperation> Upsert(MasterCityEntity entityCity)
        {

            MasterCity objCity;

            if (entityCity.Id > 0)
            {
                objCity = _repository.Get(entityCity.Id);
                var OldObjCity = objCity;
                if (objCity != null)
                {
                    objCity.CityName = entityCity.CityName;
                    objCity.CountryId = entityCity.CountryId;
                    objCity.StateId = entityCity.StateId;
                    objCity.Stdcode = entityCity.STDCode;
                    objCity.IsActive = entityCity.IsActive;
                    objCity.ModifiedDate = DateTime.Now;
                    objCity.ModifiedBy = entityCity.CreatedBy;
                    _repository.UpdateAsync(objCity);
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
                objCity.CreatedDate = DateTime.Now;
                objCity.CreatedBy = entityCity.CreatedBy;
                objCity.ModifiedDate = DateTime.Now;
                objCity.ModifiedBy = entityCity.CreatedBy;
                _repository.AddAsync(objCity);
            }
            await _unitOfWork.SaveChangesAsync();
            if (objCity.Id == 0)
                return DBOperation.Error;

            return DBOperation.Success;
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
    }
}
