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
    public class MasterDesignationService : IMasterDesignationService
    {

        private readonly IUnitOfWork _unitOfWork;
        private readonly IMapperFactory _mapperFactory;
        private readonly IStringLocalizer<Errors> _stringLocalizerError;
        private readonly Microsoft.Extensions.Configuration.IConfiguration configuration;

        private IRepository<MasterDesignation> _repository { get; set; }
        private readonly IHelper _helper;
        public MasterDesignationService(IUnitOfWork unitOfWork, IMapperFactory mapperFactory, IStringLocalizer<Errors> stringLocalizerError,
                                  IHelper helper,
                                 Microsoft.Extensions.Configuration.IConfiguration _configuration)
        {
            _unitOfWork = unitOfWork;
            _mapperFactory = mapperFactory;

            _repository = _unitOfWork.GetRepository<MasterDesignation>();
            configuration = _configuration;
            _helper = helper;
        }

        public async Task<List<MasterDesignationEntity>> GetAll()
        {
            return _mapperFactory.GetList<MasterDesignation, MasterDesignationEntity>(await _repository.GetAllAsync());
        }

        // get all recoreds from Designation list with sorting and pagination
        //public async Task<DataTableResponseModel> GetAll(DataTableAjaxPostModel model)
        //{
        //    var _dbParams = new[]
        //     {
        //         new DbParameter("DesignationId", 0,SqlDbType.Int),
        //         new DbParameter("PageSize", model.length, SqlDbType.Int),
        //         new DbParameter("PageNumber", model.start, SqlDbType.Int),
        //         new DbParameter("OrderClause", "CityName", SqlDbType.VarChar),
        //         new DbParameter("ReverseSort", 1, SqlDbType.Int)
        //     };

        //    int _count = 0;
        //    var lstStf = FJDBHelper.ExecuteMappedReaderWithOutputParameter<MasterDesignationEntity>(ProcedureNameCall.usp_Designation_SearchAllList,

        //     DatabaseConnection.EltizamDatabaseConnection, out _count, CommandType.StoredProcedure, _dbParams);


        //    DataTableResponseModel oDataTableResponseModel = new DataTableResponseModel(model.draw, _count, 0, lstStf);

        //    return oDataTableResponseModel;
        //}

        // get master designation detail by id
        public async Task<MasterDesignationEntity> GetById(int id)
        {
            var _DesignationEntity = new MasterDesignationEntity();
            _DesignationEntity = _mapperFactory.Get<MasterDesignation, MasterDesignationEntity>(await _repository.GetAsync(id));

            return _DesignationEntity;
        }

        // this method is called when inserting and updating master Designation detail
        public async Task<DBOperation> Upsert(MasterDesignationEntity entityDesignation)
        {

            MasterDesignation objDesignation;

            if (entityDesignation.Id > 0)
            {
                objDesignation = _repository.Get(entityDesignation.Id);
                var OldObjDesignation = objDesignation;
                if (objDesignation != null)
                {
                    objDesignation.Designation = entityDesignation.Designation;
                    objDesignation.IsActive = entityDesignation.IsActive;
                    objDesignation.ModifiedDate = AppConstants.DateTime;
                    objDesignation.ModifiedBy = entityDesignation.CreatedBy;
                    _repository.UpdateAsync(objDesignation);
                }
                else
                {
                    return DBOperation.NotFound;
                }
            }
            else
            {
                objDesignation = _mapperFactory.Get<MasterDesignationEntity, MasterDesignation>(entityDesignation);
                objDesignation.CreatedDate = AppConstants.DateTime;
                objDesignation.CreatedBy = entityDesignation.CreatedBy;
                objDesignation.ModifiedDate = AppConstants.DateTime;
                objDesignation.ModifiedBy = entityDesignation.CreatedBy;
                _repository.AddAsync(objDesignation);
            }
            await _unitOfWork.SaveChangesAsync();
            if (objDesignation.Id == 0)
                return DBOperation.Error;

            return DBOperation.Success;
        }

        // this is for delete master Designation detail by id
        public async Task<DBOperation> Delete(int id)
        {
            var entityDesignation = _repository.Get(x => x.Id == id);

            if (entityDesignation == null)
                return DBOperation.NotFound;

            _repository.Remove(entityDesignation);

            await _unitOfWork.SaveChangesAsync();

            return DBOperation.Success;
        }

        public async Task<List<MasterDesignationEntity>> GetDesignationList()
        {

            var lstStf = EltizamDBHelper.ExecuteMappedReader<MasterDesignationEntity>(ProcedureMetastore.usp_Designation_AllList,
             DatabaseConnection.ConnString, CommandType.StoredProcedure, null);

            return lstStf;
        }
    }
}
