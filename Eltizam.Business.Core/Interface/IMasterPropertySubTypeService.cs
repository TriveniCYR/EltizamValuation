using Eltizam.Business.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using static Eltizam.Utility.Enums.GeneralEnum;

namespace Eltizam.Business.Core.Interface
{
    public interface IMasterPropertySubTypeService
    {
        Task<Master_PropertySubTypeModel> GetMasterSubPropertyByIdAsync(int id);
        Task<DataTableResponseModel> GetAll(DataTableAjaxPostModel model);
        Task<DBOperation> AddUpdateMasterSubProperty(Master_PropertySubTypeModel entityqualification);
        Task<DBOperation> DeleteSubProperty(int id);
    }
}
