using Eltizam.Business.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using static Eltizam.Utility.Enums.GeneralEnum;

namespace Eltizam.Business.Core.Interface
{
    public interface IValutionRequestService
    {
        Task<DataTableResponseModel> GetAll(DataTableAjaxPostModel model, ValuationRequestFilters filters);
        Task<DBOperation> AssignApprover(AssignApprovorRequestModel model);
        Task<DBOperation> AssignApproverStatus(ApprovorStatusRequestModel model);
        Task<List<ValuationMethod>> GetAllValuationMethod();
        Task<DBOperation> Upsert(ValuationRequestModel entityUser);
        Task<ValuationRequestModel> GetById(int id);
        Task<DBOperation> Delete(int id);
        Task<DBOperation> ReviewerRequestStatus(ValutionRequestForApproverModel model);
    }
}
