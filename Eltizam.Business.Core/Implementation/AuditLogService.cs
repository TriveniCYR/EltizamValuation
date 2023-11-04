using Eltizam.Business.Core.Interface;
using Eltizam.Business.Core.ModelMapper;
using Eltizam.Business.Models;
using Eltizam.Data.DataAccess.Core.Repositories;
using Eltizam.Data.DataAccess.Core.UnitOfWork;
using Eltizam.Data.DataAccess.Entity;
using Eltizam.Utility.AuditLog;
using Eltizam.Utility.Enums;
using static Eltizam.Utility.Enums.GeneralEnum;

namespace Eltizam.Business.Core.Implementation
{
    public class AuditLogService : IAuditLogService
    {
        private readonly IUnitOfWork _unitOfWork;
        private readonly IMapperFactory _mapperFactory;
        private readonly IHelper _helper;
        private readonly IExceptionService _ExceptionService;
        private IRepository<MasterAuditLog> _repository { get; set; } 

        public AuditLogService(IUnitOfWork unitOfWork, IMapperFactory mapperFactory, IHelper helper, IExceptionService exceptionService)
        {
            _unitOfWork = unitOfWork;
            _mapperFactory = mapperFactory;
            _repository = _unitOfWork.GetRepository<MasterAuditLog>();  
            _helper = helper;
            _ExceptionService = exceptionService;
        }

        public async Task<DBOperation> CreateAuditLog<TResult>(AuditActionTypeEnum auditActionType,
                     ModuleEnum moduleEnum, TResult Old, TResult New, int? PrimaryId)
                     where TResult : new()
        {
            try
            {
                MasterAuditLog objAuditLog;
                var entityAuditLog = new AuditLogEntity();

                entityAuditLog.CreatedBy = _helper.GetLoggedInUser().UserId;
                entityAuditLog.ActionType = Enum.GetName(typeof(AuditActionTypeEnum), auditActionType);
                entityAuditLog.Log = Old.ToAuditLog(New);
                entityAuditLog.ModuleId = (int)moduleEnum;
                entityAuditLog.EntityId = (int)PrimaryId;

                if (entityAuditLog.Log != "[]")
                {
                    objAuditLog = _mapperFactory.Get<AuditLogEntity, MasterAuditLog>(entityAuditLog);
                    _repository.AddAsync(objAuditLog);

                    await _unitOfWork.SaveChangesAsync();

                    if (objAuditLog.Id == 0)
                        return DBOperation.Error;
                }
                return DBOperation.Success;
            }
            catch (Exception ex)
            {
                await _ExceptionService.LogException(ex);
                return DBOperation.Error;
            }
        }

        public Task<List<AuditLogEntity>> GetAllAuditLog()
        {
            throw new NotImplementedException();
        }

        public Task<AuditLogEntity> GetById(int id)
        {
            throw new NotImplementedException();
        }
    }
}
