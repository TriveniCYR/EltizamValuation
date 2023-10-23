using Eltizam.Business.Models;
using static Eltizam.Utility.Enums.GeneralEnum;

namespace Eltizam.Business.Core.Interface
{
    public interface IMasterRoleService
    {
        Task<DataTableResponseModel> GetAll(DataTableAjaxPostModel model);

        Task<MasterRoleEntity> GetById(int id);

        Task<DBOperation> AddUpdateRole(MasterRoleEntity masterRoleEntity);

        Task<DBOperation> DeleteRole(int id);

        Task<List<MasterRoleEntity>> GetActiveRole();

        Task<List<MasterRoleEntity>> RoleSearch(string searchQuery);
    }
}
