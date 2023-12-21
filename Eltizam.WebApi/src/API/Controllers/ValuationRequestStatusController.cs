﻿using Eltizam.Business.Core.Interface;
using Eltizam.Resource;
using Eltizam.WebApi.Filters;
using Eltizam.WebApi.Helpers.Response;
using Microsoft.AspNetCore.Mvc;
using System.Net;

namespace Eltizam.WebApi.Controllers
{
    [ApiVersion("1")]
    [Route("api/v{version:apiVersion}/[controller]")]
    [ApiController]
    [AuthorizeAttribute]
    public class ValuationRequestStatusController : ControllerBase
    {

        #region Properties

        private readonly IConfiguration _configuration;
        private readonly IResponseHandler<dynamic> _ObjectResponse;
        private Microsoft.Extensions.Hosting.IHostingEnvironment _env;
        private readonly IExceptionService _ExceptionService;
        private readonly IValuationRequestStatusService _RequestStatusService;

        #endregion Properties

        #region Constructor
        public ValuationRequestStatusController(IConfiguration configuration, IResponseHandler<dynamic> ObjectResponse, IExceptionService exceptionService, IValuationRequestStatusService RequestStatusService)
        {
            _configuration = configuration;
            _ObjectResponse = ObjectResponse;
            _ExceptionService = exceptionService;
            _RequestStatusService = RequestStatusService;
        }

        #endregion Constructor
        

        [HttpGet("GetAll/{roleId}")]
        public async Task<IActionResult> GetAll(int roleId,string action, int ValReqId)
        {
            try
            {
                return _ObjectResponse.CreateData(await _RequestStatusService.GetAll(roleId, action, ValReqId), (Int32)HttpStatusCode.OK);
            }
            catch (Exception ex)
            {
                return _ObjectResponse.Create(false, (Int32)HttpStatusCode.InternalServerError, Convert.ToString(ex.StackTrace));
            }
        }

        [HttpGet("GetAllStatus")]
        public async Task<IActionResult> GetAllStatus()
        {
            try
            {
                return _ObjectResponse.CreateData(await _RequestStatusService.GetAllStatus(), (Int32)HttpStatusCode.OK);
            }
            catch (Exception ex)
            {
                return _ObjectResponse.Create(false, (Int32)HttpStatusCode.InternalServerError, Convert.ToString(ex.StackTrace));
            }
        }

        [HttpGet("GetAllStatusHistory/{ValReqId}")]
        public async Task<IActionResult> GetAllStatusHistory(int ValReqId)
        {
            try
            {
                return _ObjectResponse.CreateData(await _RequestStatusService.GetAllStatusHistory(ValReqId), (Int32)HttpStatusCode.OK);
            }
            catch (Exception ex)
            {
                return _ObjectResponse.Create(false, (Int32)HttpStatusCode.InternalServerError, Convert.ToString(ex.StackTrace));
            }
        }

    }
}
