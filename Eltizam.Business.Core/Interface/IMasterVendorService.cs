using Eltizam.Business.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using static Eltizam.Utility.Enums.GeneralEnum;

namespace Eltizam.Business.Core.Interface
{
    public interface IMasterVendorService
    {
        Task<MasterVendorModel> GetMasterVendorByIdAsync(int id);
        Task<DataTableResponseModel> GetAll(DataTableAjaxPostModel model);
        Task<DBOperation> AddUpdateMasterVendor(MasterVendorModel masterVendortModel);
        Task<DBOperation> DeleteVendor(int id);
    }
}
