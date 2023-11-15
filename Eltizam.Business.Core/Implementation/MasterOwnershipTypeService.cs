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
    public class MasterOwnershipTypeService : IMasterOwnershipTypeService
    {
        private readonly IUnitOfWork _unitOfWork;
        private readonly IMapperFactory _mapperFactory;
        //private readonly IStringLocalizer<Errors> _stringLocalizerError;
        private readonly Microsoft.Extensions.Configuration.IConfiguration configuration;


        private IRepository<MasterOwnershipType> _repository { get; set; }
        private readonly IHelper _helper;
        public MasterOwnershipTypeService(IUnitOfWork unitOfWork, IMapperFactory mapperFactory,
                                  IHelper helper,
                                 Microsoft.Extensions.Configuration.IConfiguration _configuration)
        {
            _unitOfWork = unitOfWork;
            _mapperFactory = mapperFactory;

            _repository = _unitOfWork.GetRepository<MasterOwnershipType>();
            configuration = _configuration;
            _helper = helper;
        }

        // get all recoreds from OwnershipType list with sorting and pagination
        public async Task<DataTableResponseModel> GetAll(DataTableAjaxPostModel model)
        {
            var _dbParams = new[]
             {
                 new DbParameter("OwnershipTypeId", 0,SqlDbType.Int),
                 new DbParameter("PageSize", model.length, SqlDbType.Int),
                 new DbParameter("PageNumber", model.start, SqlDbType.Int),
                 new DbParameter("OrderClause", "OwnershipType", SqlDbType.VarChar),
                 new DbParameter("ReverseSort", 1, SqlDbType.Int)
             };

            int _count = 0;
            var lstStf = EltizamDBHelper.ExecuteMappedReaderWithOutputParameter<MasterOwnershipTypeEntity>(ProcedureMetastore.usp_OwnershipType_SearchAllList,

             DatabaseConnection.ConnString, out _count, CommandType.StoredProcedure, _dbParams);


            DataTableResponseModel oDataTableResponseModel = new DataTableResponseModel(model.draw, _count, 0, lstStf);

            return oDataTableResponseModel;
        }

        public async Task<List<MasterOwnershipTypeEntity>> GetOwnershipTypeList()
        {
            return _mapperFactory.GetList<MasterOwnershipType, MasterOwnershipTypeEntity>(await _repository.GetAllAsync());
        }

        public async Task<MasterOwnershipTypeEntity> GetById(int id)
        {
            var _OwnershipTypeEntity = new MasterOwnershipTypeEntity();
            _OwnershipTypeEntity = _mapperFactory.Get<MasterOwnershipType, MasterOwnershipTypeEntity>(await _repository.GetAsync(id));

            return _OwnershipTypeEntity;
        }
        public async Task<DBOperation> Upsert(MasterOwnershipTypeEntity entityOwnershipType)
        {

            MasterOwnershipType objOwnershipType;

            if (entityOwnershipType.Id > 0)
            {
                objOwnershipType = _repository.Get(entityOwnershipType.Id);
                var OldObjOwnershipType = objOwnershipType;
                if (objOwnershipType != null)
                {
                    objOwnershipType.OwnershipType = entityOwnershipType.OwnershipType;
                    objOwnershipType.IsActive = entityOwnershipType.IsActive;
                    objOwnershipType.ModifiedDate = AppConstants.DateTime;
                    objOwnershipType.ModifiedBy = entityOwnershipType.CreatedBy;
                    _repository.UpdateAsync(objOwnershipType);
                }
                else
                {
                    return DBOperation.NotFound;
                }
            }
            else
            {
                objOwnershipType = _mapperFactory.Get<MasterOwnershipTypeEntity, MasterOwnershipType>(entityOwnershipType);
                objOwnershipType.CreatedDate = AppConstants.DateTime;
                objOwnershipType.CreatedBy = entityOwnershipType.CreatedBy;
                objOwnershipType.ModifiedDate = AppConstants.DateTime;
                objOwnershipType.ModifiedBy = entityOwnershipType.CreatedBy;
                _repository.AddAsync(objOwnershipType);
            }
            await _unitOfWork.SaveChangesAsync();
            if (objOwnershipType.Id == 0)
                return DBOperation.Error;

            return DBOperation.Success;
        }

        public async Task<DBOperation> Delete(int id)
        {
            var entityOwnershipType = _repository.Get(x => x.Id == id);

            if (entityOwnershipType == null)
                return DBOperation.NotFound;

            _repository.Remove(entityOwnershipType);

            await _unitOfWork.SaveChangesAsync();

            return DBOperation.Success;
        }
    }
}
