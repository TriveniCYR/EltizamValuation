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
    public class MasterPropertyTypeController : ControllerBase
    {
        #region Properties
        private readonly IMasterPropertyTypeService _propertyTypeServices;
        private readonly IResponseHandler<dynamic> _ObjectResponse;
        private readonly IExceptionService _ExceptionService;
        IExceptionService exceptionService;
        #endregion Properties

        #region Constructor
        public MasterPropertyTypeController(IMasterPropertyTypeService propertyTypeServices, IResponseHandler<dynamic> ObjectResponse)
        {
            _propertyTypeServices = propertyTypeServices;
            _ObjectResponse = ObjectResponse;
            _ExceptionService = exceptionService;
        }
        #endregion Constructor

        #region API Methods
        [HttpPost]
        [Route("Upsert")]
        public async Task<IActionResult> Upsert(Master_PropertyTypeModel oPrpoertyType)
        {
            try
            {
                DBOperation oResponse = await _propertyTypeServices.AddUpdateMasterProperty(oPrpoertyType);
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
        [Route("getById/{id}")]
        public async Task<IActionResult> GetMasterPropertyById([FromRoute] int id)
        {
            try
            {
                var oPrpoertyTypeEntity = await _propertyTypeServices.GetMasterPropertyByIdAsync(id);
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
                return _ObjectResponse.CreateData(await _propertyTypeServices.GetAll(model), (Int32)HttpStatusCode.OK);
            }
            catch (Exception ex)
            {
                return _ObjectResponse.Create(false, (Int32)HttpStatusCode.InternalServerError, Convert.ToString(ex.StackTrace));
            }
        }


        //[HttpGet, Route("GetAllProperty")]
        //public async Task<IActionResult> GetAllProperty()
        //{
        //    try
        //    {
        //        return _ObjectResponse.Create(await _propertyTypeServices.GetAllProperty(), (Int32)HttpStatusCode.OK,null,null,null);
        //    }
        //    catch (Exception ex)
        //    {
        //        return _ObjectResponse.Create(false, (Int32)HttpStatusCode.InternalServerError, Convert.ToString(ex.StackTrace));
        //    }
        //}

        [HttpDelete("DeletePropertyType/{id}")]
        public async Task<IActionResult> DeleteProperty([FromRoute] int id)
        {
            try
            {
                DBOperation oResponse = await _propertyTypeServices.DeleteProperty(id);
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
        #endregion API Methods
    }
}
