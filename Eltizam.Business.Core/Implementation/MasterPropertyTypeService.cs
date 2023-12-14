using Eltizam.Business.Core.Interface;
using Eltizam.Business.Core.ModelMapper;
using Eltizam.Business.Models;
using Eltizam.Data.DataAccess.Core.Repositories;
using Eltizam.Data.DataAccess.Core.UnitOfWork;
using Eltizam.Data.DataAccess.Entity;
using Eltizam.Data.DataAccess.Helper;
using Eltizam.Resource;
using Eltizam.Utility;
using Eltizam.Utility.Enums;
using Eltizam.Utility.Utility;
using Microsoft.Extensions.Localization;
using System.Data;
using System.Data.SqlClient;
using static Eltizam.Utility.Enums.GeneralEnum;

namespace Eltizam.Business.Core.Implementation
{
    public class MasterPropertyTypeService : IMasterPropertyTypeService
    {
        #region Properties
        private readonly IUnitOfWork _unitOfWork;
        private readonly IMapperFactory _mapperFactory;
        //private readonly IStringLocalizer<Errors> _stringLocalizerError;
        private readonly Microsoft.Extensions.Configuration.IConfiguration configuration;
        private IRepository<MasterPropertyType> _repository { get; set; }
        private IRepository<MasterPropertySubType> _subrepository { get; set; }
        private readonly IHelper _helper;
        private readonly IAuditLogService _auditLogService;
        #endregion Properties

        #region Constructor
        public MasterPropertyTypeService(IUnitOfWork unitOfWork, IMapperFactory mapperFactory,
          IHelper helper, IAuditLogService auditLogService,
           Microsoft.Extensions.Configuration.IConfiguration _configuration)
        {
            _unitOfWork = unitOfWork;
            _mapperFactory = mapperFactory;

            _repository = _unitOfWork.GetRepository<MasterPropertyType>();
            _subrepository = _unitOfWork.GetRepository<MasterPropertySubType>();
            configuration = _configuration;
            _helper = helper;
            _auditLogService = auditLogService;
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

        public async Task<Master_PropertyTypeModel> GetMasterPropertyTypeByIdAsync(int id)
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
            string ColumnName = model.order.Count > 0 ? model.columns[model.order[0].column].data : string.Empty;
            string SortDir = model.order[0]?.dir;

            SqlParameter[] osqlParameter =
            {
                new SqlParameter(AppConstants.P_CurrentPageNumber,  model.start),
                new SqlParameter(AppConstants.P_PageSize,           model.length),
                new SqlParameter(AppConstants.P_SortColumn,         ColumnName),
                new SqlParameter(AppConstants.P_SortDirection,      SortDir),
                new SqlParameter(AppConstants.P_SearchText,         model.search?.value)
            };

            var Results = await _repository.GetBySP(ProcedureMetastore.usp_PropertyType_SearchAllList, CommandType.StoredProcedure, osqlParameter);

            //Get Pagination information
            var res = UtilityHelper.GetPaginationInfo(Results);

            DataTableResponseModel oDataTableResponseModel = new DataTableResponseModel(model.draw, res.Item1, res.Item1, Results.DataTableToList<Master_PropertyTypeModel>());

            return oDataTableResponseModel;
        }

        public async Task<List<Master_PropertyTypeModel>> GetAllList()
        {

            var lstStf = EltizamDBHelper.ExecuteMappedReader<Master_PropertyTypeModel>(ProcedureMetastore.usp_PropertyType_GetAll,

             DatabaseConnection.ConnString, CommandType.StoredProcedure, null);

            return lstStf;
        }
        private bool IsPropertyDescriptionExists(string propertyType)
        {
            return _repository.GetAll()
                .Any(property => property.PropertyType == propertyType);
        }
        public async Task<DBOperation> AddUpdateMasterPropertyType(Master_PropertyTypeModel masterproperty)
        {
                if (masterproperty != null && masterproperty.PropertyType != null && masterproperty.Id == 0)
                {
                    var result = IsPropertyDescriptionExists(masterproperty.PropertyType);
                    if (result)
                    {
                        return DBOperation.AlreadyExist;
                    }
                }
                // Create a Master_PropertyType object.
                MasterPropertyType type;
            string MainTableName = Enum.GetName(TableNameEnum.Master_PropertyType);
            int MainTableKey = masterproperty.Id;
            MasterPropertyType OldEntity = null;

            // Check if the entity has an ID greater than 0 (indicating an update).
            if (masterproperty.Id > 0)
            {
                OldEntity = _repository.GetNoTracking(masterproperty.Id);
                type = _repository.Get(masterproperty.Id);
                // Get the existing entity from the repository.
                type = _repository.Get(masterproperty.Id);

                // If the entity exists, update its properties.
                if (type != null)
                {
                    type.PropertyType = masterproperty.PropertyType;
                    type.IsActive = masterproperty.IsActive; 
                    type.ModifiedBy = masterproperty.ModifiedBy;

                    // Update the entity in the repository asynchronously.
                    _repository.UpdateAsync(type);
                } 
            }
            else
            { 
                type = new MasterPropertyType()
                {
                    IsActive = masterproperty.IsActive,
                    PropertyType = masterproperty.PropertyType,
                    CreatedBy = masterproperty.CreatedBy
                };  

                // Insert the new entity into the repository asynchronously.
                _repository.AddAsync(type);
            }

            // Save changes to the database asynchronously.
            await _unitOfWork.SaveChangesAsync();

            //Do Audit Log --AUDITLOGUSER
            await _auditLogService.CreateAuditLog<MasterPropertyType>(AuditActionTypeEnum.Update, OldEntity, type, MainTableName, MainTableKey);

            // Return an appropriate operation result.
            if (type.Id == 0)
                return DBOperation.Error;
            else
            {
                var subTypes = masterproperty.MasterPropertySubTypes;
                var _Val = "";
                if (subTypes != null)
                { 
                    foreach (var _stype in subTypes)
                    {
                        _Val += string.Format("{0}_{1},", _stype.Id, _stype.PropertySubType);
                    }
                } 

                SqlParameter[] _sqlParameter =
                {
                    new SqlParameter(AppConstants.P_Id,             type.Id),
                    new SqlParameter(AppConstants.P_CreatedBy,      masterproperty.LogInUserId),
                    new SqlParameter(AppConstants.P_RequestData,    _Val)
                };

                await _repository.GetBySP(ProcedureMetastore.usp_PropertyType_UpsertSubTypes, CommandType.StoredProcedure, _sqlParameter); 
            }

            return DBOperation.Success;
        }

        public async Task<DBOperation> DeletePropertyType(int id,int? by)
        {
            var entityProperty = _repository.Get(x => x.Id == id);
            entityProperty.ModifiedBy = by ?? entityProperty.ModifiedBy;
            // If the entity does not exist, return a not found operation.
            if (entityProperty == null)
                return DBOperation.NotFound;
            else
            {
                var subPropertiesByPopertyId = _subrepository.GetAll().Where(x => x.PropertyTypeId == id).ToList();
                if (subPropertiesByPopertyId.Count > 0)
                {
                    foreach (var item in subPropertiesByPopertyId)
                    {
                        _subrepository.Remove(item);
                    }
                }
                _repository.Remove(entityProperty);

                await _unitOfWork.SaveChangesAsync();

                // Return a success operation indicating successful deletion.
                return DBOperation.Success;
            }
            
        }

        public async Task<bool> CheckDuplicatePropertyType(string PropertyType)
        {
            var dd = 1;
            return false;
        }

        #endregion API Methods
    }
}
