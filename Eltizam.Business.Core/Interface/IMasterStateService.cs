﻿using Eltizam.Business.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using static Eltizam.Utility.Enums.GeneralEnum;

namespace Eltizam.Business.Core.Interface
{
    public interface IMasterStateService
    {

        Task<DBOperation> Upsert(MasterStateEntity entityUser);
        Task<MasterStateEntity> GetById(int id);
        Task<DataTableResponseModel> GetAll(DataTableAjaxPostModel model);
        Task<DBOperation> Delete(int id);
        Task<List<MasterStateEntity>> GetStateList();
        Task<List<MasterStateEntity>> GetStateListByCountryId(int countryId);

    }
}
