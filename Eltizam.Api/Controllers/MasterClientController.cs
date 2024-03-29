﻿using Eltizam.Api.Filters;
using Eltizam.Api.Helpers.Response;
using Eltizam.Business.Core.Interface;
using Eltizam.Business.Models;
using Eltizam.Data.DataAccess.Helper;
using Microsoft.AspNetCore.Mvc;
using System.Net;
using static Eltizam.Utility.Enums.GeneralEnum;

namespace EltizamValuation.Api.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    [AuthorizeAttribute]
    public class MasterClientController : ControllerBase
    {
        #region Properties
        private readonly IMasterClientService _clientServices;
        private readonly IResponseHandler<dynamic> _ObjectResponse;
        private readonly IExceptionService _ExceptionService;
        IExceptionService exceptionService;
        #endregion Properties

        #region Constructor
        public MasterClientController(IMasterClientService clientServices, IResponseHandler<dynamic> ObjectResponse)
        {
            _clientServices = clientServices;
            _ObjectResponse = ObjectResponse;
            _ExceptionService = exceptionService;
        }
        #endregion Constructor

        #region API Methods
        [HttpPost]
        [Route("Upsert")]
        public async Task<IActionResult> Upsert(MasterClientModel client)
        {
            try
            {
                DBOperation oResponse = await _clientServices.AddUpdateMasterClient(client);
                if (oResponse == DBOperation.Success)
                {
                    return _ObjectResponse.Create(true, (Int32)HttpStatusCode.OK, (client.Id > 0 ? AppConstants.UpdateSuccess : AppConstants.InsertSuccess));
                }
                else
                    return _ObjectResponse.Create(false, (Int32)HttpStatusCode.BadRequest, (oResponse == DBOperation.NotFound ? AppConstants.NoRecordFound : AppConstants.BadRequest));
            }
            catch (Exception ex)
            {
                return _ObjectResponse.Create(false, (Int32)HttpStatusCode.InternalServerError, Convert.ToString(ex.StackTrace));
            }
        }

        [HttpGet]
        [Route("GetById/{id}")]
        public async Task<IActionResult> GetMasterPropertyById([FromRoute] int id)
        {
            try
            {
                var clientClient = await _clientServices.GetMasterClientByIdAsync(id);

                if (clientClient != null && clientClient.Id > 0)
                {
                    // Assuming _ObjectResponse.Create takes three parameters: data, status code, and message.
                    return _ObjectResponse.Create(clientClient, (int)HttpStatusCode.OK);
                }
                else
                {
                    return _ObjectResponse.Create(null, (int)HttpStatusCode.BadRequest, AppConstants.NoRecordFound);
                }
            }
            catch (Exception ex)
            {
                return _ObjectResponse.Create(null, (int)HttpStatusCode.InternalServerError, Convert.ToString(ex.StackTrace));
            }
        }


        [HttpPost, Route("GetAllClient")]
        public async Task<IActionResult> GetAllClient([FromForm] DataTableAjaxPostModel model)
        {
            try
            {
                return _ObjectResponse.CreateData(await _clientServices.GetAll(model), (Int32)HttpStatusCode.OK);
            }
            catch (Exception ex)
            {
                return _ObjectResponse.Create(false, (Int32)HttpStatusCode.InternalServerError, Convert.ToString(ex.StackTrace));
            }
        }

        [HttpPost("DeleteClient/{id}")]
        public async Task<IActionResult> Deletey([FromRoute] int id)
        {
            try
            {
                DBOperation oResponse = await _clientServices.DeleteClient(id);
                if (oResponse == DBOperation.Success)
                    return _ObjectResponse.Create(true, (Int32)HttpStatusCode.OK, AppConstants.DeleteSuccess);
                else
                    return _ObjectResponse.Create(null, (Int32)HttpStatusCode.BadRequest, AppConstants.NoRecordFound);
            }
            catch (Exception ex)
            {
                await _ExceptionService.LogException(ex);
                return _ObjectResponse.Create(false, (Int32)HttpStatusCode.InternalServerError, Convert.ToString(ex.StackTrace));
            }
        }

        [HttpGet]
        [Route("getByClientTypeId/{id}")]
        public async Task<IActionResult> GetMasterClientByClientTypeId([FromRoute] int id)
        {
            try
            {
                var oPrpoertyTypeEntity = await _clientServices.GetMasterClientByClientTypeIdAsync(id);
                if (oPrpoertyTypeEntity != null)
                    return _ObjectResponse.CreateData(oPrpoertyTypeEntity, (Int32)HttpStatusCode.OK);
                else
                    return _ObjectResponse.Create(null, (Int32)HttpStatusCode.BadRequest, AppConstants.NoRecordFound);
            }
            catch (Exception ex)
            {
                return _ObjectResponse.Create(false, (Int32)HttpStatusCode.InternalServerError, Convert.ToString(ex.StackTrace));
            }
        }
        #endregion API Methods
    }
}
