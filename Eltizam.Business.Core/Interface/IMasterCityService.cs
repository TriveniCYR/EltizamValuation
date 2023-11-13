using Eltizam.Business.Models;
using Eltizam.Data.DataAccess.Entity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using static Eltizam.Utility.Enums.GeneralEnum;

namespace Eltizam.Business.Core.Interface
{
    public interface IMasterCityService
    {

        Task<DBOperation> Upsert(MasterCityEntity entityUser);
        Task<MasterCityEntity> GetById(int id);
        Task<MasterCity?> GetById1(int id);
        Task<DataTableResponseModel> GetAll(DataTableAjaxPostModel model);
        Task<DBOperation> Delete(int id);
        Task<List<MasterCityEntity>> GetCityList();
        Task<List<MasterCityEntity>> GetCityListByStateId(int stateId);
    }
}
