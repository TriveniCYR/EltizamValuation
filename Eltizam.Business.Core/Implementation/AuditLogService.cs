using Eltizam.Business.Core.Interface;
using Eltizam.Business.Core.ModelMapper;
using Eltizam.Business.Models;
using Eltizam.Data.DataAccess.Core.Repositories;
using Eltizam.Data.DataAccess.Core.UnitOfWork;
using Eltizam.Data.DataAccess.DataContext;
using Eltizam.Data.DataAccess.Entity;
using Eltizam.Data.DataAccess.Helper;
using Eltizam.Utility;
using Eltizam.Utility.AuditLog;
using Eltizam.Utility.Enums;
using Eltizam.Utility.Utility;
using Microsoft.EntityFrameworkCore;
using Newtonsoft.Json;
using System.Data;
using System.Globalization;
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
        protected readonly EltizamDBContext dbContext;
        private readonly string _dbConnection;
        private IRepository<MasterAuditLog> _repository { get; set; }
        private IRepository<MasterUser> _user { get; set; }
        //private IRepository<MasterUser> _userrepository { get; set; }

        public AuditLogService(EltizamDBContext Context, IUnitOfWork unitOfWork, IMapperFactory mapperFactory, IHelper helper, IExceptionService exceptionService)
        {
            _unitOfWork = unitOfWork;
            _mapperFactory = mapperFactory;
            _repository = _unitOfWork.GetRepository<MasterAuditLog>();
            _helper = helper;
            _ExceptionService = exceptionService;
            _user = _unitOfWork.GetRepository<MasterUser>();
            // _userrepository = _unitOfWork.GetRepository<MasterUser>(); ;

            dbContext = Context ?? throw new ArgumentNullException(nameof(Context));
            _dbConnection = DatabaseConnection.ConnString;
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
                PropertyInfo pInfo = newEntity.GetType().GetProperty(AppConstants.ModifiedBy);
                int logCreatedBy = Convert.ToInt32(pInfo.GetValue(newEntity, null));

                //Get table Name, Id
                var TableName = typeof(TResult).Name;
                var TableKeyId = Convert.ToInt32(GetPrimaryKey<TResult>(oldEntity));

                //Save Audit Log
                MasterAuditLog objAuditLog;
                var entityAudit = new MasterAuditLog()
                {
                    CreatedBy = logCreatedBy,
                    ActionType = Enum.GetName(typeof(AuditActionTypeEnum), auditActionType),
                    Log = oldEntity.ToAuditLog(newEntity),
                    TableKeyId = TableKeyId,
                    TableName = TableName,
                    ParentTableKeyId = PTId,
                    ParentTableName = PTName?.Replace("_", ""),
                };

                if (entityAudit.Log != "[]")
                    AddAuditLog(entityAudit);

                return true; // DBOperation.Success;
            }
            catch (Exception ex)
            {
                await _ExceptionService.LogException(ex);
                return false; // DBOperation.Error;
            }
        }

        public void AddAuditLog(MasterAuditLog log)
        {
            DbParameter[] dbParameters =
            {
                 new DbParameter("TableKeyId",             log.TableKeyId, SqlDbType.Int),
                 new DbParameter("TableName",              log.TableName, SqlDbType.VarChar),
                 new DbParameter("ParentTableKeyId",       log.ParentTableKeyId, SqlDbType.Int),
                 new DbParameter("ParentTableName",        log.ParentTableName, SqlDbType.VarChar),
                 new DbParameter("Log",                    log.Log, SqlDbType.VarChar),
                 new DbParameter("ActionType",             log.ActionType, SqlDbType.Int),
                 new DbParameter("CreatedBy",              log.CreatedBy, SqlDbType.Int)
            };

            EltizamDBHelper.ExecuteNonQuery(ProcedureMetastore.usp_AuditLog_Add, _dbConnection, CommandType.StoredProcedure, dbParameters);
        }

        public virtual int GetPrimaryKey<T>(T entity)
        {
            var keyName = dbContext.Model.FindEntityType(typeof(T)).FindPrimaryKey().Properties
                          .Select(x => x.Name).Single();

            return (int)entity.GetType().GetProperty(keyName).GetValue(entity, null);
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


        public async Task<DataTableResponseModel> GetAll(DataTableAjaxPostModel model, int? UserName, string? TableName = null, DateTime? DateFrom = null, DateTime? DateTo = null)
        {
            string ColumnName = (model.order.Count > 0 ? model.columns[model.order[0].column].data : string.Empty);
            string SortDir = (model.order.Count > 0 ? model.order[0].dir : string.Empty);

            System.Data.SqlClient.SqlParameter[] osqlParameter =
            {
                new System.Data.SqlClient.SqlParameter(AppConstants.P_CurrentPageNumber,  model.start),
                new System.Data.SqlClient.SqlParameter(AppConstants.P_PageSize,           model.length),
                new System.Data.SqlClient.SqlParameter(AppConstants.P_SortColumn,         ColumnName),
                new System.Data.SqlClient.SqlParameter(AppConstants.P_SortDirection,      SortDir),
                new System.Data.SqlClient.SqlParameter(AppConstants.P_SearchText,         model.search?.value),
                new System.Data.SqlClient.SqlParameter("@UserId",                         UserName),
                new System.Data.SqlClient.SqlParameter("@TableName",                      TableName),
                new System.Data.SqlClient.SqlParameter("@DateFrom",                       DateFrom),
                new System.Data.SqlClient.SqlParameter("@DateTo",                         DateTo)
            };

            var Results = await _repository.GetBySP(ProcedureMetastore.usp_AuditLog_SearchAllList, CommandType.StoredProcedure, osqlParameter);

            //Get Pagination information
            var res = UtilityHelper.GetPaginationInfo(Results);

            DataTableResponseModel resp = new DataTableResponseModel(model.draw, res.Item1, res.Item1, Results.DataTableToList<AuditLogModelResponse>());

            return resp;
        }
        public async Task<List<AuditLogModelResponse>> GetLogDetailsByFilters(string? TableName, int? Id = null, int? TableKey = null, DateTime? DateFrom = null, DateTime? DateTo = null)
        {
           // var users = await _repository.GetAllAsync();
            //TableName = "MasterUser";

            var entityAuditLogs = await _repository.FindAllAsync(x =>
                   (TableName == null || (x.ParentTableName == TableName || x.TableName == TableName))
                && (TableKey == null || (x.ParentTableKeyId == TableKey || x.TableKeyId == TableKey))
                && (DateFrom == null || x.CreatedDate >= DateFrom)
                && (DateTo == null || x.CreatedDate <= DateTo)
                && (Id == null || x.Id == Id));

            var res = new List<AuditLogModelResponse>();
            foreach (var log in entityAuditLogs)
            {
                var _AuditLogListData = JsonConvert.DeserializeObject<IEnumerable<AuditLogs>>(log.Log);

                var usr = _user.GetAll().Where(a => a.Id == log.CreatedBy).FirstOrDefault();
                res.Add(new AuditLogModelResponse()
                {
                   
                    ActionType = log.ActionType,
                    ParentTableKeyId = log.ParentTableKeyId,
                    ParentTableName = log.ParentTableName,
                    TableKeyId = log.TableKeyId,
                    TableName = log.TableName,
                    Id = log.Id,
                    CreatedBy = log.CreatedBy,
                    CreatedDate = log.CreatedDate, // Include both date and time
                    CreatedDateFormatted = log.CreatedDate?.ToString("yyyy-MM-dd HH:mm:ss"), // Formatted date and time
                    CreatedByName = usr.FirstName + ' ' + usr.LastName, // Use null-conditional operator
                    AuditLogListData = _AuditLogListData?.ToList(),
                }); 
            }

            //// Sort the res list by CreatedDate (including date and time)
            //var sortedLogs = res.OrderBy(log => log.CreatedDate).ToList();

            //// Group the sortedLogs list by date
            //var groupedLogs = sortedLogs.GroupBy(log => log.CreatedDate?.Date);

            //// Create a list of grouped results with time included as a formatted string
            //var resultsWithTime = new List<AuditLogModelResponse>();
            //foreach (var group in groupedLogs)
            //{
            //    var firstLogInGroup = group.FirstOrDefault();
            //    resultsWithTime.Add(new AuditLogModelResponse
            //    {
            //        CreatedDate = group.Key,
            //        CreatedDateFormatted = group.Key?.ToString("yyyy-MM-dd HH:mm:ss"),
            //        CreatedByName = firstLogInGroup?.CreatedByName,
            //        AuditLogListData = group.SelectMany(item => item.AuditLogListData).ToList()
            //    });
            //}
            //return resultsWithTime;

            return res;
        }

        //--Order by date and same time--
        //public async Task<List<AuditLogModelResponse>> GetLogDetailsByFilters(string TableName, int? Id = null, int? TableKey = null, DateTime? DateFrom = null, DateTime? DateTo = null)
        //{
        //    var users = await _userrepository.GetAllAsync();
        //    TableName = "MasterUser";
        //    var entityAuditLogs = await _repository.FindAllAsync(x =>
        //        (TableName == null || (x.ParentTableName == TableName || x.TableName == TableName))
        //        && (TableKey == null || (x.ParentTableKeyId == TableKey || x.TableKeyId == TableKey))
        //        && (!DateFrom.HasValue || x.CreatedDate >= DateFrom)
        //        && (!DateTo.HasValue || x.CreatedDate <= DateTo)
        //        && (Id == null || x.Id == Id));

        //    var res = new List<AuditLogModelResponse>();
        //    foreach (var log in entityAuditLogs)
        //    {
        //        var _AuditLogListData = JsonConvert.DeserializeObject<IEnumerable<AuditLogs>>(log.Log);

        //        res.Add(new AuditLogModelResponse()
        //        {
        //            ActionType = log.ActionType,
        //            ParentTableKeyId = log.ParentTableKeyId,
        //            ParentTableName = log.ParentTableName,
        //            TableKeyId = log.TableKeyId,
        //            TableName = log.TableName,
        //            Id = log.Id,
        //            CreatedBy = log.CreatedBy,
        //            CreatedDate = log.CreatedDate,
        //            CreatedByName = users.FirstOrDefault(a => a.Id == log.CreatedBy)?.UserName,
        //            AuditLogListData = _AuditLogListData?.ToList(),
        //        });
        //    }

        //    // Sort the list by CreatedDate
        //    var groupedLogs = res.GroupBy(log => log.CreatedDate).Select(group => new AuditLogModelResponse
        //    {
        //        CreatedDate = group.Key,
        //        AuditLogListData = group.SelectMany(item => item.AuditLogListData).ToList()
        //    }).ToList();
        //    return groupedLogs;
        //}

        //public async Task<List<AuditLogModelResponse>> GetLogDetailsByFilters(string TableName, int? Id = null, int? TableKey = null, DateTime? DateFrom = null, DateTime? DateTo = null)
        //{ 
        //    var users = await _userrepository.GetAllAsync();
        //    TableName ="MasterUser";
        //    var entityAuditLogs = await _repository.FindAllAsync(x =>
        //                            (TableName == null || (x.ParentTableName == TableName || x.TableName == TableName))
        //                         && (TableKey == null || (x.ParentTableKeyId == TableKey || x.TableKeyId == TableKey))
        //                         && (DateFrom == null || x.CreatedDate >= DateFrom)
        //                         && (DateTo == null || x.CreatedDate <= DateTo)
        //                         && (Id == null || x.Id == Id));

        //    var res = new List<AuditLogModelResponse>();
        //    foreach (var log in entityAuditLogs)
        //    {
        //        var _AuditLogListData = JsonConvert.DeserializeObject<IEnumerable<AuditLogs>>(log.Log);

        //        res.Add(new AuditLogModelResponse()
        //        { 
        //            ActionType = log.ActionType,
        //            ParentTableKeyId = log.ParentTableKeyId,
        //            ParentTableName = log.ParentTableName,
        //            TableKeyId = log.TableKeyId,
        //            TableName = log.TableName,
        //            Id = log.Id,
        //            CreatedBy = log.CreatedBy,
        //            CreatedDate = log.CreatedDate,
        //            CreatedByName = users.Where(a=>a.Id == log.CreatedBy).First().UserName,
        //            AuditLogListData = _AuditLogListData?.ToList(),
        //        }); 
        //    }

        //    return res; 
        //}

        public async Task<List<AuditLogTableModel>> GetAllAuditLogTableName()
        {

            var lstStf = EltizamDBHelper.ExecuteMappedReader<AuditLogTableModel>(ProcedureMetastore.usp_AuditLog_GetTable,
             DatabaseConnection.ConnString, CommandType.StoredProcedure, null);

            return lstStf;
        }
    }
}
