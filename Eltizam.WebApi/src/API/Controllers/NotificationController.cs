using Eltizam.Data.DataAccess.Helper;
using Microsoft.AspNetCore.Mvc;
using static Eltizam.Utility.Enums.GeneralEnum;
using System.Net;
using Eltizam.WebApi.Filters;
using Eltizam.Business.Models;
using Eltizam.Business.Core.Interface;
using Eltizam.WebApi.Helpers.Response;
using Eltizam.Business.Core.Implementation;

namespace EltizamValuation.WebApi.Controllers
{
    [ApiVersion("1")]
    [Route("api/v{version:apiVersion}/[controller]")]
    [ApiController]
    [AuthorizeAttribute]
    public class NotificationController : ControllerBase
    {
        private readonly IConfiguration _configuration;
        private readonly IResponseHandler<dynamic> _ObjectResponse;
        private Microsoft.Extensions.Hosting.IHostingEnvironment _env;
        private readonly IExceptionService _ExceptionService;
        private readonly INotificationService _notificationService;

        public NotificationController(IConfiguration configuration, IResponseHandler<dynamic> ObjectResponse, IExceptionService exceptionService, INotificationService notificationService)
        {
            _configuration = configuration;
            _ObjectResponse = ObjectResponse;
            _ExceptionService = exceptionService;
            _notificationService = notificationService;
        }

        [HttpPost("SendNotificationMail")]
        public async Task<IActionResult> SendNotificationMail(SendNotificationModel request,int valuationrequestId,int? statusId)
        {
            try
            {
                request.ValId = valuationrequestId; request.StatusId = statusId;

                DBOperation oResponse = await _notificationService.SendEmail(request);
              
                if (oResponse == DBOperation.Success)
                {
                    return _ObjectResponse.Create(true, (Int32)HttpStatusCode.OK, (AppConstants.InsertSuccess));
                }
                else
                    return _ObjectResponse.Create(false, (Int32)HttpStatusCode.BadRequest, (oResponse == DBOperation.NotFound ? "Email Not Sent" : AppConstants.BadRequest));
            }
            catch (ArgumentException ex)
            {
                return BadRequest(ex.Message);
            }
            catch (Exception ex)
            {
                await _ExceptionService.LogException(ex);
                return _ObjectResponse.Create(false, (Int32)HttpStatusCode.InternalServerError, Convert.ToString(ex.StackTrace));
            }
        }

        [HttpGet, Route("GetNotificationList")]
        public async Task<IActionResult> GetNotificationList(int? lastid, int? userId, int? valId)
        {
            try
            {
                return _ObjectResponse.CreateData(_notificationService.GetAll(lastid, userId, valId), (Int32)HttpStatusCode.OK);
            }
            catch (Exception ex)
            {
                return _ObjectResponse.Create(false, (Int32)HttpStatusCode.InternalServerError, Convert.ToString(ex.StackTrace));
            }
        }
        [HttpPost("UpdateNotificationReadBy")]

        public async Task<IActionResult> UpdateNotificationReadBy([FromQuery] int notificationid, [FromQuery] int ReadBy)
        {
            try
            {
                DBOperation oResponse = await _notificationService.UpdateNotification(notificationid, ReadBy);
                if (oResponse == DBOperation.Success)
                {
                    return _ObjectResponse.Create(true, (Int32)HttpStatusCode.OK, (AppConstants.InsertSuccess));
                }
                else
                    return _ObjectResponse.Create(false, (Int32)HttpStatusCode.BadRequest, (oResponse == DBOperation.NotFound ? "data not available" : AppConstants.BadRequest));
            }
            catch (ArgumentException ex)
            {
                return BadRequest(ex.Message);
            }
            catch (Exception ex)
            {
                await _ExceptionService.LogException(ex);
                return _ObjectResponse.Create(false, (Int32)HttpStatusCode.InternalServerError, Convert.ToString(ex.StackTrace));
            }
        }
    }
}
