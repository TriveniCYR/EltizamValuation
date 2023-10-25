using Eltizam.Business.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using static Eltizam.Utility.Enums.GeneralEnum;

namespace Eltizam.Business.Core.Interface
{
    public interface IMasterDictionaryService
    {
        // Task<List<MasterDictionaryEntity>> GetAll();
        Task<DataTableResponseModel> GetAll(DataTableAjaxPostModel model);
        Task<List<MasterDictionaryDetailById>> GetDictionaryDetailsByIdAsync(int id, string description);
        Task<MasterDictionaryDetailById> GetDictionaryDetailsByIdAsync(int id);
        Task<DBOperation> AddUpdateMasterDictionary(MasterDictionaryDetailById entitydictionary);
        Task<DBOperation> Delete(int id);
    }
}
