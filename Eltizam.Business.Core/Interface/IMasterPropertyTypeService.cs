﻿using Eltizam.Business.Models;
using static Eltizam.Utility.Enums.GeneralEnum;

namespace Eltizam.Business.Core.Interface
{
    public interface IMasterPropertyTypeService
    {
        Task<Master_PropertyTypeModel> GetMasterPropertyTypeByIdAsync(int id);
        Task<DataTableResponseModel> GetAll(DataTableAjaxPostModel model);
        Task<DBOperation> AddUpdateMasterPropertyType(Master_PropertyTypeModel entityqualification);
        Task<DBOperation> DeletePropertyType(int id, int? by);

       Task<List<Master_PropertyTypeModel>> GetAllList();
        Task<bool> CheckDuplicatePropertyType(string PropertyType);
    }
}
