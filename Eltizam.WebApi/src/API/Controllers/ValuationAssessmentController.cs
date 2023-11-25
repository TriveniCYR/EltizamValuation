﻿using Eltizam.Business.Core.Interface;
using Eltizam.Business.Models;
using Eltizam.Data.DataAccess.Helper;
using Eltizam.WebApi.Filters;
using Eltizam.WebApi.Helpers.Response;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using static Eltizam.Utility.Enums.GeneralEnum;
using System.Net;
using Eltizam.Business.Core.Implementation;

namespace Eltizam.WebApi.Controllers
{
    [ApiVersion("1")]
    [Route("api/v{version:apiVersion}/[controller]")]
    [ApiController]
    [AuthorizeAttribute]
    public class ValuationAssessmentController : ControllerBase
    {
        #region Properties


        private readonly IConfiguration _configuration;
        private readonly IResponseHandler<dynamic> _ObjectResponse;
        private Microsoft.Extensions.Hosting.IHostingEnvironment _env;
        private readonly IExceptionService _ExceptionService;

        private readonly IValuationAssessmentService _ValuationAssessmentService;

        #endregion Properties

        #region Constructor

        public ValuationAssessmentController(IConfiguration configuration, IValuationAssessmentService ValuationAssessmentService, IResponseHandler<dynamic> ObjectResponse, IExceptionService exceptionService)
        {
            _configuration = configuration;
            _ValuationAssessmentService = ValuationAssessmentService;
            _ObjectResponse = ObjectResponse;
            //_stringLocalizerError = stringLocalizerError;
            _ExceptionService = exceptionService;
        }

        #endregion Constructor

        [HttpPost]
        [Route("ValuationAssesmentUpsert")]
        public async Task<IActionResult> ValuationAssesmentUpsert(ValuationAssesmentActionModel model)
        {
            try
            {
                DBOperation oResponse = await _ValuationAssessmentService.ValuationAssesmentUpsert(model);
                if (oResponse == DBOperation.Success)
                {
                    return _ObjectResponse.Create(true, (Int32)HttpStatusCode.OK, (model.SiteDescription.Id > 0 ? AppConstants.UpdateSuccess : AppConstants.InsertSuccess));
                }
                else
                    return _ObjectResponse.Create(false, (Int32)HttpStatusCode.BadRequest, (oResponse == DBOperation.NotFound ? AppConstants.NoRecordFound : AppConstants.BadRequest));
            }
            catch (Exception ex)
            {
                await _ExceptionService.LogException(ex);
                return _ObjectResponse.Create(false, (Int32)HttpStatusCode.InternalServerError, Convert.ToString(ex.StackTrace));
            }
        }

        [HttpGet, Route("GetSiteDescriptionList")]
        public async Task<IActionResult> GetSiteDescriptionList(int RequestId)
        {
            try
            {
                return _ObjectResponse.CreateData(await _ValuationAssessmentService.GetSiteDescriptionList(RequestId), (Int32)HttpStatusCode.OK);
            }
            catch (Exception ex)
            {
                return _ObjectResponse.Create(false, (Int32)HttpStatusCode.InternalServerError, Convert.ToString(ex.StackTrace));
            }
        }

        [HttpDelete("DeleteDocument/{id}")]
        public async Task<IActionResult> DeleteDocument([FromRoute] int id)
        {
            try
            {
                DBOperation oResponse = await _ValuationAssessmentService.DeleteDocument(id);
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



        //[HttpPost]
        //[Route("SideDescriptionUpsert")]
        //public async Task<IActionResult> SideDescriptionUpsert(SiteDescriptionModel model)
        //{
        //    try
        //    {
        //        DBOperation oResponse = await _ValuationAssessmentService.SideDescriptionUpsert(model);
        //        if (oResponse == DBOperation.Success)
        //        {
        //            return _ObjectResponse.Create(true, (Int32)HttpStatusCode.OK, (model.Id > 0 ? AppConstants.UpdateSuccess : AppConstants.InsertSuccess));
        //        }
        //        else
        //            return _ObjectResponse.Create(false, (Int32)HttpStatusCode.BadRequest, (oResponse == DBOperation.NotFound ? AppConstants.NoRecordFound : AppConstants.BadRequest));
        //    }
        //    catch (Exception ex)
        //    {
        //        await _ExceptionService.LogException(ex);
        //        return _ObjectResponse.Create(false, (Int32)HttpStatusCode.InternalServerError, Convert.ToString(ex.StackTrace));
        //    }
        //}

        //[HttpPost]
        //[Route("EvidenceUpsert")]
        //public async Task<IActionResult> EvidenceUpsert(ComparableEvidenceModel evidence)
        //{
        //    try
        //    {
        //        DBOperation oResponse = await _ValuationAssessmentService.EvidenceUpsert(evidence);
        //        if (oResponse == DBOperation.Success)
        //        {
        //            return _ObjectResponse.Create(true, (Int32)HttpStatusCode.OK, (evidence.Id > 0 ? AppConstants.UpdateSuccess : AppConstants.InsertSuccess));
        //        }
        //        else
        //            return _ObjectResponse.Create(false, (Int32)HttpStatusCode.BadRequest, (oResponse == DBOperation.NotFound ? AppConstants.NoRecordFound : AppConstants.BadRequest));
        //    }
        //    catch (Exception ex)
        //    {
        //        await _ExceptionService.LogException(ex);
        //        return _ObjectResponse.Create(false, (Int32)HttpStatusCode.InternalServerError, Convert.ToString(ex.StackTrace));
        //    }
        //}

        //[HttpPost]
        //[Route("AssesmentUpsert")]
        //public async Task<IActionResult> AssesmentUpsert(ValuationAssessementModel valuation)
        //{
        //    try
        //    {
        //        DBOperation oResponse = await _ValuationAssessmentService.AssesmentUpsert(valuation);
        //        if (oResponse == DBOperation.Success)
        //        {
        //            return _ObjectResponse.Create(true, (Int32)HttpStatusCode.OK, (valuation.Id > 0 ? AppConstants.UpdateSuccess : AppConstants.InsertSuccess));
        //        }
        //        else
        //            return _ObjectResponse.Create(false, (Int32)HttpStatusCode.BadRequest, (oResponse == DBOperation.NotFound ? AppConstants.NoRecordFound : AppConstants.BadRequest));
        //    }
        //    catch (Exception ex)
        //    {
        //        await _ExceptionService.LogException(ex);
        //        return _ObjectResponse.Create(false, (Int32)HttpStatusCode.InternalServerError, Convert.ToString(ex.StackTrace));
        //    }
        //}


    }
}