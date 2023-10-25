using Eltizam.Business.Core.Interface;
using Eltizam.Business.Core.ModelMapper;
using Eltizam.Business.Models;
using Eltizam.Data.DataAccess.Core.Repositories;
using Eltizam.Data.DataAccess.Core.UnitOfWork;
using Eltizam.Data.DataAccess.Entity;
using Eltizam.Data.DataAccess.Helper;
using Eltizam.Utility.Utility;
using System.Data;
using System.Data.SqlClient;
using static Eltizam.Utility.Enums.GeneralEnum;

namespace Eltizam.Business.Core.Implementation
{
    public class MasterRoleService : IMasterRoleService
    {
        private readonly IUnitOfWork _unitOfWork;
        private readonly IMapperFactory _mapperFactory;
        private IRepository<MasterRole> _repository { get; set; }
        private readonly IMasterRoleModulePermission _roleModulePermission;
        private IRepository<MasterUser> _Userrepository { get; set; }

        public MasterRoleService(IUnitOfWork unitOfWork, IMapperFactory mapperFactory, IMasterRoleModulePermission roleModulePermission)
        {
            _unitOfWork = unitOfWork;
            _mapperFactory = mapperFactory;
            _roleModulePermission = roleModulePermission;
            _repository = _unitOfWork.GetRepository<MasterRole>();
            _Userrepository = _unitOfWork.GetRepository<MasterUser>();
        }

        public async Task<DBOperation> AddUpdateRole(MasterRoleEntity masterRoleEntity)
        {
            MasterRole objRole;
            var LoggedUserId = masterRoleEntity.LoggedUserId;
            if (masterRoleEntity.Id > 0) //Update existing user
            {
                if (!masterRoleEntity.IsActive)
                {
                    var IsUserExist = _Userrepository.GetAllQuery().Where(x => x.RoleId == masterRoleEntity.Id).ToList();
                    if (IsUserExist.Count > 0)
                        masterRoleEntity.IsActive = true;
                }
                objRole = _repository.Get(masterRoleEntity.Id);
                var OldObjRole = objRole;
                if (objRole != null)
                {
                    objRole = _mapperFactory.Get<MasterRoleEntity, MasterRole>(masterRoleEntity);
                    objRole.ModifyBy = LoggedUserId;
                    objRole.ModifyDate = AppConstants.DateTime;
                    _repository.UpdateAsync(objRole);

                    await _unitOfWork.SaveChangesAsync();
                }
                else
                {
                    return DBOperation.NotFound;
                }
            }
            else //add new user
            {
                objRole = _mapperFactory.Get<MasterRoleEntity, MasterRole>(masterRoleEntity);
                objRole.CreatedBy = LoggedUserId;
                objRole.CreatedDate = AppConstants.DateTime;
                _repository.AddAsync(objRole);
                await _unitOfWork.SaveChangesAsync();
            }

            if (objRole.Id == 0)
                return DBOperation.Error;

            #region Add Module Permsson

            if (masterRoleEntity.MasterModules.Count > 0)
            {
                var ModulePermission = masterRoleEntity.MasterModules.Select(xx => xx.RoleModulePermission);
                var SubModulePermission = masterRoleEntity.MasterModules.SelectMany(xx => xx.MasterSubModules?.Select(yy => yy.RoleModulePermission));
                var Permissions = ModulePermission.Concat(SubModulePermission);
                Permissions = Permissions.Select(xx => { xx.RoleId = objRole.Id; return xx; });

                await _roleModulePermission.AddUpdateRoleModulePermission(Permissions.ToList());
            }

            #endregion Add Module Permsson

            return DBOperation.Success;
        }

        public async Task<DBOperation> DeleteRole(int id)
        {
            var entityRole = _repository.Get(x => x.Id == id);
            var IsUserExist = _Userrepository.GetAllQuery().Where(x => x.RoleId == entityRole.Id).ToList();
            if (IsUserExist.Count <= 0)
            {
                if (entityRole == null)
                    return DBOperation.NotFound;

                _repository.Remove(entityRole);

                await _unitOfWork.SaveChangesAsync();
                return DBOperation.Success;
            }
            return DBOperation.NotFound;
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

            var Results = await _repository.GetBySP(ProcedureMetastore.usp_Role_AllList, CommandType.StoredProcedure, osqlParameter);

            //Get Pagination information
            var res = UtilityHelper.GetPaginationInfo(Results);

            DataTableResponseModel oDataTableResponseModel = new DataTableResponseModel(model.draw, res.Item1, res.Item1, Results.DataTableToList<MasterRoleListModel>());

            return oDataTableResponseModel;
            //return _mapperFactory.GetList<MasterRole, MasterRoleEntity>(await _repository.GetAllAsync());
        }

        public async Task<List<MasterRoleEntity>> GetActiveRole()
        {
            var ActiveRole = await _repository.GetAllAsync(x => x.IsActive == true && x.IsDeleted == false);
            return _mapperFactory.GetList<MasterRole, MasterRoleEntity>(ActiveRole.ToList());
        }

        public async Task<List<MasterRoleEntity>> RoleSearch(string searchQuery)
        {
            // Get all roles from the repository
            var allRoles = await _repository.GetAllAsync();

            // Apply the search filter if a searchQuery is provided
            if (!string.IsNullOrEmpty(searchQuery))
            {
                searchQuery = searchQuery.Trim().ToLower(); // Convert the search query to lowercase for case-insensitive search
                allRoles = allRoles.Where(role => role.RoleName.ToLower().Contains(searchQuery)).ToList();
            }

            // Map the filtered roles to MasterRoleEntity and return the result
            return _mapperFactory.GetList<MasterRole, MasterRoleEntity>(allRoles);
        }


        public async Task<MasterRoleEntity> GetById(int id)
        {
            try
            {
                MasterRoleEntity _roleEntity = _mapperFactory.Get<MasterRole, MasterRoleEntity>(await _repository.GetAsync(id));

                var IsUserExist = _Userrepository.GetAllQuery().Where(x => x.RoleId == _roleEntity.Id).ToList();
                if (IsUserExist != null && IsUserExist.Count > 0)
                    _roleEntity.IsUserAssigned = true;

                return _roleEntity;
            }
            catch (Exception ex)
            {

                throw ex;
            }

        }
    }
}