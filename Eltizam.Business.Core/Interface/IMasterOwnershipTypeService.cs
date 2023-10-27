using Eltizam.Business.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using static Eltizam.Utility.Enums.GeneralEnum;

namespace Eltizam.Business.Core.Interface
{
    public interface IMasterOwnershipTypeService
    {

        Task<DBOperation> Upsert(MasterOwnershipTypeEntity entityUser);
        Task<MasterOwnershipTypeEntity> GetById(int id);
        Task<DataTableResponseModel> GetAll(DataTableAjaxPostModel model);
        Task<List<MasterOwnershipTypeEntity>> GetOwnershipTypeList();
        Task<DBOperation> Delete(int id);
    }
}
