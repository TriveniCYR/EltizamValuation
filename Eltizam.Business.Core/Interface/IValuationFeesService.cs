using Eltizam.Business.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using static Eltizam.Utility.Enums.GeneralEnum;

namespace Eltizam.Business.Core.Interface
{
    public interface IValuationFeesService
    {
        Task<DBOperation> Upsert(MasterValuationFeesModel entityUser);
        Task<MasterValuationFeesModel> GetById(int id);
        Task<DataTableResponseModel> GetAll(DataTableAjaxPostModel model);
        //Task<List<MasterValuationFeesModel>> GetAll();
        Task<DBOperation> Delete(int id);
    }
}
