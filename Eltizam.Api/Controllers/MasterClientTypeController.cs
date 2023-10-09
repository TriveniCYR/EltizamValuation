using Eltizam.Api.Helpers.Response;
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
    public class MasterClientTypeController : ControllerBase
    {
        #region Properties
        private readonly IMaster_ClientTypeService _clienttypeServices;
        private readonly IResponseHandler<dynamic> _ObjectResponse;
        private readonly IExceptionService _ExceptionService;
        IExceptionService exceptionService;
        #endregion Properties

        #region Constructor
        public MasterClientTypeController(IMaster_ClientTypeService clienttypeServices, IResponseHandler<dynamic> ObjectResponse)
        {
            _clienttypeServices = clienttypeServices;
            _ObjectResponse = ObjectResponse;
            _ExceptionService = exceptionService;
        }
        #endregion Constructor

        #region API Methods
        [HttpPost]
        [Route("Upsert")]
        public async Task<IActionResult> Upsert(Master_ClientTypeModel clientType)
        {
            try
            {
                DBOperation oResponse = await _clienttypeServices.AddUpdateMasterClientType(clientType);
                if (oResponse == DBOperation.Success)
                {
                    return _ObjectResponse.Create(true, (Int32)HttpStatusCode.OK, (clientType.Id > 0 ? "Updated Successfully" : "Inserted Successfully"));
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
        public async Task<IActionResult> GetMasterClientTypeById([FromRoute] int id)
        {
            try
            {
                var oClientTypeEntity = await _clienttypeServices.GetMasterClientTypeByIdAsync(id);
                if (oClientTypeEntity != null && oClientTypeEntity.Id > 0)
                    return _ObjectResponse.Create(oClientTypeEntity, (Int32)HttpStatusCode.OK);
                else
                    return _ObjectResponse.Create(null, (Int32)HttpStatusCode.BadRequest, "Record not found");
            }
            catch (Exception ex)
            {
                return _ObjectResponse.Create(false, (Int32)HttpStatusCode.InternalServerError, Convert.ToString(ex.StackTrace));
            }
        }

        [HttpPost, Route("GetAllClientType")]
        public async Task<IActionResult> GetAllClientType([FromForm] SmartTableParam<CommonSearchModel> model)
        {
            try
            {
                return _ObjectResponse.CreateData(await _clienttypeServices.GetAll(model.Search, model.paging), (Int32)HttpStatusCode.OK);
            }
            catch (Exception ex)
            {
                return _ObjectResponse.Create(false, (Int32)HttpStatusCode.InternalServerError, Convert.ToString(ex.StackTrace));
            }
        }

        [HttpDelete("DeleteProperty/{id}")]
        public async Task<IActionResult> DeleteProperty([FromRoute] int id)
        {
            try
            {
                DBOperation oResponse = await _clienttypeServices.DeleteClientType(id);
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
