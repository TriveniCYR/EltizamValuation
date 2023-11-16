using Eltizam.Business.Core.Interface;
using Eltizam.Business.Core.ModelMapper;
using Eltizam.Business.Models;
using Eltizam.Data.DataAccess.Core.Repositories;
using Eltizam.Data.DataAccess.Core.UnitOfWork;
using Eltizam.Data.DataAccess.Entity;
using Eltizam.Data.DataAccess.Helper;
using Eltizam.Utility.Models;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Caching.Memory;

namespace Eltizam.Business.Core.Implementation
{
    public class MasterModuleService : IMasterModuleService
    {
        private readonly IUnitOfWork _unitOfWork;
        private readonly IMapperFactory _mapperFactory;
        private readonly IMemoryCache _memoryCache;

        private IRepository<MasterModule> _repository { get; set; }
        private IRepository<MasterSubModule> _repositorySub { get; set; }

        private IRepository<MasterRoleModulePermission> _repositoryRolePermission { get; set; }

        public MasterModuleService(IUnitOfWork unitOfWork, IMapperFactory mapperFactory, IMemoryCache memoryCache)
        {
            _unitOfWork = unitOfWork;
            _mapperFactory = mapperFactory;
            _memoryCache = memoryCache;

            _repository = _unitOfWork.GetRepository<MasterModule>();
            _repositorySub = _unitOfWork.GetRepository<MasterSubModule>();
            _repositoryRolePermission = _unitOfWork.GetRepository<MasterRoleModulePermission>();
        }

        public async Task<List<MasterModuleEntity>> GetAll()
        {
            var MasterModuleData = _mapperFactory.GetList<MasterModule, MasterModuleEntity>(await _repository.GetAllAsync()).OrderBy(x => x.SortOrder).ToList();

            var MasterSubModuleData = _mapperFactory.GetList<MasterSubModule, MasterSubModuleEntity>(await _repositorySub.GetAllAsync());

            MasterModuleData = MasterModuleData.Select(xx => { xx.RoleModulePermission.ModuleId = xx.ModuleId; return xx; }).ToList();
            MasterSubModuleData = MasterSubModuleData.Select(xx => { xx.RoleModulePermission.ModuleId = xx.ModuleId; xx.RoleModulePermission.SubModuleId = xx.SubModuleId; return xx; }).ToList();

            MasterModuleData = MasterModuleData.GroupJoin(MasterSubModuleData,
                            c => c.ModuleId,
                            o => o.ModuleId,
                            (c, o) => new MasterModuleEntity
                            {
                                ModuleName = c.ModuleName,
                                ModuleId = c.ModuleId,
                                CreatedDate = c.CreatedDate,
                                IsActive = c.IsActive,
                                RoleModulePermission = c.RoleModulePermission,
                                MasterSubModules = o.ToList()
                            }).ToList();

            return MasterModuleData;
        }

