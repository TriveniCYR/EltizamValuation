using Eltizam.Business.Core.Interface;
using Eltizam.Business.Core.ModelMapper;
using Eltizam.Business.Models;
using Eltizam.Data.DataAccess.Core.Repositories;
using Eltizam.Data.DataAccess.Core.UnitOfWork;
using Eltizam.Data.DataAccess.Entity;
using Eltizam.Data.DataAccess.Helper;
using Eltizam.Utility;
using Eltizam.Utility.Enums;
using Eltizam.Utility.Utility;
using Microsoft.Extensions.Configuration;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using static Eltizam.Utility.Enums.GeneralEnum;

namespace Eltizam.Business.Core.Implementation
{
    public class MasterApproverLevelService : IMasterApproverLevelService
    {
        #region Properties

        private readonly IUnitOfWork _unitOfWork;
        private readonly IMapperFactory _mapperFactory;
        private readonly IConfiguration _configuration;
        private IRepository<MasterValuationRequestApproverLevel> _repository { get; set; }
        private IRepository<MasterUser> _UserRepository { get; set; }

        private readonly IAuditLogService _auditLogService;
        private readonly IHelper _helper;
        private readonly INotificationService _notificationService;

        #endregion Properties

        #region Constructor
        public MasterApproverLevelService(IAuditLogService auditLogService, IUnitOfWork unitOfWork, IMapperFactory mapperFactory, IHelper helper, IConfiguration configuration, INotificationService notificationService)
        {
            _unitOfWork = unitOfWork;
            _mapperFactory = mapperFactory;
            _UserRepository = _unitOfWork.GetRepository<MasterUser>();
            _configuration = configuration;
            _helper = helper;
            _notificationService = notificationService;
            _auditLogService = auditLogService;
            _repository = _unitOfWork.GetRepository<MasterValuationRequestApproverLevel>();
        }
        #endregion Constructor


        public async Task<DBOperation> UpsertMasterValuationRequestApproverLevel(MasterApproverLevelModel approver)
        {


            MasterValuationRequestApproverLevel requestApprover;

            // Check if the entity has an ID greater than 0 (indicating an update).
            if (approver.Id > 0)
            {
                requestApprover = _repository.Get(approver.Id);
                string MainTableName = Enum.GetName(TableNameEnum.MasterApproverLevel);
                int MainTableKey = requestApprover.Id;
                //Get current Entiry --AUDITLOGUSER
                MasterValuationRequestApproverLevel OldEntity = null;
                OldEntity = _repository.GetNoTracking(requestApprover.Id);
                requestApprover = _repository.Get(requestApprover.Id);

                // If the entity exists, update its properties.
                if (requestApprover != null)
                {
                    requestApprover.Description = Convert.ToString(approver.Description);
                    requestApprover.FromAmount = approver.FromAmount;
                    requestApprover.ToAmount = approver.ToAmount;
                    requestApprover.IsDeleted = false;
                    requestApprover.IsActive = approver.IsActive;
                    requestApprover.ModifiedDate = AppConstants.DateTime;
                    requestApprover.ModifiedBy = approver.ModifiedBy;

                    // Update the entity in the repository asynchronously.
                    _repository.UpdateAsync(requestApprover);
                    await _unitOfWork.SaveChangesAsync();
                    //Do Audit Log --AUDITLOGUSER
                    await _auditLogService.CreateAuditLog<MasterValuationRequestApproverLevel>(AuditActionTypeEnum.Update, OldEntity, requestApprover, MainTableName, MainTableKey);
                }
                else
                {
                    // Return a not found operation if the entity does not exist.
                    return DBOperation.NotFound;
                }
            }
            else
            {
                // Create a new Master_PropertyType entity from the model for insertion.
                requestApprover = _mapperFactory.Get<MasterApproverLevelModel, MasterValuationRequestApproverLevel>(approver);
                requestApprover.CreatedDate = AppConstants.DateTime;
                requestApprover.ModifiedBy = approver.ModifiedBy;
                requestApprover.CreatedBy = (int)approver.CreatedBy;
                requestApprover.IsDeleted = false;

                // Insert the new entity into the repository asynchronously.
                _repository.AddAsync(requestApprover);
                // Save changes to the database asynchronously.
                await _unitOfWork.SaveChangesAsync();
            }



            // Return an appropriate operation result.
            if (requestApprover.Id == 0)
                return DBOperation.Error;

            return DBOperation.Success;
        }

        public async Task<DataTableResponseModel> GetAll(DataTableAjaxPostModel model)
        {
            string ColumnName = model.order.Count > 0 ? model.columns[model.order[0].column].data : string.Empty;
            string SortDir = (model.order.Count > 0 ? model.order[0].dir : string.Empty);
          
            SqlParameter[] osqlParameter =
            {
                new SqlParameter(AppConstants.P_CurrentPageNumber,  model.start),
                new SqlParameter(AppConstants.P_PageSize,           model.length),
                new SqlParameter(AppConstants.P_SortColumn,         ColumnName),
                new SqlParameter(AppConstants.P_SortDirection,      SortDir),
                new SqlParameter(AppConstants.P_SearchText,         model.search?.value)
            };

            var Results = await _repository.GetBySP(ProcedureMetastore.usp_ApproverLevel_SearchAllList, CommandType.StoredProcedure, osqlParameter);

            //Get Pagination information
            var res = UtilityHelper.GetPaginationInfo(Results);

            DataTableResponseModel oDataTableResponseModel = new DataTableResponseModel(model.draw, res.Item1, res.Item1, Results.DataTableToList<MasterApproverLevelModel>());

            return oDataTableResponseModel;
        }


        public async Task<MasterApproverLevelModel> GetById(int Id)
        {
            DbParameter[] osqlParameter =
            { 
                new DbParameter("Id", Id, SqlDbType.Int),
            };

            var lstStf = EltizamDBHelper.ExecuteMappedReader<MasterApproverLevelModel>(ProcedureMetastore.usp_ApproverLevel_ListById, DatabaseConnection.ConnString, CommandType.StoredProcedure, osqlParameter).FirstOrDefault();

          
            var userlist = _UserRepository.FindAll(x => x.ApproverLevelId == Id).ToList();
            var lst = new List<ApproverUserModel>();

            foreach ( var item in userlist ) 
            {
                lst.Add(new ApproverUserModel()
                {
                    Id = item.Id,
                    UserName = item.UserName
                });
            } 
            lstStf.UsersList = lst;

            return lstStf;
        }




    }
}
