using Eltizam.Business.Core.Implementation;
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
        public async Task<IActionResult> Delete([FromRoute] int id)
        {
            try
            {
                DBOperation oResponse = await _clientServices.DeleteClient(id);
                if (oResponse == DBOperation.Success)
                    return _ObjectResponse.Create(true, (Int32)HttpStatusCode.OK, AppConstants.DeleteSuccess);
                else if (oResponse == DBOperation.AlreadyExist)
                    return _ObjectResponse.Create(null, (Int32)HttpStatusCode.OK, "Please deactivated valuation attached with this Client");
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

        [HttpDelete("DeleteDocument/{id}")]
        public async Task<IActionResult> DeleteDocument([FromRoute] int id)
        {
            try
            {
                DBOperation oResponse = await _clientServices.DeleteDocument(id);
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

        #endregion API Methods
    }
}