        public async Task<List<MasterModuleEntity>> GetByRoleId(int roleId)
        {
            var Permissions = _mapperFactory.GetList<MasterRoleModulePermission, RoleModulePermissionEntity>((List<MasterRoleModulePermission>)await _repositoryRolePermission.FindAllAsync(xx => xx.RoleId == roleId)).OrderBy(x => x.SortOrder).ToList();
            if (Permissions.Any())
            {
                var MasterModuleData = _mapperFactory.GetList<MasterModule, MasterModuleEntity>(await _repository.GetAllAsync());

                var MasterSubModuleData = _mapperFactory.GetList<MasterSubModule, MasterSubModuleEntity>(await _repositorySub.GetAllAsync());
                MasterSubModuleData = MasterSubModuleData.GroupJoin(Permissions,
                                        c => c.ModuleId, o => o.ModuleId,
                                        (c, o) => new MasterSubModuleEntity
                                        {
                                            CreatedDate = c.CreatedDate,
                                            IsActive = c.IsActive,
                                            ModuleId = c.ModuleId,
                                            SubModuleId = c.SubModuleId,
                                            SubModuleName = c.SubModuleName,
                                            ControlName = string.IsNullOrEmpty(c.ControlName) ? "" : c.ControlName,
                                            RoleModulePermission = o.FirstOrDefault(xx => xx.SubModuleId == c.SubModuleId)
                                        }).ToList();

                foreach (var item in MasterSubModuleData)
                {
                    if (item.RoleModulePermission == null)
                    {
                        var _roleModulepermission = new RoleModulePermissionEntity();
                        _roleModulepermission.Add = false;
                        _roleModulepermission.Delete = false;
                        _roleModulepermission.View = false;
                        _roleModulepermission.Edit = false;
                        _roleModulepermission.Approve = false;
                        _roleModulepermission.RoleId = roleId;
                        _roleModulepermission.ModuleId = item.ModuleId;
                        _roleModulepermission.SubModuleId = item.SubModuleId;

                        item.RoleModulePermission = _roleModulepermission;
                    }
                }
                MasterModuleData = MasterModuleData.GroupJoin(MasterSubModuleData,
                               c => c.ModuleId,
                               o => o.ModuleId,
                               (c, o) => new MasterModuleEntity
                               {
                                   ModuleName = c.ModuleName,
                                   ModuleId = c.ModuleId,
                                   CreatedDate = c.CreatedDate,
                                   IsActive = c.IsActive,
                                   SortOrder = c.SortOrder,
                                   ControlName = string.IsNullOrEmpty(c.ControlName) ? "" : c.ControlName,
                                   RoleModulePermission = Permissions.FirstOrDefault(xx => xx.ModuleId == c.ModuleId && xx.SubModuleId == 0),
                                   MasterSubModules = o.ToList()
                               }).ToList();

                foreach (var item in MasterModuleData)
                {
                    if (item.RoleModulePermission == null)
                    {
                        var _roleModulepermission = new RoleModulePermissionEntity();
                        _roleModulepermission.Add = false;
                        _roleModulepermission.Delete = false;
                        _roleModulepermission.View = false;
                        _roleModulepermission.Edit = false;
                        _roleModulepermission.Approve = false;
                        _roleModulepermission.RoleId = roleId;
                        _roleModulepermission.ModuleId = item.ModuleId;
                        item.RoleModulePermission = _roleModulepermission;
                    }
                }
                return MasterModuleData;
            }
            else
            {
                return await GetAll();
            }
        }

        public async Task<IEnumerable<RolePermissionModel>> GetByPermisionRoleUsingRoleId(int roleId)
        {
            var menu = AppConstants.MenusCache + roleId.ToString();

            //Get from Cache first
            var cacheData = _memoryCache.Get<IEnumerable<RolePermissionModel>>(menu);
            if (cacheData != null)
            {
                return cacheData;
            }

            var per = await _repositoryRolePermission.FindAllAsync(xx => xx.RoleId == roleId);

            var Permissions = _mapperFactory.GetList<MasterRoleModulePermission, RoleModulePermissionEntity>((List<MasterRoleModulePermission>)per);

            if (Permissions.Any())
            {
                var MasterModuleData = _mapperFactory.GetList<MasterModule, MasterModuleEntity>(await _repository.GetAllAsync());

                var MasterSubModuleData = _mapperFactory.GetList<MasterSubModule, MasterSubModuleEntity>(await _repositorySub.GetAllAsync());

                var menuperm = (from p in Permissions
                                join m in MasterModuleData on p.ModuleId equals m.ModuleId
                                join s in MasterSubModuleData on p.SubModuleId equals s.SubModuleId
                                into SubMS
                                from SubM in SubMS.DefaultIfEmpty()
                                where m.IsActive == true
                                select new RolePermissionModel()
                                {
                                    RoleModuleId = p.RoleModuleId,
                                    RoleId = p.RoleId,
                                    ModuleId = p.ModuleId,
                                    SubModuleId = p.SubModuleId,
                                    Add = p.Add,
                                    View = p.View,
                                    Edit = p.Edit,
                                    Delete = p.Delete,
                                    Approve = p.Approve,
                                    ControlName = m.ControlName,
                                    ModuleName = m.ModuleName,
                                    Icon = m.Icon,
                                    HoverIcon = m.HoverIcon,
                                    ViewName = m.ViewName,
                                    Sort = m.SortOrder
                                }).ToList();

                //Do Cache
                var expirationTime = DateTimeOffset.Now.AddMinutes(60.0);
                _memoryCache.Set(menu, menuperm, expirationTime);

                return menuperm;
            }
            else
            {
                return null;
            }
        }
    }
}