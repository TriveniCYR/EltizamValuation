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
        public async Task<IActionResult> GetMasterSubPropertyById([FromRoute] int id)
        {
            try
            {
                var oPrpoertyTypeEntity = await _subpropertyServices.GetMasterSubPropertyByIdAsync(id);
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
        
        [HttpGet]
        [Route("getByPropertyTypeId/{id}")]
        public async Task<IActionResult> GetMasterSubPropertyByPropertyTypeId([FromRoute] int id)
        {
            try
            {
                var oPrpoertyTypeEntity = await _subpropertyServices.GetMasterSubPropertyByPropertyTypeIdAsync(id);
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

        //[HttpPost, Route("GetAllSubProperty")]
        //public async Task<IActionResult> GetAllSubProperty([FromForm] DataTableAjaxPostModel model)
        //{
        //    try
        //    {
        //        return _ObjectResponse.CreateData(await _subpropertyServices.GetAll(model), (Int32)HttpStatusCode.OK);
        //    }
        //    catch (Exception ex)
        //    {
        //        return _ObjectResponse.Create(false, (Int32)HttpStatusCode.InternalServerError, Convert.ToString(ex.StackTrace));
        //    }
        //}

        //[HttpGet, Route("GetAllSubProperty")]
        //public async Task<IActionResult> GetAllSubProperty()
        //{
        //    try
        //    {
        //        var osubList = await _subpropertyServices.GetAll();
        //        if (osubList != null)
        //            return _ObjectResponse.Create(osubList, (Int32)HttpStatusCode.OK);
        //        else
        //            return _ObjectResponse.Create(null, (Int32)HttpStatusCode.BadRequest, "No Records found");
        //    }
        //    catch (Exception ex)
        //    {
        //        return _ObjectResponse.Create(false, (Int32)HttpStatusCode.InternalServerError, Convert.ToString(ex.StackTrace));
        //    }
        //}

        [HttpDelete("DeleteProperty/{id}")]
        public async Task<IActionResult> DeleteSubProperty([FromRoute] int id)
        {
            try
            {
                DBOperation oResponse = await _subpropertyServices.DeleteSubProperty(id);
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
