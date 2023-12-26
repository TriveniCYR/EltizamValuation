﻿using Eltizam.Business.Core.Interface;
using Eltizam.Business.Models;
using Eltizam.Data.DataAccess.Helper;
using Eltizam.Resource;
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
    public class ValuationQuatationController : ControllerBase
    {
        #region Properties

        private readonly IConfiguration _configuration;
        private readonly IResponseHandler<dynamic> _ObjectResponse;
        private Microsoft.Extensions.Hosting.IHostingEnvironment _env;
        private readonly IExceptionService _ExceptionService;
        private readonly IValuationQuatationService _ValuationQuatatiionService;

        #endregion Properties

        #region Constructor
        public ValuationQuatationController(IConfiguration configuration, IResponseHandler<dynamic> ObjectResponse, IExceptionService exceptionService, IValuationQuatationService ValuationQuatatiionService)
        {
            _configuration = configuration;
            _ObjectResponse = ObjectResponse;
            _ExceptionService = exceptionService;
            _ValuationQuatatiionService = ValuationQuatatiionService;
        }

        #endregion Constructor


        #region API Methods


        // get all records from master department with sorting and pagination 

        [HttpGet, Route("GetValuationPDFData/{id}")]
        public async Task<IActionResult> GetValuationPDFData([FromRoute] int id)
        {
            try
            {
                return _ObjectResponse.CreateData(await _ValuationQuatatiionService.GetValuationPDFData(id), (Int32)HttpStatusCode.OK);
            }
            catch (Exception ex)
            {
                return _ObjectResponse.Create(false, (Int32)HttpStatusCode.InternalServerError, Convert.ToString(ex.StackTrace));
            }
        }

        [HttpGet, Route("GetQuatationList")]
        public async Task<IActionResult> GetQuatationList(int RequestId)
        {
            try
            {
                return _ObjectResponse.CreateData(await _ValuationQuatatiionService.GetQuatationList(RequestId), (Int32)HttpStatusCode.OK);
            }
            catch (Exception ex)
            {
                return _ObjectResponse.Create(false, (Int32)HttpStatusCode.InternalServerError, Convert.ToString(ex.StackTrace));
            }
        }

        [HttpPost]
        [Route("Upsert")]
        public async Task<IActionResult> Upsert(ValuationQuatationListModel model)
        {
            try
            {
                DBOperation oResponse = await _ValuationQuatatiionService.Upsert(model);
                if (oResponse == DBOperation.Success)
                {
                    return _ObjectResponse.Create(true, (Int32)HttpStatusCode.OK, (model.Id > 0 ? AppConstants.UpdateSuccess : AppConstants.InsertSuccess));
                }
                else
                    return _ObjectResponse.Create(false, (Int32)HttpStatusCode.BadRequest, (oResponse == DBOperation.NotFound ? AppConstants.NoRecordFound : AppConstants.BadRequest));
            }
            catch (Exception ex)
            {
                return _ObjectResponse.Create(false, (Int32)HttpStatusCode.InternalServerError, Convert.ToString(ex.StackTrace));
            }
        }
        [HttpGet, Route("GetQuatationById/{id}")]
        public async Task<IActionResult> GetQuatationById([FromRoute] int id)
        {
            try
            {
                var quatationEntity = await _ValuationQuatatiionService.GetQuatationById(id);
                if (quatationEntity != null && quatationEntity.Id > 0)
                    return _ObjectResponse.Create(quatationEntity, (Int32)HttpStatusCode.OK);
                else
                    return _ObjectResponse.Create(null, (Int32)HttpStatusCode.BadRequest, AppConstants.NoRecordFound);
            }
            catch (Exception ex)
            {
                await _ExceptionService.LogException(ex);
                return _ObjectResponse.Create(false, (Int32)HttpStatusCode.InternalServerError, Convert.ToString(ex.StackTrace));
            }
        }
        // this is for delete master Designation detail by id
        [HttpPost("Delete/{id}")]
        public async Task<IActionResult> Delete([FromRoute] int id, int? by)
        {
            try
            {
                DBOperation oResponse = await _ValuationQuatatiionService.QuatationDelete(id,by);
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

        [HttpGet("GetApproverLevel")]
        public async Task<IActionResult> GetApproverLevel(decimal Amount, int ValReqId)
        {
            try
            {
                return _ObjectResponse.CreateData(await _ValuationQuatatiionService.GetApproverLevel(Amount, ValReqId), (Int32)HttpStatusCode.OK);
            }
            catch (Exception ex)
            {
                return _ObjectResponse.Create(false, (Int32)HttpStatusCode.InternalServerError, Convert.ToString(ex.StackTrace));
            }
        }

        #endregion API Methods  
    }
}
