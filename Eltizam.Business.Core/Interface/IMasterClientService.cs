using Eltizam.Business.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using static Eltizam.Utility.Enums.GeneralEnum;

namespace Eltizam.Business.Core.Interface
{
    public interface IMasterClientService
    {
        Task<MasterClientModel> GetMasterClientByIdAsync(int id);
        Task<List<MasterClientModel>> GetMasterClientByClientTypeIdAsync(int ClientTypeId);
        Task<DataTableResponseModel> GetAll(DataTableAjaxPostModel model);
        Task<DBOperation> AddUpdateMasterClient(MasterClientModel model);
        Task<DBOperation> DeleteClient(int id);
       
    }
}
