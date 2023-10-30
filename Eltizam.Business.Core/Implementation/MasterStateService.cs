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
    public class MasterStateService : IMasterStateService
    {
        private readonly IUnitOfWork _unitOfWork;
        private readonly IMapperFactory _mapperFactory;
        private readonly IStringLocalizer<Errors> _stringLocalizerError;
        private readonly Microsoft.Extensions.Configuration.IConfiguration configuration;


        private IRepository<MasterState> _repository { get; set; }
        private readonly IHelper _helper;
        public MasterStateService(IUnitOfWork unitOfWork, IMapperFactory mapperFactory, IStringLocalizer<Errors> stringLocalizerError,
                                  IHelper helper,
                                 Microsoft.Extensions.Configuration.IConfiguration _configuration)
        {
            _unitOfWork = unitOfWork;
            _mapperFactory = mapperFactory;

            _repository = _unitOfWork.GetRepository<MasterState>();
            configuration = _configuration;
            _helper = helper;
        }

        // get all recoreds from State list with sorting and pagination
        public async Task<DataTableResponseModel> GetAll(DataTableAjaxPostModel model)
        {
            var _dbParams = new[]
             {
                 new DbParameter("StateId", 0,SqlDbType.Int),
                 new DbParameter("PageSize", model.length, SqlDbType.Int),
                 new DbParameter("PageNumber", model.start, SqlDbType.Int),
                 new DbParameter("OrderClause", "StateName", SqlDbType.VarChar),
                 new DbParameter("ReverseSort", 1, SqlDbType.Int)
             };

            int _count = 0;
            var lstStf = EltizamDBHelper.ExecuteMappedReaderWithOutputParameter<MasterStateListModel>(ProcedureMetastore.usp_State_SearchAllList,

             DatabaseConnection.ConnString, out _count, CommandType.StoredProcedure, _dbParams);


            DataTableResponseModel oDataTableResponseModel = new DataTableResponseModel(model.draw, _count, lstStf.Count, lstStf);

            return oDataTableResponseModel;
        }
        public async Task<MasterStateEntity> GetById(int id)
        {
            var _StateEntity = new MasterStateEntity();
            _StateEntity = _mapperFactory.Get<MasterState, MasterStateEntity>(await _repository.GetAsync(id));

            return _StateEntity;
        }
        public async Task<DBOperation> Upsert(MasterStateEntity entityState)
        {

            MasterState objState;

            if (entityState.Id > 0)
            {
                objState = _repository.Get(entityState.Id);
                var OldObjState = objState;
                if (objState != null)
                {
                    objState.StateName = entityState.StateName;
                    objState.CountryId = entityState.CountryId;
                    objState.StateCode = entityState.StateCode;
                    objState.IsActive = entityState.IsActive;
                    objState.ModifiedDate = AppConstants.DateTime;
                    objState.ModifiedBy = entityState.CreatedBy;
                    _repository.UpdateAsync(objState);
                }
                else
                {
                    return DBOperation.NotFound;
                }
            }
            else
            {
                objState = _mapperFactory.Get<MasterStateEntity, MasterState>(entityState);

                objState.StateName = entityState.StateName;
                objState.CountryId = entityState.CountryId;
                objState.StateCode = entityState.StateCode;
                objState.IsActive = entityState.IsActive;
                objState.CreatedDate = AppConstants.DateTime;
                objState.CreatedBy = entityState.CreatedBy;
                objState.ModifiedDate = AppConstants.DateTime;
                objState.ModifiedBy = entityState.CreatedBy;
                _repository.AddAsync(objState);
            }
            await _unitOfWork.SaveChangesAsync();
            if (objState.Id == 0)
                return DBOperation.Error;

            return DBOperation.Success;
        }

        public async Task<DBOperation> Delete(int id)
        {
            var entityState = _repository.Get(x => x.Id == id);

            if (entityState == null)
                return DBOperation.NotFound;

            _repository.Remove(entityState);

            await _unitOfWork.SaveChangesAsync();

            return DBOperation.Success;
        }


        public async Task<List<MasterStateEntity>> GetStateList()
        {

            var lstStf = EltizamDBHelper.ExecuteMappedReader<MasterStateEntity>(ProcedureMetastore.usp_State_AllList,
             DatabaseConnection.ConnString, CommandType.StoredProcedure, null);

            return lstStf;
        }

        public async Task<List<MasterStateEntity>> GetStateListByCountryId(int countryId)
        {
            return null;
        }

    }
}
