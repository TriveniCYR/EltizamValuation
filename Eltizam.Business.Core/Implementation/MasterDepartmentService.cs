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
    public class MasterDepartmentService : IMasterDepartmentService
    {
        private readonly IUnitOfWork _unitOfWork;
        private readonly IMapperFactory _mapperFactory;
        private readonly Microsoft.Extensions.Configuration.IConfiguration configuration;

        private IRepository<MasterDepartment> _repository { get; set; }
        private readonly IHelper _helper;
        public MasterDepartmentService(IUnitOfWork unitOfWork, IMapperFactory mapperFactory, 
                                  IHelper helper,
                                 Microsoft.Extensions.Configuration.IConfiguration _configuration)
        {
            _unitOfWork = unitOfWork;
            _mapperFactory = mapperFactory;

            _repository = _unitOfWork.GetRepository<MasterDepartment>();
            configuration = _configuration;
            _helper = helper;
        }

        // get all recoreds from Department list with sorting and pagination
        //public async Task<DataTableResponseModel> GetAll(DataTableAjaxPostModel model)
        //{
        //    var _dbParams = new[]
        //     {
        //         new DbParameter("DepartmentId", 0,SqlDbType.Int),
        //         new DbParameter("PageSize", model.length, SqlDbType.Int),
        //         new DbParameter("PageNumber", model.start, SqlDbType.Int),
        //         new DbParameter("OrderClause", "CityName", SqlDbType.VarChar),
        //         new DbParameter("ReverseSort", 1, SqlDbType.Int)
        //     };

        //    int _count = 0;
        //    var lstStf = FJDBHelper.ExecuteMappedReaderWithOutputParameter<MasterDepartmentEntity>(ProcedureNameCall.usp_Department_SearchAllList,

        //     DatabaseConnection.EltizamDatabaseConnection, out _count, CommandType.StoredProcedure, _dbParams);


        //    DataTableResponseModel oDataTableResponseModel = new DataTableResponseModel(model.draw, _count, 0, lstStf);

        //    return oDataTableResponseModel;
        //}

        public async Task<List<MasterDepartmentEntity>> GetAll()
        {
            return _mapperFactory.GetList<MasterDepartment, MasterDepartmentEntity>(await _repository.GetAllAsync());
        }
        public async Task<MasterDepartmentEntity> GetById(int id)
        {
            var _DepartmentEntity = new MasterDepartmentEntity();
            _DepartmentEntity = _mapperFactory.Get<MasterDepartment, MasterDepartmentEntity>(await _repository.GetAsync(id));

            return _DepartmentEntity;
        }
        public async Task<DBOperation> Upsert(MasterDepartmentEntity entityDepartment)
        {
            
            MasterDepartment objDepartment;

            if (entityDepartment.Id > 0)
            {
                objDepartment = _repository.Get(entityDepartment.Id);
                var OldObjDepartment = objDepartment;
                if (objDepartment != null)
                {
                    objDepartment.Department = entityDepartment.Department;
                    objDepartment.IsActive = entityDepartment.IsActive;
                    objDepartment.ModifiedDate = AppConstants.DateTime;
                    objDepartment.ModifiedBy = entityDepartment.CreatedBy;
                    _repository.UpdateAsync(objDepartment);
                }
                else
                {
                    return DBOperation.NotFound;
                }
            }
            else
            {
                objDepartment = _mapperFactory.Get<MasterDepartmentEntity, MasterDepartment>(entityDepartment);
                objDepartment.CreatedDate = AppConstants.DateTime;
                objDepartment.CreatedBy = entityDepartment.CreatedBy;
                objDepartment.ModifiedDate = AppConstants.DateTime;
                objDepartment.ModifiedBy = entityDepartment.CreatedBy;
                _repository.AddAsync(objDepartment);
            }
            await _unitOfWork.SaveChangesAsync();
            if (objDepartment.Id == 0)
                return DBOperation.Error;

            return DBOperation.Success;
        }

        public async Task<DBOperation> Delete(int id)
        {
            var entityDepartment = _repository.Get(x => x.Id == id);

            if (entityDepartment == null)
                return DBOperation.NotFound;

            _repository.Remove(entityDepartment);

            await _unitOfWork.SaveChangesAsync();

            return DBOperation.Success;
        }
        public async Task<List<MasterDepartmentEntity>> GetDepartmentList()
        {

            var lstStf = EltizamDBHelper.ExecuteMappedReader<MasterDepartmentEntity>(ProcedureMetastore.usp_Department_AllList,
             DatabaseConnection.ConnString, CommandType.StoredProcedure, null);

            return lstStf;
        }
    }
}
