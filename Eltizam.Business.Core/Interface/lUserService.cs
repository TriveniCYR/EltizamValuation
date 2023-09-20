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
        Task<DBOperation> AddUpdateUser(TblUserModel entityUser);
        Task<TblUserModel> GetTblUserById(int id);
        Task<DataTableResponseModel> GetAll(DataTableAjaxPostModel model);
    }
}
