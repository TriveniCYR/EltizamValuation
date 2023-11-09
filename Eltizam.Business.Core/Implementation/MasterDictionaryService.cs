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
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Localization;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using static Eltizam.Utility.Enums.GeneralEnum;

namespace Eltizam.Business.Core.Implementation
{
    public class MasterDictionaryService : IMasterDictionaryService
    {
        private readonly IUnitOfWork _unitOfWork;
        private readonly IMapperFactory _mapperFactory;
        private readonly IStringLocalizer<Errors> _stringLocalizerError;
        private readonly Microsoft.Extensions.Configuration.IConfiguration configuration;


        private IRepository<MasterDictionary> _repository { get; set; }
        private IRepository<MasterDictionaryDetail> _repositoryDetail { get; set; }
        private readonly IHelper _helper;
        private readonly IAuditLogService _auditLogService;

        public MasterDictionaryService(IUnitOfWork unitOfWork, IMapperFactory mapperFactory, 
                                 IHelper helper, Microsoft.Extensions.Configuration.IConfiguration _configuration, IAuditLogService auditLogService)
        {
            _unitOfWork = unitOfWork;
            _mapperFactory = mapperFactory;

            _repository = _unitOfWork.GetRepository<MasterDictionary>();
            _repositoryDetail = _unitOfWork.GetRepository<MasterDictionaryDetail>();
            configuration = _configuration;
            _helper = helper;
            _auditLogService = auditLogService;
        }

        // get all recoreds from Location list with sorting and pagination
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

            var Results = await _repository.GetBySP(ProcedureMetastore.usp_Dictionary_SearchAllList, CommandType.StoredProcedure, osqlParameter); 

            //Get Pagination information
            var res = UtilityHelper.GetPaginationInfo(Results); 
            DataTableResponseModel Res = new DataTableResponseModel(model.draw, res.Item1, res.Item1, Results.DataTableToList<MasterDictionaryEntity>());

            return Res; 
        }

        public async Task<List<MasterDictionaryDetailById>> GetDictionaryDetailsByIdAsync(int id, string description)
        {            
            DbParameter[] osqlParameter = 
            {
                new DbParameter("Id", id, SqlDbType.Int),
                new DbParameter("Description",description,SqlDbType.VarChar),
            }; 
            
            var _Dictionary = EltizamDBHelper.ExecuteMappedReader<MasterDictionaryDetailById>(ProcedureMetastore.usp_Dictionary_GetById, 
                              DatabaseConnection.ConnString, System.Data.CommandType.StoredProcedure, osqlParameter); 
            return _Dictionary;
        } 

        public async Task<MasterDictionaryDetailById> GetDictionaryDetailsByIdAsync(int id)
        {
            try
            {
                var masterDictionary = await _repositoryDetail.GetAsync(id);
                if (masterDictionary == null)
                {
                    return null;
                }

                var _DictionaryEntity = _mapperFactory.Get<MasterDictionaryDetail, MasterDictionaryDetailById>(masterDictionary);
                return _DictionaryEntity;
            }
            catch (Exception ex)
            {
                return null;
            }
        }

        public async Task<DBOperation> AddUpdateMasterDictionary(MasterDictionaryDetailById entitydictionary)
        {

            MasterDictionaryDetail objDicitonary;
            var By = _helper.GetLoggedInUser().UserId;
            string MainTableName = Enum.GetName(TableNameEnum.Master_Location);
            int MainTableKey = entitydictionary.Id;


            if (entitydictionary.Id > 0)
            {
                MasterDictionaryDetail OldEntity = null;
                objDicitonary = _repositoryDetail.Get(entitydictionary.Id);
                var OldObjLocation = objDicitonary;
                if (objDicitonary != null)
                {
                    //   objLocation.LocationName = entityLocation.LocationName;
                    objDicitonary.Description = entitydictionary.Description;
                    objDicitonary.Sort = entitydictionary.Sort;
                    objDicitonary.IsActive = entitydictionary.IsActive;
                    objDicitonary.ModifiedBy = entitydictionary.ModifiedBy ?? By;

                    _repositoryDetail.UpdateAsync(objDicitonary);
                    _repositoryDetail.UpdateGraph(objDicitonary, EntityState.Modified);
                    await _unitOfWork.SaveChangesAsync();
                   
                    //Do Audit Log --AUDITLOGUSER
                    await _auditLogService.CreateAuditLog<MasterDictionaryDetail>(AuditActionTypeEnum.Update, OldEntity, objDicitonary, MainTableName, MainTableKey);
                } 
            }
            else
            {
                objDicitonary = _mapperFactory.Get<MasterDictionaryDetailById, MasterDictionaryDetail>(entitydictionary);
                objDicitonary.Description = entitydictionary.Description; 
                objDicitonary.IsActive = entitydictionary.IsActive;
                objDicitonary.CreatedBy = entitydictionary.CreatedBy;

                _repositoryDetail.AddAsync(objDicitonary);
                await _unitOfWork.SaveChangesAsync();
            }
            //await _unitOfWork.SaveChangesAsync();
            if (objDicitonary.Id == 0)
                return DBOperation.Error;

            return DBOperation.Success;
        }


