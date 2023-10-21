﻿using Eltizam.Business.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using static Eltizam.Utility.Enums.GeneralEnum;

namespace Eltizam.Business.Core.Interface
{
    public interface IMasterCountryService
    {
        Task<DBOperation> Upsert(MasterCountryModel entityUser);
        Task<MasterCountryModel> GetById(int id);
        Task<DataTableResponseModel> GetAll(DataTableAjaxPostModel model);
        Task<DBOperation> Delete(int id);
        Task<List<MasterCountryModel>> GetCountryList();
    }
}