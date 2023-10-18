using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using static Eltizam.Utility.Enums.GeneralEnum;
using Eltizam.Business.Models;

namespace Eltizam.Business.Core.Interface
{
    public interface IUserService
    {
        Task<DBOperation> Upsert(MasterUserModel entityUser);
        Task<MasterUserDetailModel> GetById(int id);
        Task<DataTableResponseModel> GetAll(DataTableAjaxPostModel model);
        Task<List<MasterResourceTypeModel>> GetResourceTypeList();
        Task<List<MasterRoleModel>> GetRoleList();
        Task<DBOperation> Delete(int id);
    }
}
