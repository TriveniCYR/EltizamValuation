using Eltizam.Business.Models;
using Eltizam.Utility.Enums;
using static Eltizam.Utility.Enums.GeneralEnum;

namespace Eltizam.Business.Core.Interface
{
    public interface IAuditLogService
    {
        Task<bool> CreateAuditLog<TResult>(AuditActionTypeEnum auditActionType, TResult Old, TResult New, 
                    string TableName, int? TableKeyId) where TResult : new();

        Task<List<AuditLogModel>> GetAllAuditLog();

        Task<AuditLogModel> GetById(int id); 
    }
}
