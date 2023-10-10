using Eltizam.Business.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using static Eltizam.Utility.Enums.GeneralEnum;

namespace Eltizam.Business.Core.Interface
{
    public interface IMasterRoleService
    {
        Task<List<MasterRoleEntity>> GetAll();

        Task<MasterRoleEntity> GetById(int id);

        Task<DBOperation> AddUpdateRole(MasterRoleEntity masterRoleEntity);

        Task<DBOperation> DeleteRole(int id);

        Task<List<MasterRoleEntity>> GetActiveRole();

        Task<List<MasterRoleEntity>> RoleSearch(string searchQuery);
    }
}
