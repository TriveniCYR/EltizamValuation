using Eltizam.Business.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using static Eltizam.Utility.Enums.GeneralEnum;

namespace Eltizam.Business.Core.Interface
{
    public interface IMasterClientTypeService
    {
        Task<Master_ClientTypeModel> GetMasterClientTypeByIdAsync(int id);
        Task<List<Master_ClientTypeModel>> GetAll();
        Task<DBOperation> AddUpdateMasterClientType(Master_ClientTypeModel entityqualification);
        Task<DBOperation> DeleteClientType(int id);
        Task<List<Master_ClientTypeModel>> GetClientTypeList();
    }
}
