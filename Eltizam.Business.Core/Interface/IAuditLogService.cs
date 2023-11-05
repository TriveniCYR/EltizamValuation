using Eltizam.Business.Models;
using Eltizam.Utility.Enums;
using static Eltizam.Utility.Enums.GeneralEnum;

namespace Eltizam.Business.Core.Interface
{
    public interface IAuditLogService
    {
        Task<bool> CreateAuditLog<TResult>(AuditActionTypeEnum auditActionType, TResult oldEntity, TResult newEntity,
                   string? PTName = null, int? PTId = null) where TResult : new();

        Task<List<AuditLogModel>> GetAllAuditLog();

        Task<AuditLogModel> GetById(int id); 
    }
}
