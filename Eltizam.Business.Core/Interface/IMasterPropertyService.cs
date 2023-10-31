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
        Task<MasterPropertyModel> GetMasterPropertyByIdAsync(int id);
        Task<DataTableResponseModel> GetAll(DataTableAjaxPostModel model);
        Task<DBOperation> AddUpdateMasterProperty(MasterPropertyModel entityqualification);
        Task<DBOperation> DeleteProperty(int id);
        Task<List<MasterAmenityListModel>> GetPropertyAmenityList();
        Task<List<MasterPropertyModel>> GetMasterPropertyByFiltersAsync(int propertyTypeId, int subPropertyTypeId, int ownershipTypeId);
    }
}
