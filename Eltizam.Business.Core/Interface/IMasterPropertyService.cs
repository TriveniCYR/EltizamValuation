using Eltizam.Business.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using static Eltizam.Utility.Enums.GeneralEnum;

namespace Eltizam.Business.Core.Interface
{
    public interface IMasterPropertyService
    {
        Task<Master_PropertyTypeModel> GetMasterPropertyByIdAsync(int id);
        Task<DataTableResponseModel> GetAll(DataTableAjaxPostModel model);
        Task<DBOperation> AddUpdateMasterProperty(Master_PropertyTypeModel entityqualification);
        Task<DBOperation> DeleteProperty(int id);
    }
}
