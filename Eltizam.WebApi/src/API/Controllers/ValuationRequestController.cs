using Eltizam.Business.Core.Interface;
using Eltizam.Business.Models;
using Eltizam.Data.DataAccess.Helper;
using Eltizam.WebApi.Filters;
using Eltizam.WebApi.Helpers.Response;
using Microsoft.AspNetCore.Mvc;
using System.Net;
using static Eltizam.Utility.Enums.GeneralEnum;

namespace Eltizam.WebApi.Controllers
{
    [ApiVersion("1")]
    [Route("api/v{version:apiVersion}/[controller]")]
    [ApiController]
    [AuthorizeAttribute]
    public class ValuationRequestController : ControllerBase
    {
        #region Properties
        private readonly IValuationRequestService _valuationServices;

        private readonly IResponseHandler<dynamic> _ObjectResponse;
        #endregion Properties

        #region Constructor
        public ValuationRequestController(IValuationRequestService valutionServices, IResponseHandler<dynamic> ObjectResponse)
        {
            _valuationServices = valutionServices;
            _ObjectResponse = ObjectResponse;
            // _ExceptionService = exceptionService;
        }
        #endregion Constructor

        [HttpPost, Route("GetAllValuationRequest")]
        public async Task<IActionResult> GetAllValuationRequest([FromForm] DataTableAjaxPostModel model, string? userName, string? clientName, string? propertyName, int requestStatusId, int resourceId, int propertyTypeId, int countryId, int stateId, int cityId, string? fromDate, string? toDate, string? valRef, int? logInUserId)
        {
            try
            {
                var filters = new ValuationRequestFilters()
                {
                    userName = userName,
                    clientName = clientName,
                    propertyName = propertyName,
                    requestStatusId = requestStatusId,
                    resourceId = resourceId,
                    propertyTypeId = propertyTypeId,
                    countryId = countryId,
                    stateId = stateId,
                    cityId = cityId,
                    fromDate = fromDate,
                    toDate = toDate,
                    valRef = valRef,
                    logInUserId = logInUserId
                };

                return _ObjectResponse.CreateData(await _valuationServices.GetAll(model, filters), (Int32)HttpStatusCode.OK);
            }
            catch (Exception ex)
            {
                return _ObjectResponse.Create(false, (Int32)HttpStatusCode.InternalServerError, Convert.ToString(ex.StackTrace));
            }
        }

        [HttpPost, Route("AssignApprover")]
        public async Task<IActionResult> AssignApprover([FromBody] AssignApprovorRequestModel model)
        {
            DBOperation oResponse = await _valuationServices.AssignApprover(model);
            if (oResponse == DBOperation.Success)
            {
                return _ObjectResponse.Create(true, (Int32)HttpStatusCode.OK, (AppConstants.InsertSuccess));
            }
            else
                return _ObjectResponse.Create(false, (Int32)HttpStatusCode.BadRequest, (oResponse == DBOperation.NotFound ? AppConstants.NoRecordFound : AppConstants.BadRequest));
        }

        [HttpPost, Route("AssignApproverStatus")]
        public async Task<IActionResult> AssignApproverStatus([FromBody] ApprovorStatusRequestModel model)
        {
            DBOperation oResponse = await _valuationServices.AssignApproverStatus(model);
            if (oResponse == DBOperation.Success)
            {
                return _ObjectResponse.Create(true, (Int32)HttpStatusCode.OK, (AppConstants.InsertSuccess));
            }
            else
                return _ObjectResponse.Create(false, (Int32)HttpStatusCode.BadRequest, (oResponse == DBOperation.NotFound ? AppConstants.NoRecordFound : AppConstants.BadRequest));
        }


        [HttpGet("GetAllValuationMethod")]
        public async Task<IActionResult> GetAllValuationMethod()
        {
            try
            {
                return _ObjectResponse.CreateData(await _valuationServices.GetAllValuationMethod(), (Int32)HttpStatusCode.OK);
            }
            catch (Exception ex)
            {
                return _ObjectResponse.Create(false, (Int32)HttpStatusCode.InternalServerError, Convert.ToString(ex.StackTrace));
            }
        }

        [HttpPost]
        [Route("Upsert")]
        public async Task<IActionResult> Upsert([FromBody] ValuationRequestModel oValuation)
        {
            try
            {
                DBOperation oResponse = await _valuationServices.Upsert(oValuation);
                if (oResponse == DBOperation.Success)
                {
                    return _ObjectResponse.Create(true, (Int32)HttpStatusCode.OK, (oValuation.Id > 0 ? AppConstants.UpdateSuccess : AppConstants.InsertSuccess));
                }
                else
                    return _ObjectResponse.Create(false, (Int32)HttpStatusCode.BadRequest, (oResponse == DBOperation.NotFound ? AppConstants.NoRecordFound : AppConstants.BadRequest));
            }
            catch (Exception ex)
            {
                return _ObjectResponse.Create(false, (Int32)HttpStatusCode.InternalServerError, Convert.ToString(ex.StackTrace));
            }
        }

        [HttpGet, Route("GetById/{id}")]
        public async Task<IActionResult> GetById([FromRoute] int id)
        {
            try
            {
                var oValuationEntity = await _valuationServices.GetById(id);
                if (oValuationEntity != null)
                    return _ObjectResponse.Create(oValuationEntity, (Int32)HttpStatusCode.OK);
                else
                    return _ObjectResponse.Create(null, (Int32)HttpStatusCode.BadRequest, AppConstants.NoRecordFound);
            }
            catch (Exception ex)
            {
                return _ObjectResponse.Create(false, (Int32)HttpStatusCode.InternalServerError, Convert.ToString(ex.StackTrace));
            }
        }