        public async Task<DBOperation> Delete(int id)
        {
            var entityDictionary = _repositoryDetail.Get(x => x.Id == id);

            if (entityDictionary == null)
                return DBOperation.NotFound;

            _repositoryDetail.Remove(entityDictionary);

            await _unitOfWork.SaveChangesAsync();

            return DBOperation.Success;
        }

        /// <summary>
        /// Update dictionary data
        /// </summary>
        /// <param name="entity"></param>
        /// <returns></returns>
        public async Task<DBOperation> MasterDictionaryAddUpdate(MasterDictionaryEntity entity)
        {
            // Create a Master_PropertyType object.
            MasterDictionary objmasterDictionary;

            // Check if the entity has an ID greater than 0 (indicating an update).
            if (entity.Id > 0)
            {
                // Get the existing entity from the repository.
                objmasterDictionary = _repository.Get(entity.Id);

                // If the entity exists, update its properties.
                if (objmasterDictionary != null)
                {
                    objmasterDictionary.Description = entity.Description; 
                    objmasterDictionary.IsActive = Convert.ToInt32(entity.IsActive);
                    objmasterDictionary.ModifiedBy = entity.LogInUserId;

                    // Update the entity in the repository asynchronously.
                    _repository.UpdateAsync(objmasterDictionary);
                }
            }
            else
            {
                objmasterDictionary = new MasterDictionary()
                {
                    IsActive = Convert.ToInt32(entity.IsActive),
                    Description = entity.Description,
                    DictionaryCode = entity.Description.Replace(" ", "_").ToUpper(),
                    CreatedBy = entity.LogInUserId
                };

                // Insert the new entity into the repository asynchronously.
                _repository.AddAsync(objmasterDictionary);
            }

            // Save changes to the database asynchronously.
            await _unitOfWork.SaveChangesAsync();


            // Return an appropriate operation result.
            if (objmasterDictionary.Id == 0)
                return DBOperation.Error;
            else
            {
                var subTypes = entity.MasterDicitonaryDetails;
                var _Val = "";
                if (subTypes != null)
                {
                    foreach (var _stype in subTypes)
                    {
                        _Val += string.Format("{0}_{1},", _stype.Id, _stype.Description);
                    }
                }

                SqlParameter[] _sqlParameter =
                {
                    new SqlParameter(AppConstants.P_Id,             objmasterDictionary.Id),
                    new SqlParameter(AppConstants.P_CreatedBy,      entity.LogInUserId),
                    new SqlParameter(AppConstants.P_RequestData,    _Val)
                };

                await _repository.GetBySP(ProcedureMetastore.usp_MasterDictionary_UpsertDictionaryDetails, CommandType.StoredProcedure, _sqlParameter);
            }
            return DBOperation.Success;
        }

        public async Task<MasterDictionaryEntity> GetMasterDictionaryDetailByIdAsync(int id)
        {
            // Create a new Master_PropertyTypeModel instance.
            var _userEntity = new MasterDictionaryEntity();

            // Use a mapper to map the data from the repository to the model asynchronously.
            _userEntity = _mapperFactory.Get<MasterDictionary, MasterDictionaryEntity>(await _repository.GetAsync(id));

            // Return the mapped entity.
            return _userEntity;
        }
        public async Task<List<MasterDictionaryDetailById>> GetMasterDictionaryDetailSubByIdAsync(int DictionaryId)
        {
            // Create a new Master_PropertyTypeModel instance.
            var _SubTypes = new List<MasterDictionaryDetailById>();

            var res = _repositoryDetail.GetAllAsync(x => x.DictionaryId == DictionaryId && x.IsActive == 1).Result.ToList();

            // Use a mapper to map the data from the repository to the model asynchronously.
            _SubTypes = _mapperFactory.GetList<MasterDictionaryDetail, MasterDictionaryDetailById>(res);

            // Return the mapped entity.    
            return _SubTypes;
        }

        /// <summary>
        /// Get dictionary details by Id, Name, code
        /// </summary>
        /// <param name="DictionaryId"></param>
        /// <param name="Description"></param>
        /// <param name="Code"></param>
        /// <returns></returns>
        public async Task<MasterDictionaryDetails> GetDictionaryWithSubDetailsAsync(int? DictionaryId, string? Description, string? Code)
        {
            var _header = new MasterDictionaryDetails();

            // Create a new Master_PropertyTypeModel instance. 
            var desc = await _repository.GetAsync(a =>
                               (DictionaryId == null || a.Id == DictionaryId) &&
                               (Description == null || a.Description == Description) &&
                               (Code == null || a.Description == Code));

            if (desc != null)
            {
                _header = new MasterDictionaryDetails()
                {
                    Description = desc.Description,
                    Id = desc.Id,
                    IsActive = desc.IsActive
                };

                var _SubTypes = _repositoryDetail.GetAllAsync(x => x.DictionaryId == _header.Id && x.IsActive == 1).Result.ToList();
                _header.Values = new List<MasterDictionaryDetailChild>();

                foreach (var item in _SubTypes)
                {
                    _header.Values.Add(new MasterDictionaryDetailChild()
                    {
                        Id = item.Id,
                        IsActive = item.IsActive,
                        Description = item.Description
                    });
                };
            }

            // Return the mapped entity.    
            return _header;
        }
    }
}
