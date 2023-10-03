﻿using Eltizam.Api.Helpers.Response;
using Eltizam.Business.Core.Interface;
using Eltizam.Business.Models;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using static Eltizam.Utility.Enums.GeneralEnum;
using System.Net;

namespace EltizamValuation.Api.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class MasterPropertySubTypeController : ControllerBase
    {
        #region Properties
        private readonly IMasterPropertySubTypeService _subpropertyServices;
        private readonly IResponseHandler<dynamic> _ObjectResponse;
        private readonly IExceptionService _ExceptionService;
        IExceptionService exceptionService;
        #endregion Properties
        #region Constructor
        public MasterPropertySubTypeController(IMasterPropertySubTypeService subpropertyServices, IResponseHandler<dynamic> ObjectResponse)
        {
            _subpropertyServices = subpropertyServices;
            _ObjectResponse = ObjectResponse;
            _ExceptionService = exceptionService;
        }
        #endregion Constructor

        #region API Methods
        [HttpPost]
        [Route("Upsert")]
        public async Task<IActionResult> Upsert(Master_PropertySubTypeModel oPrpoertyType)
        {
            try
            {
                DBOperation oResponse = await _subpropertyServices.AddUpdateMasterSubProperty(oPrpoertyType);
                if (oResponse == DBOperation.Success)
                {
                    return _ObjectResponse.Create(true, (Int32)HttpStatusCode.OK, (oPrpoertyType.Id > 0 ? "Updated Successfully" : "Inserted Successfully"));
                }
                else
                    return _ObjectResponse.Create(false, (Int32)HttpStatusCode.BadRequest, (oResponse == DBOperation.NotFound ? "Record not found" : "Bad request"));
            }
            catch (Exception ex)
            {

                return _ObjectResponse.Create(false, (Int32)HttpStatusCode.InternalServerError, Convert.ToString(ex.StackTrace));
            }
        }

        [HttpGet]
        [Route("getById/{id}")]
        public async Task<IActionResult> GetMasterSubPropertyById([FromRoute] int id)
        {
            try
            {
                var oPrpoertyTypeEntity = await _subpropertyServices.GetMasterSubPropertyByIdAsync(id);
                if (oPrpoertyTypeEntity != null && oPrpoertyTypeEntity.Id > 0)
                    return _ObjectResponse.Create(oPrpoertyTypeEntity, (Int32)HttpStatusCode.OK);
                else
                    return _ObjectResponse.Create(null, (Int32)HttpStatusCode.BadRequest, "Record not found");
            }
            catch (Exception ex)
            {
                return _ObjectResponse.Create(false, (Int32)HttpStatusCode.InternalServerError, Convert.ToString(ex.StackTrace));
            }
        }

        [HttpPost, Route("GetAllSubProperty")]
        public async Task<IActionResult> GetAllSubProperty([FromForm] DataTableAjaxPostModel model)
        {
            try
            {
                return _ObjectResponse.CreateData(await _subpropertyServices.GetAll(model), (Int32)HttpStatusCode.OK);
            }
            catch (Exception ex)
            {
                return _ObjectResponse.Create(false, (Int32)HttpStatusCode.InternalServerError, Convert.ToString(ex.StackTrace));
            }
        }

        [HttpDelete("DeleteProperty/{id}")]
        public async Task<IActionResult> DeleteSubProperty([FromRoute] int id)
        {
            try
            {
                DBOperation oResponse = await _subpropertyServices.DeleteSubProperty(id);
                if (oResponse == DBOperation.Success)
                    return _ObjectResponse.Create(true, (Int32)HttpStatusCode.OK, "Deleted Successfully");
                else
                    return _ObjectResponse.Create(null, (Int32)HttpStatusCode.BadRequest, "Record not found");
            }
            catch (Exception ex)
            {
                await _ExceptionService.LogException(ex);
                return _ObjectResponse.Create(false, (Int32)HttpStatusCode.InternalServerError, Convert.ToString(ex.StackTrace));
            }
        }
        #endregion API Methods
    }
}