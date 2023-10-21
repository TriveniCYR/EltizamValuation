﻿using Eltizam.Business.Models;
using Eltizam.Data.DataAccess.Entity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using static Eltizam.Utility.Enums.GeneralEnum;

namespace Eltizam.Business.Core.Interface
{
    public interface IMasterDepartmentService
    {
        Task<DBOperation> Upsert(MasterDepartmentEntity entityUser);
        Task<MasterDepartmentEntity> GetById(int id);
        //Task<DataTableResponseModel> GetAll(DataTableAjaxPostModel model);
        Task<List<MasterDepartmentEntity>> GetAll();

        Task<DBOperation> Delete(int id);
        Task<List<MasterDepartmentEntity>> GetDepartmentList();
    }
}