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
using System.Data;
using static Eltizam.Utility.Enums.GeneralEnum;

namespace Eltizam.Business.Core.Implementation
{
    internal class MasterValuationFeeTypeService : IMasterValuationFeeTypeService
    {
        private readonly IUnitOfWork _unitOfWork;
        private readonly IMapperFactory _mapperFactory;
        private readonly IStringLocalizer<Errors> _stringLocalizerError;
        private readonly Microsoft.Extensions.Configuration.IConfiguration configuration;
        private readonly string _dbConnection;

        private IRepository<MasterValuationFeeType> _repository { get; set; }
        private readonly IHelper _helper;
        public MasterValuationFeeTypeService(IUnitOfWork unitOfWork, IMapperFactory mapperFactory, IStringLocalizer<Errors> stringLocalizerError,
                                             IHelper helper, Microsoft.Extensions.Configuration.IConfiguration _configuration)
        {
            _unitOfWork = unitOfWork;
            _mapperFactory = mapperFactory;

            _repository = _unitOfWork.GetRepository<MasterValuationFeeType>();
            configuration = _configuration;
            _helper = helper;
            _dbConnection = DatabaseConnection.ConnString;
        }

        // get all recoreds from ValuationFeeType list with sorting and pagination
        public async Task<DataTableResponseModel> GetAll(DataTableAjaxPostModel model)
        {
            var _dbParams = new[]
             {
                 new DbParameter("ValuationFeeTypeId", 0,SqlDbType.Int),
                 new DbParameter("PageSize", model.length, SqlDbType.Int),
                 new DbParameter("PageNumber", model.start, SqlDbType.Int),
                 new DbParameter("OrderClause", "StateName", SqlDbType.VarChar),
                 new DbParameter("ReverseSort", 1, SqlDbType.Int)
             };

            int _count = 0;
            var lstStf = EltizamDBHelper.ExecuteMappedReaderWithOutputParameter<MasterValuationFeeTypeModel>(ProcedureMetastore.usp_ValuationFeeType_SearchAllList,

             DatabaseConnection.ConnString, out _count, CommandType.StoredProcedure, _dbParams);


            DataTableResponseModel oDataTableResponseModel = new DataTableResponseModel(model.draw, _count, lstStf.Count, lstStf);

            return oDataTableResponseModel;
        }
        public async Task<MasterValuationFeeTypeModel> GetById(int id)
        {
            var _ValuationFeeTypeEntity = new MasterValuationFeeTypeModel();
            _ValuationFeeTypeEntity = _mapperFactory.Get<MasterValuationFeeType, MasterValuationFeeTypeModel>(await _repository.GetAsync(id));

            return _ValuationFeeTypeEntity;
        }
        public async Task<DBOperation> Upsert(MasterValuationFeeTypeModel entityValuationFeeType)
        {

            MasterValuationFeeType objValuationFeeType;

            if (entityValuationFeeType.Id > 0)
            {
                objValuationFeeType = _repository.Get(entityValuationFeeType.Id);
                var OldObjValuationFeeType = objValuationFeeType;
                if (objValuationFeeType != null)
                {
                    objValuationFeeType.ValuationFeeType = entityValuationFeeType.ValuationFeeType;
                    objValuationFeeType.IsActive = entityValuationFeeType.IsActive;
                    objValuationFeeType.ModifiedDate = AppConstants.DateTime;
                    objValuationFeeType.ModifiedBy = entityValuationFeeType.CreatedBy;
                    _repository.UpdateAsync(objValuationFeeType);
                }
                else
                {
                    return DBOperation.NotFound;
                }
            }
            else
            {
                objValuationFeeType = _mapperFactory.Get<MasterValuationFeeTypeModel, MasterValuationFeeType>(entityValuationFeeType);

                objValuationFeeType.ValuationFeeType = entityValuationFeeType.ValuationFeeType;
                objValuationFeeType.IsActive = entityValuationFeeType.IsActive;
                objValuationFeeType.CreatedDate = AppConstants.DateTime;
                objValuationFeeType.CreatedBy = entityValuationFeeType.CreatedBy;
                objValuationFeeType.ModifiedDate = AppConstants.DateTime;
                objValuationFeeType.ModifiedBy = entityValuationFeeType.CreatedBy;
                _repository.AddAsync(objValuationFeeType);
            }
            await _unitOfWork.SaveChangesAsync();
            if (objValuationFeeType.Id == 0)
                return DBOperation.Error;

            return DBOperation.Success;
        }

        public async Task<DBOperation> Delete(int id)
        {
            var entityValuationFeeType = _repository.Get(x => x.Id == id);

            if (entityValuationFeeType == null)
                return DBOperation.NotFound;

            _repository.Remove(entityValuationFeeType);

            await _unitOfWork.SaveChangesAsync();

            return DBOperation.Success;
        }
    }
}