        [HttpGet, Route("GetApproverLevel")]
        public async Task<IActionResult> GetApproverLevel(int? ValReqId, decimal? Amount = null)
        {
            try
            {
                var levels = await _valuationServices.GetApproverLevel(ValReqId, Amount);

                if (levels != null)
                    return _ObjectResponse.Create(levels, (Int32)HttpStatusCode.OK);
                else
                    return _ObjectResponse.Create(null, (Int32)HttpStatusCode.BadRequest, AppConstants.NoRecordFound);
            }
            catch (Exception ex)
            {
                return _ObjectResponse.Create(false, (Int32)HttpStatusCode.InternalServerError, Convert.ToString(ex.StackTrace));
            }
        }

        [HttpGet, Route("GetHeaderInfoById/{id}")]
        public async Task<IActionResult> GetHeaderInfoById([FromRoute] int id)
        {
            try
            {
                var oValuationEntity = await _valuationServices.GetValuationRequestInfo(id);

                if (oValuationEntity != null && oValuationEntity.Id > 0)
                    return _ObjectResponse.Create(oValuationEntity, (Int32)HttpStatusCode.OK);
                else
                    return _ObjectResponse.Create(null, (Int32)HttpStatusCode.BadRequest, AppConstants.NoRecordFound);
            }
            catch (Exception ex)
            {
                return _ObjectResponse.Create(false, (Int32)HttpStatusCode.InternalServerError, Convert.ToString(ex.StackTrace));
            }
        }


        [HttpDelete("Delete/{id}")]
        public async Task<IActionResult> Delete([FromRoute] int id)
        {
            try
            {
                DBOperation oResponse = await _valuationServices.Delete(id);
                if (oResponse == DBOperation.Success)
                    return _ObjectResponse.Create(true, (Int32)HttpStatusCode.OK, AppConstants.DeleteSuccess);
                else
                    return _ObjectResponse.Create(null, (Int32)HttpStatusCode.BadRequest, AppConstants.NoRecordFound);
            }
            catch (Exception ex)
            {
                return _ObjectResponse.Create(false, (Int32)HttpStatusCode.InternalServerError, Convert.ToString(ex.StackTrace));
            }
        }

        [HttpPost, Route("UpdateRequestStatus")]
        public async Task<IActionResult> UpdateRequestStatus([FromBody] ValutionRequestStatusChangeModel model)
        {
            try
            {
                DBOperation oResponse = await _valuationServices.UpdateRequestStatus(model);
                if (oResponse == DBOperation.Success)
                {
                    return _ObjectResponse.Create(true, (Int32)HttpStatusCode.OK, (AppConstants.InsertSuccess));
                }
                else
                    return _ObjectResponse.Create(false, (Int32)HttpStatusCode.BadRequest, (oResponse == DBOperation.NotFound ? AppConstants.NoRecordFound : AppConstants.BadRequest));
            }
            catch (Exception ex)
            {
                return _ObjectResponse.Create(false, (Int32)HttpStatusCode.InternalServerError, Convert.ToString(ex.StackTrace));
            }
        }

        [HttpPost, Route("UpsertApproverLevels")]
        public async Task<IActionResult> UpsertApproverLevels(int ValReqId, int CreatedBy, int ValQuotId, string RequestData)
        {
            DBOperation oResponse = await _valuationServices.UpsertApproverLevels(ValReqId, RequestData, CreatedBy, ValQuotId);
            if (oResponse == DBOperation.Success)
            {
                return _ObjectResponse.Create(true, (Int32)HttpStatusCode.OK, (AppConstants.InsertSuccess));
            }
            else
                return _ObjectResponse.Create(false, (Int32)HttpStatusCode.BadRequest, (oResponse == DBOperation.NotFound ? AppConstants.NoRecordFound : AppConstants.BadRequest));
        }

        [HttpPost, Route("ApproverActionComment")]
        public async Task<IActionResult> ApproverActionComment([FromBody] ApproverActionCommentModel model)
        {
            DBOperation oResponse = await _valuationServices.ApproverActionComment(model);
            if (oResponse == DBOperation.Success)
            {
                return _ObjectResponse.Create(true, (Int32)HttpStatusCode.OK, (AppConstants.InsertSuccess));
            }
            else
                return _ObjectResponse.Create(false, (Int32)HttpStatusCode.BadRequest, (oResponse == DBOperation.NotFound ? AppConstants.NoRecordFound : AppConstants.BadRequest));
        }

        [HttpPost, Route("ValuationDocument")]
        public async Task<IActionResult> ValuationDocument([FromBody] ValuationDocumentModel model)
        {
            DBOperation oResponse = await _valuationServices.ValuationDocument(model);
            if (oResponse == DBOperation.Success)
            {
                return _ObjectResponse.Create(true, (Int32)HttpStatusCode.OK, (AppConstants.InsertSuccess));
            }
            else
                return _ObjectResponse.Create(false, (Int32)HttpStatusCode.BadRequest, (oResponse == DBOperation.NotFound ? AppConstants.NoRecordFound : AppConstants.BadRequest));
        }
    }
}
