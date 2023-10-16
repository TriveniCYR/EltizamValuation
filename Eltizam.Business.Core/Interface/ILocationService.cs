using Eltizam.Business.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using static Eltizam.Utility.Enums.GeneralEnum;

namespace Eltizam.Business.Core.Interface
{
    public interface ILocationService
    {

        Task<DBOperation> AddUpdateLocationClient(MasterLocationEntity entityUser);
        Task<MasterLocationEntity> GetById(int id);
        //Task<List<MasterLocationEntity>> GetAll();
            Task<DataTableResponseModel> GetAll(DataTableAjaxPostModel? model);
        Task<DBOperation> Delete(int id);
    }
}
