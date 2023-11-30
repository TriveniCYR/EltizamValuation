using Eltizam.Data.DataAccess.Helper;
using Microsoft.AspNetCore.Mvc;
using static Eltizam.Utility.Enums.GeneralEnum;
using System.Net;
using Eltizam.WebApi.Filters;
using Eltizam.Business.Models;
using Eltizam.Business.Core.Interface;
using Eltizam.WebApi.Helpers.Response;

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
        public async Task<IActionResult> SendNotificationMail(SendEmailModel request,int valuationrequestId,int statusId)
        {
            try
            {
                DBOperation oResponse = await _notificationService.SendEmail(request, valuationrequestId, statusId);
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
    }
}
