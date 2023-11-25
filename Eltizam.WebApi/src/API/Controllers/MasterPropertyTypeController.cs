using Eltizam.Business.Core.Interface;
using Eltizam.Business.Models;
using Eltizam.Data.DataAccess.Helper;
using Microsoft.AspNetCore.Mvc;
using Eltizam.WebApi.Filters;
using Eltizam.WebApi.Helpers.Response;
using System.Net;
using static Eltizam.Utility.Enums.GeneralEnum;


namespace Eltizam.WebApi.Controllers
{
    [ApiVersion("1")]
    [Route("api/v{version:apiVersion}/[controller]")]
    [ApiController]
    [AuthorizeAttribute]
    public class MasterPropertyTypeController : ControllerBase
    {
        #region Properties
        private readonly IMasterPropertyTypeService _propertyTypeServices;
        private readonly IMasterPropertySubTypeService _propertySubTypeServices;
        private readonly IResponseHandler<dynamic> _ObjectResponse;
        private readonly IExceptionService _ExceptionService;
        IExceptionService exceptionService;
        #endregion Properties

        #region Constructor
        public MasterPropertyTypeController(IMasterPropertyTypeService propertyTypeServices, IMasterPropertySubTypeService propertySubTypeServices, IResponseHandler<dynamic> ObjectResponse)
        {
            _propertyTypeServices = propertyTypeServices;
            _ObjectResponse = ObjectResponse;
            // _ExceptionService = exceptionService;
            _propertySubTypeServices = propertySubTypeServices;
        }
        #endregion Constructor

        #region API Methods
        [HttpPost]
        [Route("Upsert")]
        public async Task<IActionResult> Upsert(Master_PropertyTypeModel oPrpoertyType)
        {
            try
            {
                DBOperation oResponse = await _propertyTypeServices.AddUpdateMasterPropertyType(oPrpoertyType);
                if (oResponse == DBOperation.Success)
                {
                    return _ObjectResponse.Create(true, (Int32)HttpStatusCode.OK, (oPrpoertyType.Id > 0 ? AppConstants.UpdateSuccess : AppConstants.InsertSuccess));
                }
                else if (oResponse == DBOperation.AlreadyExist)
                {
                    return _ObjectResponse.Create(true, (Int32)HttpStatusCode.Conflict, (AppConstants.DuplicateRecordFound));
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
        [Route("getById/{id}")]
        public async Task<IActionResult> GetMasterPropertyById([FromRoute] int id)
        {
            try
            {
                var oPrpoertyTypeEntity = await _propertyTypeServices.GetMasterPropertyTypeByIdAsync(id);

                if (oPrpoertyTypeEntity != null && oPrpoertyTypeEntity.Id > 0)
                {
                    var subtypes = await _propertySubTypeServices.GetMasterSubPropertyByPropertyTypeIdAsync(oPrpoertyTypeEntity.Id);
                    oPrpoertyTypeEntity.MasterPropertySubTypes = subtypes;

                    return _ObjectResponse.Create(oPrpoertyTypeEntity, (Int32)HttpStatusCode.OK);
                }
                else
                    return _ObjectResponse.Create(null, (Int32)HttpStatusCode.BadRequest, AppConstants.NoRecordFound);
            }
            catch (Exception ex)
            {
                return _ObjectResponse.Create(false, (Int32)HttpStatusCode.InternalServerError, Convert.ToString(ex.StackTrace));
            }
        }

        [HttpPost, Route("GetAll")]
        public async Task<IActionResult> GetAllProperty([FromForm] DataTableAjaxPostModel model)
        {
            try
            {
                return _ObjectResponse.CreateData(await _propertyTypeServices.GetAll(model), (Int32)HttpStatusCode.OK);
            }
            catch (Exception ex)
            {
                return _ObjectResponse.Create(false, (Int32)HttpStatusCode.InternalServerError, Convert.ToString(ex.StackTrace));
            }
        }


        [HttpGet, Route("GetAllList")]
        public async Task<IActionResult> GetAllList()
        {
            try
            {
                return _ObjectResponse.CreateData(await _propertyTypeServices.GetAllList(), (Int32)HttpStatusCode.OK);
            }
            catch (Exception ex)
            {
                return _ObjectResponse.Create(false, (Int32)HttpStatusCode.InternalServerError, Convert.ToString(ex.StackTrace));
            }
        }

        [HttpDelete("Delete/{id}")]
        public async Task<IActionResult> DeleteProperty([FromRoute] int id)
        {
            try
            {
                DBOperation oResponse = await _propertyTypeServices.DeletePropertyType(id);
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

        [HttpGet("CheckPropertTypeExists")]
        public async Task<IActionResult> CheckPropertTypeExists(string PropertyType)
        {
            try
            {
                int id = 0;

                var oResponse = await _propertyTypeServices.CheckDuplicatePropertyType(PropertyType);
                return _ObjectResponse.Create(oResponse, (Int32)HttpStatusCode.OK, AppConstants.DeleteSuccess);
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
