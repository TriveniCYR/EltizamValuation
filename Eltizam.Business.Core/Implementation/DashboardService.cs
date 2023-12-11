using Eltizam.Business.Core.Interface;
using Eltizam.Business.Core.ModelMapper;
using Eltizam.Business.Models;
using Eltizam.Data.DataAccess.Core.UnitOfWork;
using Eltizam.Data.DataAccess.Entity;
using Eltizam.Data.DataAccess.Helper;
using Eltizam.Utility;
using Eltizam.Utility.Enums;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Eltizam.Business.Core.Implementation
{
    public class DashboardService : IDashboardService
    {
        #region Properties
        private readonly IUnitOfWork _unitOfWork;
        private readonly IMapperFactory _mapperFactory;
        private readonly Microsoft.Extensions.Configuration.IConfiguration configuration;
        //private IRepository<MasterClient> _repository { get; set; }
        private readonly IAuditLogService _auditLogService;
        private readonly IHelper _helper;
        private readonly string _dbConnection;
        #endregion Properties

        #region Constructor
        public DashboardService(IUnitOfWork unitOfWork, IMapperFactory mapperFactory, IAuditLogService auditLogService,
          IHelper helper,
           Microsoft.Extensions.Configuration.IConfiguration _configuration)
        {
            _unitOfWork = unitOfWork;
            _mapperFactory = mapperFactory;

            //_repository = _unitOfWork.GetRepository<MasterClient>()
            configuration = _configuration;
            _helper = helper;
            _auditLogService = auditLogService;

            _dbConnection = DatabaseConnection.ConnString;
        }
        #endregion Constructor


        #region API Methods
        public async Task<DashboardDataModel> GetDashboardData(DashboardFilterModel model)
        {
            var _dashboarddata = new DashboardDataModel(); 

            //_dashboarddata.TotalClients = 350;
            //_dashboarddata.TotalProjects = 450;
            //_dashboarddata.TotalRevenue = 450;
            //_dashboarddata.TotalDue = 450;
            //_dashboarddata.CompletedPerc = 78;
            //_dashboarddata.PendingPerc = 22;

            //if (_dashboarddata.TotalClients > 0 && _dashboarddata.TotalProjects > 0)
            {
                DbParameter[] osqlParameter =
                {
                     new DbParameter("ClientId",    model.ClientId,   SqlDbType.Int),
                     new DbParameter("PropertyId",  model.PropertyId, SqlDbType.Int),
                     new DbParameter("FromDate",    model.FromDate,   SqlDbType.VarChar),
                     new DbParameter("ToDate",      model.ToDate,     SqlDbType.VarChar),
                     new DbParameter("Pagesize",    model.Pagesize,   SqlDbType.Int),
                };

                var latestRequests = EltizamDBHelper.ExecuteMappedReader<DashboardLatestRequest>(ProcedureMetastore.usp_ValuationRequest_GetLatestRequest, _dbConnection, System.Data.CommandType.StoredProcedure, osqlParameter);
                if (latestRequests != null)  
                    _dashboarddata.LatestRequests = latestRequests;  
                
                var latestQuotations = EltizamDBHelper.ExecuteMappedReader<DashboardLatestQuotation>(ProcedureMetastore.usp_ValuationRequest_GetLatestQuotation, _dbConnection, System.Data.CommandType.StoredProcedure, osqlParameter);

                if (latestQuotations != null) 
                    _dashboarddata.LatestQuotations = latestQuotations;  

                 
                var topValuations = EltizamDBHelper.ExecuteMappedReader<TopValuationModel>(ProcedureMetastore.usp_ValuationRequest_GetTopValuation, _dbConnection, System.Data.CommandType.StoredProcedure, osqlParameter);
                if (latestQuotations != null) 
                    _dashboarddata.TopValuations = topValuations; 

                 
                var topQuotationDues = EltizamDBHelper.ExecuteMappedReader<TopQuotationDueModel>(ProcedureMetastore.usp_ValuationRequest_GetTopQuotationDue, _dbConnection, System.Data.CommandType.StoredProcedure, osqlParameter);
                if (latestQuotations != null) 
                    _dashboarddata.TopQuotationDues = topQuotationDues;

                var dashboardwidgets = EltizamDBHelper.ExecuteMappedReader<DashboardWidgetsRequest>(ProcedureMetastore.usp_ValuationRequest_GetWidgetRequest, _dbConnection, System.Data.CommandType.StoredProcedure, osqlParameter);
                if (dashboardwidgets != null)
                    _dashboarddata.DashboardWidgets = dashboardwidgets?.FirstOrDefault();
            }

            return _dashboarddata;
        }

        #endregion API Methods
    }
}
