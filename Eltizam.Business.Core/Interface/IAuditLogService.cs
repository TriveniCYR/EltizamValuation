using Eltizam.Business.Models;
using Eltizam.Utility.Enums;
using static Eltizam.Utility.Enums.GeneralEnum;

namespace Eltizam.Business.Core.Interface
{
    public interface IAuditLogService
    { 
        Task<DBOperation> CreateAuditLog<TResult>(AuditActionTypeEnum auditActionType, ModuleEnum moduleEnum, TResult Old, TResult New, int? PrimaryId) where TResult : new();

        Task<List<AuditLogEntity>> GetAllAuditLog();

        Task<AuditLogEntity> GetById(int id);

        ////Task<IEnumerable<MasterAuditLogWrapperEntity<AuditLog>>> GetByModuleId(int id, int moduleId);

        //Task<DataTableResponseModel> GetAll(DataTableAjaxPostModel model);
    }
}
