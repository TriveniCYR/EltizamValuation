using Eltizam.Business.Models;
using Eltizam.Data.DataAccess.Entity;
using static Eltizam.Utility.Enums.GeneralEnum;

namespace ValuationWeb.Application.Contracts.Persistence
{
    public interface IMasterCityRepository : IAsyncRepository<MasterCity>
    {
        Task<DBOperation> Upsert(MasterCityEntity entityUser);
        //Task<MasterCity> GetById(int id);
        Task<DataTableResponseModel> GetAll(DataTableAjaxPostModel model);
        Task<DBOperation> Delete(int id);
    }
}
