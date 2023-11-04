using Eltizam.Business.Core.Interface;
using Eltizam.Business.Core.ModelMapper;
using Eltizam.Business.Models;
using Eltizam.Data.DataAccess.Core.Repositories;
using Eltizam.Data.DataAccess.Core.UnitOfWork;
using Eltizam.Data.DataAccess.Entity;
using Eltizam.Utility.AuditLog;
using Eltizam.Utility.Enums;

namespace Eltizam.Business.Core.Implementation
{
    /// <summary>
    /// Added by YReddy on 11/01/2023 for Auditlog
    /// </summary>
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

        /// <summary>
        /// Added by YReddy on 11/04/2023 project
        /// Create Audit log for changes in any of the field
        /// </summary>
        /// <typeparam name="TResult"></typeparam>
        /// <param name="auditActionType"></param>
        /// <param name="Old"></param>
        /// <param name="New"></param>
        /// <param name="TableName"></param>
        /// <param name="TableKeyId"></param>
        /// <returns></returns>
        public async Task<bool> CreateAuditLog<TResult>(AuditActionTypeEnum auditActionType, TResult Old, TResult New, string TableName, int? TableKeyId)
                     where TResult : new()
        {
            try
            {
                MasterAuditLog objAuditLog;
                var entityAuditLog = new AuditLogModel();

                entityAuditLog.CreatedBy = _helper.GetLoggedInUser().UserId;
                entityAuditLog.ActionType = Enum.GetName(typeof(AuditActionTypeEnum), auditActionType);
                entityAuditLog.Log = Old.ToAuditLog(New);
                entityAuditLog.TableName = TableName;
                entityAuditLog.TableKeyId = (int)TableKeyId;

                if (entityAuditLog.Log != "[]")
                {
                    objAuditLog = _mapperFactory.Get<AuditLogModel, MasterAuditLog>(entityAuditLog);
                    
                    _repository.AddAsync(objAuditLog); 
                    await _unitOfWork.SaveChangesAsync();

                    if (objAuditLog.Id == 0)
                        return false; // DBOperation.Error;
                }
                return true; // DBOperation.Success;
            }
            catch (Exception ex)
            {
                await _ExceptionService.LogException(ex);
                return false; // DBOperation.Error;
            }
        }

        public Task<List<AuditLogModel>> GetAllAuditLog()
        {
            throw new NotImplementedException();
        }

        public Task<AuditLogModel> GetById(int id)
        {
            throw new NotImplementedException();
        }
    }
}
