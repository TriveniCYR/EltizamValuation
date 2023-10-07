using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using static Eltizam.Utility.Enums.GeneralEnum;
using Eltizam.Business.Models;

namespace Eltizam.Business.Core.Interface
{
    public interface IRoleModulePermission
    {
        Task<List<RoleModulePermissionEntity>> GetAll();

        Task<MasterRoleEntity> GetById(int id);
        Task<DBOperation> AddUpdateRoleModulePermission(List<RoleModulePermissionEntity> roleModulePermissionEntitys);

        Task<DBOperation> DeleteRoleModulePermission(int id);

    }
}
