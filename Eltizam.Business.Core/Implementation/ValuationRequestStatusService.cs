using Eltizam.Business.Core.Interface;
using Eltizam.Business.Core.ModelMapper;
using Eltizam.Business.Models;
using Eltizam.Data.DataAccess.Core.Repositories;
using Eltizam.Data.DataAccess.Core.UnitOfWork;
using Eltizam.Data.DataAccess.Entity;
using Eltizam.Data.DataAccess.Helper;
using Eltizam.Resource;
using Eltizam.Utility;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Eltizam.Business.Core.Implementation
{
    public class ValuationRequestStatusService: IValuationRequestStatusService
    {
        private readonly IUnitOfWork _unitOfWork;
        private readonly IMapperFactory _mapperFactory;
        private readonly Microsoft.Extensions.Configuration.IConfiguration configuration;

        private IRepository<ValuationRequestStatus> _repository { get; set; }
        private readonly IHelper _helper;
        public ValuationRequestStatusService(IUnitOfWork unitOfWork, IMapperFactory mapperFactory,
                                  IHelper helper,
                                 Microsoft.Extensions.Configuration.IConfiguration _configuration)
        {
            _unitOfWork = unitOfWork;
            _mapperFactory = mapperFactory;

            _repository = _unitOfWork.GetRepository<ValuationRequestStatus>();
            configuration = _configuration;
            _helper = helper;
        }

        
        public async Task<List<ValuationRequestStatusModel>> GetAll(int roleId,string action)
        {

            DbParameter[] osqlParameter =
           {
                new DbParameter("RoleId", roleId, SqlDbType.Int),
                new DbParameter("Action", action, SqlDbType.VarChar),
            };
            //var ValuationRequestDependencies = EltizamDBHelper.ExecuteMappedReader<ValuationRequestDependencies>(ProcedureMetastore.usp_ValuationRequest_GetDependencies, DatabaseConnection.ConnString, System.Data.CommandType.StoredProcedure, osqlParameter);

            var lstStf = EltizamDBHelper.ExecuteMappedReader<ValuationRequestStatusModel>(ProcedureMetastore.usp_ValuationRequestStatus_AllList,
             DatabaseConnection.ConnString, CommandType.StoredProcedure, osqlParameter);

            return lstStf;
        }

        public async Task<List<ValuationRequestStatusModel>> GetAllStatus()
        {

             var lstStf = EltizamDBHelper.ExecuteMappedReader<ValuationRequestStatusModel>(ProcedureMetastore.usp_ValuationRequestStatusList,
             DatabaseConnection.ConnString, CommandType.StoredProcedure, null);

            return lstStf;
        }
    }
}
