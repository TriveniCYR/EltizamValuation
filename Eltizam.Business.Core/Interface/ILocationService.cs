using Eltizam.Business.Models;
using static Eltizam.Utility.Enums.GeneralEnum;

namespace Eltizam.Business.Core.Interface
{
    public interface ILocationService
    {

        Task<DBOperation> AddUpdateLocationClient(MasterLocationEntity entityUser);
        Task<MasterLocationEntity> GetById(int id);
        Task<DataTableResponseModel> GetAll(DataTableAjaxPostModel model);
        Task<DBOperation> Delete(int id);
    }
}
