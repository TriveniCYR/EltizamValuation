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
    public class MasterPropertyService : IMasterPropertyService
    {
        #region Properties
        private readonly IUnitOfWork _unitOfWork;
        private readonly IMapperFactory _mapperFactory;
        private readonly IStringLocalizer<Errors> _stringLocalizerError;
        private readonly Microsoft.Extensions.Configuration.IConfiguration configuration;
        private IRepository<MasterPropertyType> _repository { get; set; }
        private IRepository<MasterPropertySubType> _subrepository { get; set; }
        private readonly IHelper _helper;
        #endregion Properties

        #region Constructor
        public MasterPropertyService(IUnitOfWork unitOfWork, IMapperFactory mapperFactory, IStringLocalizer<Errors> stringLocalizerError,
          IHelper helper,
           Microsoft.Extensions.Configuration.IConfiguration _configuration)
        {
            _unitOfWork = unitOfWork;
            _mapperFactory = mapperFactory;

            _repository = _unitOfWork.GetRepository<MasterPropertyType>();
            _subrepository = _unitOfWork.GetRepository<MasterPropertySubType>();
            configuration = _configuration;
            _helper = helper;
        }
        #endregion Constructor


        #region API Methods

        /// <summary>
        /// Description - To Login User and return JWT Token String
        /// </summary>
        /// <param name="MasterProperty"></param>
        /// <returns></returns>
        /// <response code="200">OK</response>
        /// <response code="400">Bad Request</response>
        /// <response code="403">Forbidden</response>
        /// <response code="404">Not Found</response>
        /// <response code="405">Method Not Allowed</response>
        /// <response code="415">Unsupported Media Type</response>
        /// <response code="500">Internal Server</response>
        /// 

        public async Task<Master_PropertyTypeModel> GetMasterPropertyByIdAsync(int id)
        {
            // Create a new Master_PropertyTypeModel instance.
            var _userEntity = new Master_PropertyTypeModel();

            // Use a mapper to map the data from the repository to the model asynchronously.
            _userEntity = _mapperFactory.Get<MasterPropertyType, Master_PropertyTypeModel>(await _repository.GetAsync(id));

            // Return the mapped entity.
            return _userEntity;
        }

        public async Task<DataTableResponseModel> GetAll(DataTableAjaxPostModel model)
        {
            var _dbParams = new[]
             {
                 new DbParameter("PropertyTypeId", 0,SqlDbType.Int),
                 new DbParameter("PageSize", model.length, SqlDbType.Int),
                 new DbParameter("PageNumber", model.start, SqlDbType.Int),
                 new DbParameter("OrderClause", "PropertyType", SqlDbType.VarChar),
                 new DbParameter("ReverseSort", 1, SqlDbType.Int)
             };

            int _count = 0;
            var lstStf = EltizamDBHelper.ExecuteMappedReaderWithOutputParameter<Master_PropertyTypeModel>(ProcedureNameCall.stp_PropertyType_GetAll,

             DatabaseConnection.EltizamDatabaseConnection, out _count, CommandType.StoredProcedure, _dbParams);


            DataTableResponseModel oDataTableResponseModel = new DataTableResponseModel(model.draw, _count, lstStf.Count, lstStf);

            return oDataTableResponseModel;
        }

        public async Task<List <Master_PropertyTypeModel>>GetAllProperty()
        {
           
            var lstStf = EltizamDBHelper.ExecuteMappedReader<Master_PropertyTypeModel>(ProcedureNameCall.stp_PropertyType_GetAll,

             DatabaseConnection.EltizamDatabaseConnection, CommandType.StoredProcedure,null);
                       
            return lstStf;
        }

        public async Task<DBOperation> AddUpdateMasterProperty(Master_PropertyTypeModel masterproperty)
        {
            // Create a Master_PropertyType object.
            MasterPropertyType type;
            MasterPropertySubType propertySubType;
            // Check if the entity has an ID greater than 0 (indicating an update).
            if (masterproperty.Id > 0)
            {
                // Get the existing entity from the repository.
                type = _repository.Get(masterproperty.Id);

                // If the entity exists, update its properties.
                if (type != null)
                {
                    type.PropertyType = masterproperty.PropertyType;
                    type.IsActive = masterproperty.IsActive;
                    type.ModifiedDate = DateTime.Now;
                    type.ModifiedBy = masterproperty.ModifiedBy;

                    // Update the entity in the repository asynchronously.
                    _repository.UpdateAsync(type);
                }
                else
                {
                    // Return a not found operation if the entity does not exist.
                    return DBOperation.NotFound;
                }
            }
            else
            {
                // Create a new Master_PropertyType entity from the model for insertion.
                type = _mapperFactory.Get<Master_PropertyTypeModel, MasterPropertyType>(masterproperty);
                type.CreatedDate = DateTime.Now;
                type.CreatedBy = masterproperty.CreatedBy;
                type.ModifiedDate = DateTime.Now;
                type.ModifiedBy = masterproperty.ModifiedBy;
                // Insert the new entity into the repository asynchronously.
                _repository.AddAsync(type);
            }

            // Save changes to the database asynchronously.
            await _unitOfWork.SaveChangesAsync();

            // Return an appropriate operation result.
            if (type.Id == 0)
                return DBOperation.Error;

            else
            {
                if (masterproperty.subType != null)
                {
                    if (masterproperty.subType.Id > 0)
                    {
                        propertySubType = _subrepository.Get(masterproperty.subType.Id);
                        if (propertySubType != null)
                        {
                            var entitySubType = _mapperFactory.Get<Master_PropertySubTypeModel, MasterPropertySubType>(masterproperty.subType);
                            propertySubType.PropertySubType = entitySubType.PropertySubType;


                            propertySubType.IsActive = entitySubType.IsActive;
                            propertySubType.ModifiedBy = entitySubType.CreatedBy;
                            propertySubType.ModifiedDate = DateTime.Now;
                            _subrepository.UpdateAsync(propertySubType);
                        }
                    }
                    else
                    {
                        propertySubType = _mapperFactory.Get<Master_PropertySubTypeModel, MasterPropertySubType>(masterproperty.subType);
                        propertySubType.PropertySubType = Convert.ToString(masterproperty.subType.PropertySubType);
                        //propertySubType.PropertySubType = masterproperty.subType.PropertyTypeId;
                        //propertySubType.PropertySubType = Convert.ToString(masterproperty.subType.PropertyTypeId);
                        propertySubType.PropertyTypeId = type.Id;
                        propertySubType.IsActive = masterproperty.IsActive;
                        propertySubType.CreatedBy = masterproperty.CreatedBy;
                        propertySubType.CreatedDate = DateTime.Now;
                        propertySubType.ModifiedBy = masterproperty.CreatedBy;
                        propertySubType.ModifiedDate = DateTime.Now;
                        _subrepository.AddAsync(propertySubType);
                    }
                    await _unitOfWork.SaveChangesAsync();
                }
            }
            return DBOperation.Success;
        }

        public async Task<DBOperation> DeleteProperty(int id)
        {
            // Get the entity to be deleted from the repository.
            var entityUser = _repository.Get(x => x.Id == id);

            // If the entity does not exist, return a not found operation.
            if (entityUser == null)
                return DBOperation.NotFound;

            // Remove the entity from the repository.
            _repository.Remove(entityUser);

            // Save changes to the database asynchronously.
            await _unitOfWork.SaveChangesAsync();

            // Return a success operation indicating successful deletion.
            return DBOperation.Success;
        }


        #endregion API Methods
    }
}
