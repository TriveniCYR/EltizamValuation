using Eltizam.Business.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using static Eltizam.Utility.Enums.GeneralEnum;

namespace Eltizam.Business.Core.Interface
{
    public interface IMasterApproverLevelService
    {
         Task<DBOperation> UpsertMasterValuationRequestApproverLevel(MasterApproverLevelModel approver);
        Task<List<MasterApproverLevelModel>> GetAll();
        Task<MasterApproverLevelModel> GetById(int Id);
    }
}
