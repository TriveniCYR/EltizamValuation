using Eltizam.Api.Helpers.Response;
using Eltizam.Business.Core.Interface;
using Eltizam.Data.DataAccess.Helper;
using Eltizam.Resource;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Localization;
using System.Net;

namespace EltizamValuation.Api.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ValuationRequestStatusController : ControllerBase
    {

        #region Properties

        private readonly IConfiguration _configuration;
        private readonly IResponseHandler<dynamic> _ObjectResponse;
        private readonly IStringLocalizer<Errors> _stringLocalizerError;
        private Microsoft.Extensions.Hosting.IHostingEnvironment _env;
        private readonly IExceptionService _ExceptionService;
        private readonly IValuationRequestStatusService _RequestStatusService;

        #endregion Properties

        #region Constructor
        public ValuationRequestStatusController(IConfiguration configuration, IResponseHandler<dynamic> ObjectResponse, IStringLocalizer<Errors> stringLocalizerError, IExceptionService exceptionService, IValuationRequestStatusService RequestStatusService)
        {
            _configuration = configuration;
            _ObjectResponse = ObjectResponse;
            _stringLocalizerError = stringLocalizerError;
            _ExceptionService = exceptionService;
            _RequestStatusService = RequestStatusService;
        }

        #endregion Constructor
        [HttpGet, Route("GetAll")]
        public async Task<IActionResult> GetAll()
        {
            try
            {
                var statusList = await _RequestStatusService.GetAll();
                if (statusList != null)
                    return _ObjectResponse.Create(statusList, (Int32)HttpStatusCode.OK);
                else
                    return _ObjectResponse.Create(null, (Int32)HttpStatusCode.BadRequest, AppConstants.NoRecordFound);
            }
            catch (Exception ex)
            {
                await _ExceptionService.LogException(ex);
                return _ObjectResponse.Create(false, (Int32)HttpStatusCode.InternalServerError, Convert.ToString(ex.StackTrace));
            }
        }


    }
}
