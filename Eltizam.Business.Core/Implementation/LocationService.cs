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
    public class LocationService : ILocationService
    {
        private readonly IUnitOfWork _unitOfWork;
        private readonly IMapperFactory _mapperFactory;
        private readonly IStringLocalizer<Errors> _stringLocalizerError;
        private readonly Microsoft.Extensions.Configuration.IConfiguration configuration;


        private IRepository<MasterLocation> _repository { get; set; }
        private readonly IHelper _helper;
        public LocationService(IUnitOfWork unitOfWork, IMapperFactory mapperFactory, IStringLocalizer<Errors> stringLocalizerError,
                                  IHelper helper,
                                 Microsoft.Extensions.Configuration.IConfiguration _configuration)
        {
            _unitOfWork = unitOfWork;
            _mapperFactory = mapperFactory;

            _repository = _unitOfWork.GetRepository<MasterLocation>();
            configuration = _configuration;
            _helper = helper;
        }

        // get all recoreds from Location list with sorting and pagination
        public async Task<DataTableResponseModel> GetAll(DataTableAjaxPostModel? model)
        { 
            var _dbParams = new[]
             { 
                 new DbParameter("PageSize",    model?.length, SqlDbType.Int),
                 new DbParameter("PageNumber",  model?.start, SqlDbType.Int),
                 new DbParameter("OrderClause", "LocationName", SqlDbType.VarChar),
                 new DbParameter("ReverseSort", 0, SqlDbType.Int)
             };

            int _count = 0;
            var lstStf = EltizamDBHelper.ExecuteMappedReaderWithOutputParameter<MasterLocationEntity>(ProcedureMetastore.usp_Location_SearchAllList,

             DatabaseConnection.ConnString, out _count, CommandType.StoredProcedure, _dbParams); 

            DataTableResponseModel oDataTableResponseModel = new DataTableResponseModel(model.draw, _count, 0, lstStf); 
            return oDataTableResponseModel;
        }
        public async Task<MasterLocationEntity> GetById(int id)
        {
            var _LocationEntity = new MasterLocationEntity();
            _LocationEntity = _mapperFactory.Get<MasterLocation, MasterLocationEntity>(await _repository.GetAsync(id));

            return _LocationEntity;
        }
        public async Task<DBOperation> Upsert(MasterLocationEntity entityLocation)
        {

            MasterLocation objLocation;

            if (entityLocation.Id > 0)
            {
                objLocation = _repository.Get(entityLocation.Id);
                var OldObjLocation = objLocation;
                if (objLocation != null)
                {
                    objLocation.LocationName = entityLocation.LocationName;
                    objLocation.CountryId = entityLocation.CountryId;
                    objLocation.StateId = entityLocation.StateId;
                    objLocation.CityId = entityLocation.CityId;
                    objLocation.Sector = entityLocation.Sector;
                    objLocation.Latitude = entityLocation.Latitude;
                    objLocation.Longitude = entityLocation.Longitude;
                    objLocation.Status = entityLocation.Status;
                    objLocation.ModifiedDate = DateTime.Now;
                    objLocation.ModifiedBy = entityLocation.CreatedBy;
                    _repository.UpdateAsync(objLocation);
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
                objLocation.Status = entityLocation.Status;
                objLocation.CreatedDate = DateTime.Now;
                objLocation.CreatedBy = entityLocation.CreatedBy;
                objLocation.ModifiedDate = DateTime.Now;
                objLocation.ModifiedBy = entityLocation.CreatedBy;
                _repository.AddAsync(objLocation);
            }
            await _unitOfWork.SaveChangesAsync();
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
