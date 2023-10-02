using Eltizam.Business.Models;
using Eltizam.Data.DataAccess.Entity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using static Eltizam.Utility.Enums.GeneralEnum;

namespace Eltizam.Business.Core.Interface
{
    public interface IMasterQualificationServices
    {
        Task<DBOperation> AddUpdateQualification(Master_QualificationModel entityqualification);
        Task<Master_QualificationModel> GetMasterQualificationByIdAsync(int id);

        Task<DataTableResponseModel> GetAll(DataTableAjaxPostModel model);

        Task<DBOperation> DeleteQualification(int id);
    }
}
