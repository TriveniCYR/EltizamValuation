using Eltizam.Business.Core.Interface;
using Eltizam.Business.Models;
using Eltizam.Data.DataAccess.Helper;
using Eltizam.Resource;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Localization;
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
    public class MasterLocationController : ControllerBase
    {
        #region Properties

        private readonly IConfiguration _configuration;
        private readonly IResponseHandler<dynamic> _ObjectResponse;
       // private readonly IStringLocalizer<Errors> _stringLocalizerError;
        private Microsoft.Extensions.Hosting.IHostingEnvironment _env;
        private readonly IExceptionService _ExceptionService;
        private readonly IMasterLocationService _LocationService;

        #endregion Properties

        #region Constructor
        public MasterLocationController(IConfiguration configuration, IResponseHandler<dynamic> ObjectResponse, IExceptionService exceptionService, IMasterLocationService LocationService)
        {
            _configuration = configuration;
            _ObjectResponse = ObjectResponse;
         //   _stringLocalizerError = stringLocalizerError;
            _ExceptionService = exceptionService;
            _LocationService = LocationService;
        }

        #endregion Constructor


        #region API Methods

        /// <summary>
        /// Description - To Insert and Update Location
        /// </summary>
        /// <param name="oLocation"></param>
        /// <returns></returns>
        /// <response code="200">OK</response>
        /// <response code="400">Bad Request</response>
        /// <response code="403">Forbidden</response>
        /// <response code="404">Not Found</response>
        /// <response code="405">Method Not Allowed</response>
        /// <response code="500">Internal Server</response>

        // get all records from master Location with sorting and pagination 

        [HttpPost, Route("GetAll")]
        public async Task<IActionResult> GetAll([FromForm] DataTableAjaxPostModel? model)
        {
            try
            {
                return _ObjectResponse.CreateData(await _LocationService.GetAll(model), (Int32)HttpStatusCode.OK);
            }
            catch (Exception ex)
            {
                return _ObjectResponse.Create(false, (Int32)HttpStatusCode.InternalServerError, Convert.ToString(ex.StackTrace));
            }
        }
      //  [HttpGet, Route("GetAll")]
        //public async Task<IActionResult> GetAll()
        //{
        //    try
        //    {
        //        var oRoleList = await _LocationService.GetAll();
        //        if (oRoleList != null)
        //            return _ObjectResponse.Create(oRoleList, (Int32)HttpStatusCode.OK);
        //        else
        //            return _ObjectResponse.Create(null, (Int32)HttpStatusCode.BadRequest, "No Records found");
        //    }
        //    catch (Exception ex)
        //    {
        //        await _ExceptionService.LogException(ex);
        //        return _ObjectResponse.Create(false, (Int32)HttpStatusCode.InternalServerError, Convert.ToString(ex.StackTrace));
        //    }
        //}

        // get master Location detail by id
        [HttpGet, Route("GetById/{id}")]
        public async Task<IActionResult> GetById([FromRoute] int id)
        {
            try
            {
                var oLocationEntity = await _LocationService.GetById(id);
                if (oLocationEntity != null && oLocationEntity.Id > 0)
                    return _ObjectResponse.Create(oLocationEntity, (Int32)HttpStatusCode.OK);
                else
                    return _ObjectResponse.Create(null, (Int32)HttpStatusCode.BadRequest, AppConstants.NoRecordFound);
            }
            catch (Exception ex)
            {
                return _ObjectResponse.Create(false, (Int32)HttpStatusCode.InternalServerError, Convert.ToString(ex.StackTrace));
            }
        }

        // this method is called when inserting and updating master Location detail
        [HttpPost]
        [Route("Upsert")]
        public async Task<IActionResult> Upsert(MasterLocationEntity oLocation)
        {
            try
            {
                DBOperation oResponse = await _LocationService.AddUpdateLocationClient(oLocation);
                if (oResponse == DBOperation.Success)
                {
                    return _ObjectResponse.Create(true, (Int32)HttpStatusCode.OK, (oLocation.Id > 0 ? AppConstants.UpdateSuccess : AppConstants.InsertSuccess));
                }
                else
                    return _ObjectResponse.Create(false, (Int32)HttpStatusCode.BadRequest, (oResponse == DBOperation.NotFound ? AppConstants.NoRecordFound : AppConstants.BadRequest));
            }
            catch (Exception ex)
            {
                return _ObjectResponse.Create(false, (Int32)HttpStatusCode.InternalServerError, Convert.ToString(ex.StackTrace));
            }
        }

        // this is for delete master Designation detail by id
        [HttpPost("Delete/{id}")]
        public async Task<IActionResult> Delete([FromRoute] int id, int? by)
        {
            try
            {
                DBOperation oResponse = await _LocationService.Delete(id,by);
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
