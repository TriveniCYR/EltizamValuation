﻿using Eltizam.Api.Helpers.Response;
using Eltizam.Business.Core.Interface;
using Eltizam.Business.Core.ServiceImplementations;
using Eltizam.Business.Models;
using Eltizam.Data.DataAccess.Helper;
using Microsoft.AspNetCore.Components.Routing;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using System.Net;
using static Eltizam.Utility.Enums.GeneralEnum;

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
        public async Task<IActionResult> GetAllValuationRequest([FromForm] DataTableAjaxPostModel model, string? userName, string? clientName, string? propertyName, int requestStatusId,int resourceId,int propertyTypeId, int countryId,int stateId,int cityId,string? fromDate, string? toDate)
        {
            try
            {
                return _ObjectResponse.CreateData(await _valutionServices.GetAll(model, userName, clientName, propertyName, requestStatusId, resourceId, propertyTypeId,countryId, stateId, cityId, fromDate,toDate), (Int32)HttpStatusCode.OK);
            }
            catch (Exception ex)
            {
                return _ObjectResponse.Create(false, (Int32)HttpStatusCode.InternalServerError, Convert.ToString(ex.StackTrace));
            }
        }

        [HttpPost, Route("AssignApprover")]
        public async Task<IActionResult> AssignApprover([FromBody] AssignApprovorRequestModel model)
        {
            DBOperation oResponse = await _valutionServices.AssignApprover(model);
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
            DBOperation oResponse = await _valutionServices.AssignApproverStatus(model);
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
                return _ObjectResponse.CreateData(await _valutionServices.GetAllValuationMethod(), (Int32)HttpStatusCode.OK);
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
                DBOperation oResponse = await _valutionServices.Upsert(oValuation);
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
    }
}
