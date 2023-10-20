using Eltizam.Business.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using static Eltizam.Utility.Enums.GeneralEnum;

namespace Eltizam.Business.Core.Interface
{
    public interface IMasterDesignationService
    {
        Task<DBOperation> Upsert(MasterDesignationEntity entityUser);
        Task<MasterDesignationEntity> GetById(int id);
        //Task<DataTableResponseModel> GetAll(DataTableAjaxPostModel model);

        Task<List<MasterDesignationEntity>> GetAll();
        Task<DBOperation> Delete(int id);
        Task<List<MasterDesignationEntity>> GetDesignationList();
    }
}
