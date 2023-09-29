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
        Task<Master_ClientModel> GetMasterClientById1Async(int id);
        Task<DataTableResponseModel> GetAll(DataTableAjaxPostModel model);
        Task<DBOperation> AddUpdateMasterClient(Master_ClientModel master_ClientModel);
        Task<DBOperation> DeleteClient(int id);
        Task<(Master_ClientModel, Master_ClientContactModel)> GetMasterClientByIdAsync(int id);

    }
}
