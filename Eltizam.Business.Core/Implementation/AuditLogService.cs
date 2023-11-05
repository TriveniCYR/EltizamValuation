using Eltizam.Business.Core.Interface;
using Eltizam.Business.Core.ModelMapper;
using Eltizam.Business.Models;
using Eltizam.Data.DataAccess.Core.Repositories;
using Eltizam.Data.DataAccess.Core.UnitOfWork;
using Eltizam.Data.DataAccess.Entity;
using Eltizam.Data.DataAccess.Helper;
using Eltizam.Utility.AuditLog;
using Eltizam.Utility.Enums;
using Eltizam.Utility.Utility;
using Microsoft.EntityFrameworkCore;
using Newtonsoft.Json;
using System;
using System.Data;
using System.Data.SqlClient;
using System.Reflection;

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
        protected readonly DbContext dbContext;
        private IRepository<MasterAuditLog> _repository { get; set; }

        public AuditLogService(DbContext Context, IUnitOfWork unitOfWork, IMapperFactory mapperFactory, IHelper helper, IExceptionService exceptionService)
        {
            _unitOfWork = unitOfWork;
            _mapperFactory = mapperFactory;
            _repository = _unitOfWork.GetRepository<MasterAuditLog>();
            _helper = helper;
            _ExceptionService = exceptionService;
            dbContext = Context ?? throw new ArgumentNullException(nameof(Context));
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
        public async Task<bool> CreateAuditLog<TResult>(AuditActionTypeEnum auditActionType, TResult oldEntity, TResult newEntity,  
                     string? PTName = null, int? PTId = null) where TResult : new()
        {
            try
            {
                //Get Last Modified
                PropertyInfo pInfo = newEntity.GetType().GetProperty("ModifiedBy"); 
                int logCreatedBy = Convert.ToInt32(pInfo.GetValue(newEntity, null)); // ?? _helper.GetLoggedInUser().UserId

                //Get table Name, Id
                var TableName = typeof(TResult).Name;
                var TableKeyId = Convert.ToInt32(GetPrimaryKey<TResult>(oldEntity));  

                //Save Audit Log
                MasterAuditLog objAuditLog;
                var entityAuditLog = new AuditLogModel()
                {
                    CreatedBy = logCreatedBy, 
                    ActionType = Enum.GetName(typeof(AuditActionTypeEnum), auditActionType),
                    Log = oldEntity.ToAuditLog(newEntity),
                    TableKeyId = TableKeyId,
                    TableName = TableName,
                    ParentTableKeyId = PTId,
                    ParentTableName = PTName,
                };

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

        public virtual int GetPrimaryKey<T>(T entity)
        {
            var keyName = dbContext.Model.FindEntityType(typeof(T)).FindPrimaryKey().Properties
                          .Select(x => x.Name).Single();

            return (int)entity.GetType().GetProperty(keyName).GetValue(entity, null);
        }

        public Task<List<AuditLogModel>> GetAllAuditLog()
        {
            throw new NotImplementedException();
        }

        public Task<AuditLogModel> GetById(int id)
        {
            throw new NotImplementedException();
        }

        public async Task<IEnumerable<MasterAuditLogWrapperEntity<AuditLog>>> GetByModuleId(int id, string tableName)
        {
            var entityAuditLog = await _repository.FindAllAsync(x => x.TableKeyId == id && x.TableName == tableName);
            var auditLog = entityAuditLog.Select(xx => new MasterAuditLogWrapperEntity<AuditLog>
            {
                ActionType = xx.ActionType,
                Id = xx.Id,
                CreatedBy = xx.CreatedBy,
                CreatedDate = xx.CreatedDate,
                TableKeyId = xx.TableKeyId,
                TableName = xx.TableName,
                Log = JsonConvert.DeserializeObject<IEnumerable<AuditLog>>(xx.Log)
            });

            return auditLog;
        }

        public async Task<DataTableResponseModel> GetAll(DataTableAjaxPostModel model, string? TableName, string? DateFrom, string? DateTo)
        {
            string ColumnName = (model.order.Count > 0 ? model.columns[model.order[0].column].data : string.Empty);
            string SortDir = (model.order.Count > 0 ? model.order[0].dir : string.Empty);

            SqlParameter[] osqlParameter =
            {
                new SqlParameter(AppConstants.P_CurrentPageNumber,  model.start),
                new SqlParameter(AppConstants.P_PageSize,           model.length),
                new SqlParameter(AppConstants.P_SortColumn,         ColumnName),
                new SqlParameter(AppConstants.P_SortDirection,      SortDir),
                new SqlParameter(AppConstants.P_SearchText,         model.search?.value),
                new SqlParameter("@TableName",                      TableName),
                new SqlParameter("@DateFrom",                       DateFrom),
                new SqlParameter("@DateTo",                         DateTo)
            };

            var Results = await _repository.GetBySP(ProcedureMetastore.usp_AuditLog_SearchAllList, CommandType.StoredProcedure, osqlParameter);

            //Get Pagination information
            var res = UtilityHelper.GetPaginationInfo(Results);

            var res1 = Results.DataTableToList<AuditLogModelResponse>();
            foreach (var _r in res1)
            {
                _r.AuditLogListData = JsonConvert.DeserializeObject<List<Models.AuditLogs>>(_r.Log);
            }

            DataTableResponseModel oDataTableResponseModel = new DataTableResponseModel(model.draw, res.Item1, res.Item1, res1);


            return oDataTableResponseModel;
        }
    }
}
