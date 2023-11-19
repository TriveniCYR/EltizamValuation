using Eltizam.Business.Core;
using Eltizam.Business.Core.Interface;
using Eltizam.Business.Models;
using Eltizam.WebApi.Helpers.Response;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using System.Net;

namespace EltizamValuation.WebApi.Controllers
{
    [ApiVersion("1")]
    [Route("api/v{version:apiVersion}/[controller]")]
    [ApiController]
    //[AuthorizeAttribute]
    public class DashboardController : ControllerBase
    {
        #region Properties

        private readonly IConfiguration _configuration;
        private readonly IResponseHandler<dynamic> _ObjectResponse;
        private readonly IDashboardService _dashboardService;
        private readonly IExceptionService _ExceptionService;
        private readonly IHelper _helper;
        #endregion Properties

        #region Constructor

        public DashboardController(IConfiguration configuration, IResponseHandler<dynamic> ObjectResponse, IDashboardService dashboardService, IExceptionService exceptionService, IHelper helper)
        {
            _configuration = configuration;
            _ObjectResponse = ObjectResponse;
            _dashboardService = dashboardService;
            //	_stringLocalizerError = stringLocalizerError;
            _ExceptionService = exceptionService;
            _helper = helper;
        }

        #endregion Constructor

        #region API Methods

        /// <summary>
        /// Description - To Login User and return JWT Token String
        /// </summary>
        /// <param name="User"></param>
        /// <returns></returns>
        /// <response code="200">OK</response>
        /// <response code="400">Bad Request</response>
        /// <response code="403">Forbidden</response>
        /// <response code="404">Not Found</response>
        /// <response code="405">Method Not Allowed</response>
        /// <response code="415">Unsupported Media Type</response>
        /// <response code="500">Internal Server</response>

        [HttpPost]
        public async Task<IActionResult> Dashboard([FromBody] DashboardFilterModel model)
        {
            try
            {
                var _data = await _dashboardService.GetDashboardData(model);

                if (_data != null)
                {
                    return _ObjectResponse.Create(_data, (Int32)HttpStatusCode.OK);
                }
                else
                    return _ObjectResponse.Create(string.Empty, (Int32)HttpStatusCode.NotFound);
            }
            catch (Exception ex)
            {
                await _ExceptionService.LogException(ex);
                return _ObjectResponse.Create(false, (Int32)HttpStatusCode.InternalServerError, Convert.ToString(ex.StackTrace));
            }
        }

        #endregion API Methods 
    }
}
