using Eltizam.Business.Core.Interface;
using Eltizam.Business.Core.ModelMapper;
using Eltizam.Business.Models;
using Eltizam.Data.DataAccess.Core.Repositories;
using Eltizam.Data.DataAccess.Core.UnitOfWork;
using Eltizam.Data.DataAccess.Entity;
using Eltizam.Data.DataAccess.Helper;
using Eltizam.Resource;
using Eltizam.Utility;
using Microsoft.Extensions.Localization;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using static Eltizam.Utility.Enums.GeneralEnum;

namespace Eltizam.Business.Core.Implementation
{
    public class MasterCountryService : IMasterCountryService
    {
        private readonly IUnitOfWork _unitOfWork;
        private readonly IMapperFactory _mapperFactory;
        private readonly IStringLocalizer<Errors> _stringLocalizerError;
        private readonly Microsoft.Extensions.Configuration.IConfiguration configuration;
        private readonly string _dbConnection;

        private IRepository<MasterCountry> _repository { get; set; }
        private readonly IHelper _helper;
        public MasterCountryService(IUnitOfWork unitOfWork, IMapperFactory mapperFactory, IStringLocalizer<Errors> stringLocalizerError,
                                  IHelper helper,
                                 Microsoft.Extensions.Configuration.IConfiguration _configuration)
        {
            _unitOfWork = unitOfWork;
            _mapperFactory = mapperFactory;

            _repository = _unitOfWork.GetRepository<MasterCountry>();
            configuration = _configuration;
            _helper = helper;
            _dbConnection = DatabaseConnection.ConnString;
        }

        // get all recoreds from Country list with sorting and pagination
        public async Task<DataTableResponseModel> GetAll(DataTableAjaxPostModel model)
        {
            var _dbParams = new[]
             {
                 new DbParameter("CountryId", 0,SqlDbType.Int),
                 new DbParameter("PageSize", model.length, SqlDbType.Int),
                 new DbParameter("PageNumber", model.start, SqlDbType.Int),
                 new DbParameter("OrderClause", "CountryName", SqlDbType.VarChar),
                 new DbParameter("ReverseSort", 1, SqlDbType.Int)
             };

            int _count = 0;
            var lstStf = EltizamDBHelper.ExecuteMappedReaderWithOutputParameter<MasterCountryModel>(ProcedureMetastore.usp_Country_SearchAllList,

             _dbConnection, out _count, CommandType.StoredProcedure, _dbParams);


            DataTableResponseModel oDataTableResponseModel = new DataTableResponseModel(model.draw, _count, 0, lstStf);

            return oDataTableResponseModel;
        }
        public async Task<MasterCountryModel> GetById(int id)
        {
            var _CountryEntity = new MasterCountryModel();
            _CountryEntity = _mapperFactory.Get<MasterCountry, MasterCountryModel>(await _repository.GetAsync(id));

            return _CountryEntity;
        }
        public async Task<DBOperation> Upsert(MasterCountryModel entityCountry)
        {

            MasterCountry objCountry;

            if (entityCountry.Id > 0)
            {
                objCountry = _repository.Get(entityCountry.Id);
                var OldObjCountry = objCountry;
                if (objCountry != null)
                {
                    objCountry.CountryName = entityCountry.CountryName;
                    objCountry.CountryCode = entityCountry.CountryCode;
                    objCountry.IsdcountryCode = entityCountry.ISDCountryCode;
                    objCountry.IsActive = entityCountry.IsActive;
                    objCountry.ModifiedDate = DateTime.Now;
                    objCountry.ModifiedBy = entityCountry.CreatedBy;
                    _repository.UpdateAsync(objCountry);
                }
                else
                {
                    return DBOperation.NotFound;
                }
            }
            else
            {
                objCountry = _mapperFactory.Get<MasterCountryModel, MasterCountry>(entityCountry);
                objCountry.CreatedDate = DateTime.Now;
                objCountry.CreatedBy = entityCountry.CreatedBy;
                objCountry.ModifiedDate = DateTime.Now;
                objCountry.ModifiedBy = entityCountry.CreatedBy;
                _repository.AddAsync(objCountry);
            }
            await _unitOfWork.SaveChangesAsync();
            if (objCountry.Id == 0)
                return DBOperation.Error;

            return DBOperation.Success;
        }

        public async Task<DBOperation> Delete(int id)
        {
            var entityCountry = _repository.Get(x => x.Id == id);

            if (entityCountry == null)
                return DBOperation.NotFound;

            _repository.Remove(entityCountry);

            await _unitOfWork.SaveChangesAsync();

            return DBOperation.Success;
        }

        public async Task<List<MasterCountryModel>> GetCountryList()
        {

            var lstStf = EltizamDBHelper.ExecuteMappedReader<MasterCountryModel>(ProcedureMetastore.usp_Country_AllList,
             DatabaseConnection.ConnString, CommandType.StoredProcedure, null);

            return lstStf;
        }

    }
}
