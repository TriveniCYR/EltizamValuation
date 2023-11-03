using Eltizam.Api.Helpers.Response;
using Eltizam.Business.Core.Interface;
using Eltizam.Business.Models;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using System.Net;

namespace EltizamValuation.Api.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ValuationRequestController : ControllerBase
    {
        #region Properties
        private readonly IValutionRequestService _valutionServices;

        private readonly IResponseHandler<dynamic> _ObjectResponse;
        private readonly IExceptionService _ExceptionService;
        IExceptionService exceptionService;
        #endregion Properties

        #region Constructor
        public ValuationRequestController(IValutionRequestService valutionServices, IResponseHandler<dynamic> ObjectResponse)
        {
            _valutionServices = valutionServices;
            _ObjectResponse = ObjectResponse;
            // _ExceptionService = exceptionService;
        }
        #endregion Constructor

        [HttpPost, Route("GetAllValuationRequest")]
        public async Task<IActionResult> GetAllValuationRequest([FromForm] DataTableAjaxPostModel model, string? userName, string? clientName, string? propertyName, int requestStatusId,int resourceId, int countryId,int stateId,int cityId,string? fromDate, string? toDate)
        {
            try
            {
                return _ObjectResponse.CreateData(await _valutionServices.GetAll(model, userName, clientName, propertyName, requestStatusId, resourceId,countryId, stateId, cityId, fromDate,toDate), (Int32)HttpStatusCode.OK);
            }
            catch (Exception ex)
            {
                return _ObjectResponse.Create(false, (Int32)HttpStatusCode.InternalServerError, Convert.ToString(ex.StackTrace));
            }
        }

    }
}
