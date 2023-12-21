using Eltizam.Business.Core.Interface;
using Eltizam.Business.Core.ModelMapper;
using Eltizam.Business.Models;
using Eltizam.Data.DataAccess.Core.Repositories;
using Eltizam.Data.DataAccess.Core.UnitOfWork;
using Eltizam.Data.DataAccess.Entity;
using Eltizam.Data.DataAccess.Helper;
using Eltizam.Utility;
using System;
using System.Data;

namespace Eltizam.Business.Core.Implementation
{
    public class ValuationRequestStatusService: IValuationRequestStatusService
    {
        private readonly IUnitOfWork _unitOfWork;
        private readonly IMapperFactory _mapperFactory;
        private readonly Microsoft.Extensions.Configuration.IConfiguration configuration;

        private IRepository<MasterValuationStatus> _repository { get; set; }
        private readonly IHelper _helper;
        public ValuationRequestStatusService(IUnitOfWork unitOfWork, IMapperFactory mapperFactory,
                                             IHelper helper, Microsoft.Extensions.Configuration.IConfiguration _configuration)
        {
            _unitOfWork = unitOfWork;
            _mapperFactory = mapperFactory;

            _repository = _unitOfWork.GetRepository<MasterValuationStatus>();
            configuration = _configuration;
            _helper = helper;
        }

        
        public async Task<List<ValuationRequestStatusModel>> GetAll(int? roleId = null, string? action = null, int? ValReqId = null)
        { 
            DbParameter[] osqlParameter =
            {
                new DbParameter("RoleId", roleId, SqlDbType.Int),
                new DbParameter("Action", action, SqlDbType.VarChar),
                new DbParameter("ValReqId", ValReqId, SqlDbType.Int),
            }; 
            var lstStf = EltizamDBHelper.ExecuteMappedReader<ValuationRequestStatusModel>(ProcedureMetastore.usp_Master_ValuationStatus_List, DatabaseConnection.ConnString, CommandType.StoredProcedure, osqlParameter);

            return lstStf;
        }

        public async Task<List<ValuationRequestStatusModel>> GetAllStatus()
        {
            var lstStf = await GetAll(); 
            return lstStf;
        }

        public async Task<List<ValuationRequestStatusModel>> GetInvoiceTransactionStatus(int type)
        {
            DbParameter[] osqlParameter =
            {
                new DbParameter("Type", type, SqlDbType.Int)
            };
            var lstStf = EltizamDBHelper.ExecuteMappedReader<ValuationRequestStatusModel>(ProcedureMetastore.usp_Master_Valuation_InvoiceStatus_List, DatabaseConnection.ConnString, CommandType.StoredProcedure, osqlParameter);

            return lstStf;
        }

        public async Task<List<ValuationRequestHistoryStatusModel>> GetAllStatusHistory( int? ValReqId = null)
        {
            DbParameter[] osqlParameter =
            {
                
                new DbParameter("ValReqId", ValReqId, SqlDbType.Int),
            };
            var lstStf = EltizamDBHelper.ExecuteMappedReader<ValuationRequestHistoryStatusModel>(ProcedureMetastore.usp_ValuationRequest_StatusHistory, DatabaseConnection.ConnString, CommandType.StoredProcedure, osqlParameter);

            return lstStf;
        }
    }
}
