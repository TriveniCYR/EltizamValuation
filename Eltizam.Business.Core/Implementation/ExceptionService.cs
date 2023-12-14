using System.Data;
using static Eltizam.Utility.Enums.GeneralEnum;
using Eltizam.Business.Core.Interface;
using Eltizam.Business.Core.ModelMapper;
using Eltizam.Data.DataAccess.Core.Repositories;
using Eltizam.Data.DataAccess.Core.UnitOfWork;
using Eltizam.Resource;
using System.Data.SqlClient;
using Microsoft.Extensions.Localization;
using Eltizam.Data.DataAccess.Entity;
using Eltizam.Business.Models;

namespace Eltizam.Business.Core.Implementation
{
    public class ExceptionService : IExceptionService
    {
        private readonly IUnitOfWork _unitOfWork;
        private readonly IMapperFactory _mapperFactory;
        //private readonly IStringLocalizer<Errors> _stringLocalizerError;
        private readonly Microsoft.Extensions.Configuration.IConfiguration configuration;
        private IRepository<MasterException> _repository { get; set; }
        private readonly IHelper _helper;

        public ExceptionService(IUnitOfWork unitOfWork, IMapperFactory mapperFactory, //IStringLocalizer<Errors> stringLocalizerError,
                                 Microsoft.Extensions.Configuration.IConfiguration _configuration, IHelper helper)
        {
            _unitOfWork = unitOfWork;
            _mapperFactory = mapperFactory;
            _repository = _unitOfWork.GetRepository<MasterException>();
            configuration = _configuration;
            _helper = helper;
        }

        public async Task<DBOperation> LogException(Exception exception)
        {
            try
            {
                var userId = _helper.GetLoggedInUser()?.UserId ?? 1;

                SqlParameter[] osqlParameter =
                {
                    new SqlParameter("@Message", exception.Message),
                    new SqlParameter("@Source",  exception.Source),
                    new SqlParameter("@InnerException", Convert.ToString(exception.InnerException)),
                    new SqlParameter("@StackTrace", Convert.ToString(exception.StackTrace)),
                    new SqlParameter("@CreatedBy",  userId)
                };

                await _repository.GetBySP(ProcedureMetastore.usp_InsertException, System.Data.CommandType.StoredProcedure, osqlParameter);

                //var result = Convert.ToBoolean(dtOptions.Rows[0][0]);
                //if (result)
                return DBOperation.Success;
            }
            catch (Exception ex)
            {
                return DBOperation.Error;
            }
        }
    }
}
