using Eltizam.Business.Models;
using Eltizam.Utility.Enums;
using static Eltizam.Utility.Enums.GeneralEnum;

namespace Eltizam.Business.Core.Interface
{
    public interface IAuditLogService
    {
        Task<bool> CreateAuditLog<TResult>(AuditActionTypeEnum auditActionType, TResult oldEntity, TResult newEntity,
                   string? PTName = null, int? PTId = null) where TResult : new();

        Task<DataTableResponseModel> GetAll(DataTableAjaxPostModel model,int? UserName, string? TableName = null, DateTime? DateFrom = null, DateTime? DateTo = null);

        Task<List<AuditLogModelResponse>> GetLogDetailsByFilters(string? TableName, int? Id = null, int? TableKey = null, DateTime? DateFrom = null, DateTime? DateTo = null);
        Task<List<AuditLogTableModel>> GetAllAuditLogTableName();

        Task<DataTableResponseModel> GetAllDetailsLog(DataTableAjaxPostModel model, string? TableName, int? Id = null, int? TableKey = null, DateTime? DateFrom = null, DateTime? DateTo = null);
        //Task<AuditLogModelResponse> GetAllDetailsLog(DataTableAjaxPostModel model, string? TableName, int? Id = null, int? TableKey = null, DateTime? DateFrom = null, DateTime? DateTo = null, List<AuditLogs> auditLogListData = null);
    }
}
