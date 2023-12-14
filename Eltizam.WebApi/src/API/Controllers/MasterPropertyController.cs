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
    public class MasterPropertyController : ControllerBase
    {
        #region Properties
        private readonly IMasterPropertyService _propertyServices;
        private readonly IResponseHandler<dynamic> _ObjectResponse;
        private readonly IExceptionService _ExceptionService;
        #endregion Properties

        #region Constructor
        public MasterPropertyController(IMasterPropertyService propertyServices, IResponseHandler<dynamic> ObjectResponse, IExceptionService exceptionService)
        {
            _propertyServices = propertyServices;
            _ObjectResponse = ObjectResponse;
            _ExceptionService = exceptionService;
        }
        #endregion Constructor

        #region API Methods
        [HttpPost]
        [Route("Upsert")]
        public async Task<IActionResult> Upsert(MasterPropertyModel oPrpoertyType)
        {
            try
            {
                DBOperation oResponse = await _propertyServices.AddUpdateMasterProperty(oPrpoertyType);
                if (oResponse == DBOperation.Success)
                {
                    return _ObjectResponse.Create(true, (Int32)HttpStatusCode.OK, (oPrpoertyType.Id > 0 ? AppConstants.UpdateSuccess : AppConstants.InsertSuccess));
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
                var oPrpoertyTypeEntity = await _propertyServices.GetMasterPropertyByIdAsync(id);
                if (oPrpoertyTypeEntity != null && oPrpoertyTypeEntity.Id > 0)
                    return _ObjectResponse.Create(oPrpoertyTypeEntity, (Int32)HttpStatusCode.OK);
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
                return _ObjectResponse.CreateData(await _propertyServices.GetAll(model), (Int32)HttpStatusCode.OK);
            }
            catch (Exception ex)
            {
                return _ObjectResponse.Create(false, (Int32)HttpStatusCode.InternalServerError, Convert.ToString(ex.StackTrace));
            }
        }


        [HttpGet, Route("GetPropertyAmenityList")]
        public async Task<IActionResult> GetPropertyAmenityList()
        {
            try
            {
                return _ObjectResponse.CreateData(await _propertyServices.GetPropertyAmenityList(), (Int32)HttpStatusCode.OK);
            }
            catch (Exception ex)
            {
                return _ObjectResponse.Create(false, (Int32)HttpStatusCode.InternalServerError, Convert.ToString(ex.StackTrace));
            }
        }

        [HttpDelete("Delete/{id}")]
        public async Task<IActionResult> DeleteProperty([FromRoute] int id, int? by)
        {
            try
            {
                DBOperation oResponse = await _propertyServices.DeleteProperty(id,by);
                if (oResponse == DBOperation.Success)
                    return _ObjectResponse.Create(true, (Int32)HttpStatusCode.OK, AppConstants.DeleteSuccess);
                else if (oResponse == DBOperation.AlreadyExist)
                    return _ObjectResponse.Create(null, (Int32)HttpStatusCode.OK, "Please deactivated valuation attached with this Property");
                else
                    return _ObjectResponse.Create(null, (Int32)HttpStatusCode.BadRequest, AppConstants.NoRecordFound);
            }
            catch (Exception ex)
            {
                await _ExceptionService.LogException(ex);
                return _ObjectResponse.Create(false, (Int32)HttpStatusCode.InternalServerError, ex.Message);
            }
        }


        [HttpGet]
        [Route("getPropertyByFilters/{propertyTypeId}/{subPropertyTypeId}/{ownershipTypeId}")]
        public async Task<IActionResult> GetMasterPropertyByFilters([FromRoute] int propertyTypeId, int subPropertyTypeId, int ownershipTypeId)
        {
            try
            {
                var oPrpoertyTypeEntity = await _propertyServices.GetMasterPropertyByFiltersAsync(propertyTypeId,subPropertyTypeId,ownershipTypeId);
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
