using Eltizam.Business.Core.Interface;
using Eltizam.Business.Models;
using Eltizam.Data.DataAccess.Helper;
using Eltizam.WebApi.Filters;
using Eltizam.WebApi.Helpers.Response;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using static Eltizam.Utility.Enums.GeneralEnum;
using System.Net;

namespace EltizamValuation.WebApi.Controllers
{
    [ApiVersion("1")]
    [Route("api/v{version:apiVersion}/[controller]")]
    [ApiController]
    [AuthorizeAttribute]
    public class MasterApproverLevelController : ControllerBase
    {
        #region Properties

        private readonly IConfiguration _configuration;
        private readonly IResponseHandler<dynamic> _ObjectResponse;
        private Microsoft.Extensions.Hosting.IHostingEnvironment _env;
        private readonly IExceptionService _ExceptionService;
        private readonly IMasterApproverLevelService _approverLevelService;

        #endregion Properties

        #region Constructor
        public MasterApproverLevelController(IConfiguration configuration, IResponseHandler<dynamic> ObjectResponse, IExceptionService exceptionService, IMasterApproverLevelService approverLevelService)
        {
            _configuration = configuration;
            _ObjectResponse = ObjectResponse;
            _ExceptionService = exceptionService;
            _approverLevelService = approverLevelService;
        }

        #endregion Constructor

        [HttpPost]
        [Route("Upsert")]
        public async Task<IActionResult>Upsert(MasterApproverLevelModel approverLevel)
        {
            try
            {
                DBOperation oResponse = await _approverLevelService.UpsertMasterValuationRequestApproverLevel(approverLevel);
                if (oResponse == DBOperation.Success)
                {
                    return _ObjectResponse.Create(true, (Int32)HttpStatusCode.OK, (approverLevel.Id > 0 ? AppConstants.UpdateSuccess : AppConstants.InsertSuccess));
                }
                else
                    return _ObjectResponse.Create(false, (Int32)HttpStatusCode.BadRequest, (oResponse == DBOperation.NotFound ? AppConstants.NoRecordFound : AppConstants.BadRequest));
            }
            catch (Exception ex)
            {
                return _ObjectResponse.Create(false, (Int32)HttpStatusCode.InternalServerError, Convert.ToString(ex.StackTrace));
            }
        }

        

        [HttpPost, Route("GetAll")]
        public async Task<IActionResult> GetAll([FromForm] DataTableAjaxPostModel model)
        {
            try
            {
                return _ObjectResponse.CreateData(await _approverLevelService.GetAll(model), (Int32)HttpStatusCode.OK);
            }
            catch (Exception ex)
            {
                return _ObjectResponse.Create(false, (Int32)HttpStatusCode.InternalServerError, Convert.ToString(ex.StackTrace));
            }
        }

        [HttpGet("GetById/{Id}")]
        public async Task<IActionResult> GetById(int Id)
        {
            try
            {
                var result = await _approverLevelService.GetById(Id);
                if (result != null && result.Id > 0)
                    return _ObjectResponse.Create(result, (Int32)HttpStatusCode.OK);
                else
                    return _ObjectResponse.Create(null, (Int32)HttpStatusCode.BadRequest, AppConstants.NoRecordFound);
            }
            catch (Exception ex)
            {
                return _ObjectResponse.Create(false, (Int32)HttpStatusCode.InternalServerError, Convert.ToString(ex.StackTrace));
            }
        }
    }
}
