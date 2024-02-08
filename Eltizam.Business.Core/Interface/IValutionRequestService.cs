using Eltizam.Business.Models;
using static Eltizam.Utility.Enums.GeneralEnum;

namespace Eltizam.Business.Core.Interface
{
    public interface IValuationRequestService
    {
        Task<DataTableResponseModel> GetAll(DataTableAjaxPostModel model, ValuationRequestFilters filters);
        Task<DBOperation> AssignApprover(AssignApprovorRequestModel model);
        Task<DBOperation> ApproverActionComment(ApproverActionCommentModel model);
        Task<DBOperation> AssignApproverStatus(ApprovorStatusRequestModel model);
        Task<List<ValuationMethod>> GetAllValuationMethod();
        Task<DBOperation> Upsert(ValuationRequestModel entityUser);
        Task<ValuationRequestModel> GetById(int id);
        Task<DBOperation> Delete(int id);
        Task<DBOperation> UpdateRequestStatus(ValutionRequestStatusChangeModel model);

        Task<DBOperation> UpsertApproverLevels(int ValReqId, string RequestData, int? CreatedBy, int? ValQuotId = null);
        Task<ValuationRequestDependencies> GetValuationRequestInfo(int Id);
        Task<DBOperation> ValuationDocument(ValuationDocumentModel model);

        Task<List<ValuationRequestApproverLevelModel>> GetApproverLevel(int? ValReqId, decimal? Amount = null);
    }
}
