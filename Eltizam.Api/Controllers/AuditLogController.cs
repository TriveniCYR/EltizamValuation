using Eltizam.Api.Filters;
using Eltizam.Api.Helpers.Response;
using Eltizam.Business.Core.Interface;
using Eltizam.Business.Models;
using Eltizam.Data.DataAccess.Helper;
using Microsoft.AspNetCore.Mvc;
using System.Net;

namespace EltizamValuation.Api.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    [AuthorizeAttribute]
    public class AuditLogController : ControllerBase
    {
        #region Properties

        private readonly IConfiguration _configuration;
        private readonly IResponseHandler<dynamic> _ObjectResponse; 
        private readonly IExceptionService _ExceptionService;
        private readonly IAuditLogService _auditLogService;

        #endregion Properties

        #region Constructor
        public AuditLogController(IConfiguration configuration, IResponseHandler<dynamic> ObjectResponse, IExceptionService exceptionService, IAuditLogService auditLog)
        {
            _configuration = configuration;
            _ObjectResponse = ObjectResponse; 
            _ExceptionService = exceptionService;
            _auditLogService = auditLog;
        }

        #endregion Constructor


        #region API Methods
         
        [HttpPost, Route("GetAll")]
        public async Task<IActionResult> GetAll([FromForm] DataTableAjaxPostModel model, int? UserName, string? TableName = null,  DateTime? DateFrom = null, DateTime? DateTo = null)
        {
            try
            {
                //var list = await _auditLogService.GetAll(model, TableName, DateFrom, DateTo);

                //return _ObjectResponse.CreateData(list, (Int32)HttpStatusCode.OK);

               // string? TableName = null; DateTime? DateFrom = null; DateTime? DateTo = null;

                return _ObjectResponse.CreateData(await _auditLogService.GetAll(model, UserName, TableName, DateFrom, DateTo), (Int32)HttpStatusCode.OK);
            }
            catch (Exception ex)
            {
                await _ExceptionService.LogException(ex);
                return _ObjectResponse.Create(false, (Int32)HttpStatusCode.InternalServerError, Convert.ToString(ex.StackTrace));
            }
        }
         

        [HttpGet, Route("GetLogDetailsByFilters")]
        public async Task<IActionResult> GetById(string TableName, int? Id, int? TableKey, DateTime? DateFrom, DateTime? DateTo)
        {
            try
            {
                var list = await _auditLogService.GetLogDetailsByFilters(TableName, Id, TableKey, DateFrom, DateTo);

                if (list != null)
                    return _ObjectResponse.Create(list, (Int32)HttpStatusCode.OK);
                else
                    return _ObjectResponse.Create(null, (Int32)HttpStatusCode.BadRequest, AppConstants.NoRecordFound);
            }
            catch (Exception ex)
            {
                await _ExceptionService.LogException(ex);
                return _ObjectResponse.Create(false, (Int32)HttpStatusCode.InternalServerError, Convert.ToString(ex.StackTrace));
            }
        }

        [HttpGet("GetAllAuditLogTableName")]
        public async Task<IActionResult> GetAllAuditLogTableName()
        {
            try
            {
                return _ObjectResponse.CreateData(await _auditLogService.GetAllAuditLogTableName(), (Int32)HttpStatusCode.OK);
            }
            catch (Exception ex)
            {
                return _ObjectResponse.Create(false, (Int32)HttpStatusCode.InternalServerError, Convert.ToString(ex.StackTrace));
            }
        }
        #endregion API Methods
    }
}
