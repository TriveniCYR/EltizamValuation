using Eltizam.Api.Filters;
using Eltizam.Api.Helpers.Response;
using Eltizam.Business.Core.Interface;
using Eltizam.Business.Models;
using Eltizam.Data.DataAccess.Helper;
using Eltizam.Resource;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Localization;
using System.Net;
using static Eltizam.Utility.Enums.GeneralEnum;

namespace EltizamValuation.Api.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    [AuthorizeAttribute]
    public class MasterDesignationController : ControllerBase
    {
        #region Properties

        private readonly IConfiguration _configuration;
        private readonly IResponseHandler<dynamic> _ObjectResponse;
        private readonly IStringLocalizer<Errors> _stringLocalizerError;
        private Microsoft.Extensions.Hosting.IHostingEnvironment _env;
        private readonly IExceptionService _ExceptionService;
        private readonly IMasterDesignationService _DesignationService;

        #endregion Properties

        #region Constructor
        public MasterDesignationController(IConfiguration configuration, IResponseHandler<dynamic> ObjectResponse, IStringLocalizer<Errors> stringLocalizerError, IExceptionService exceptionService, IMasterDesignationService DesignationService)
        {
            _configuration = configuration;
            _ObjectResponse = ObjectResponse;
            _stringLocalizerError = stringLocalizerError;
            _ExceptionService = exceptionService;
            _DesignationService = DesignationService;
        }

        #endregion Constructor


        #region API Methods

        /// <summary>
        /// Description - To Insert and Update Designation
        /// </summary>
        /// <param name="oDesignation"></param>
        /// <returns></returns>
        /// <response code="200">OK</response>
        /// <response code="400">Bad Request</response>
        /// <response code="403">Forbidden</response>
        /// <response code="404">Not Found</response>
        /// <response code="405">Method Not Allowed</response>
        /// <response code="500">Internal Server</response>

        // get all records from master designation with sorting and pagination 
        //[HttpPost, Route("GetAll")]
        //public async Task<IActionResult> GetAll([FromForm] DataTableAjaxPostModel model)
        //{
        //    try
        //    {
        //        return _ObjectResponse.CreateData(await _DesignationService.GetAll(model), (Int32)HttpStatusCode.OK);
        //    }
        //    catch (Exception ex)
        //    {
        //        return _ObjectResponse.Create(false, (Int32)HttpStatusCode.InternalServerError, Convert.ToString(ex.StackTrace));
        //    }
        //}
        [HttpGet, Route("GetAll")]
        public async Task<IActionResult> GetAll()
        {
            try
            {
                var oRoleList = await _DesignationService.GetAll();
                if (oRoleList != null)
                    return _ObjectResponse.Create(oRoleList, (Int32)HttpStatusCode.OK);
                else
                    return _ObjectResponse.Create(null, (Int32)HttpStatusCode.BadRequest, AppConstants.NoRecordFound);
            }
            catch (Exception ex)
            {
                await _ExceptionService.LogException(ex);
                return _ObjectResponse.Create(false, (Int32)HttpStatusCode.InternalServerError, Convert.ToString(ex.StackTrace));
            }
        }

        // get master designation detail by id

        [HttpGet, Route("GetById/{id}")]
        public async Task<IActionResult> GetById([FromRoute] int id)
        {
            try
            {
                var oDesignationEntity = await _DesignationService.GetById(id);
                if (oDesignationEntity != null && oDesignationEntity.Id > 0)
                    return _ObjectResponse.Create(oDesignationEntity, (Int32)HttpStatusCode.OK);
                else
                    return _ObjectResponse.Create(null, (Int32)HttpStatusCode.BadRequest, AppConstants.NoRecordFound);
            }
            catch (Exception ex)
            {
                return _ObjectResponse.Create(false, (Int32)HttpStatusCode.InternalServerError, Convert.ToString(ex.StackTrace));
            }
        }

        // this method is called when inserting and updating master Designation detail
        [HttpPost]
        [Route("Upsert")]
        public async Task<IActionResult> Upsert(MasterDesignationEntity oDepartment)
        {
            try
            {
                DBOperation oResponse = await _DesignationService.Upsert(oDepartment);
                if (oResponse == DBOperation.Success)
                {
                    return _ObjectResponse.Create(true, (Int32)HttpStatusCode.OK, (oDepartment.Id > 0 ? AppConstants.UpdateSuccess : AppConstants.InsertSuccess));
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
        public async Task<IActionResult> Delete([FromRoute] int id)
        {
            try
            {
                DBOperation oResponse = await _DesignationService.Delete(id);
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


        [HttpGet("GetDesignationList")]
        public async Task<IActionResult> GetDesignationList()
        {
            try
            {
                return _ObjectResponse.CreateData(await _DesignationService.GetDesignationList(), (Int32)HttpStatusCode.OK);
            }
            catch (Exception ex)
            {
                return _ObjectResponse.Create(false, (Int32)HttpStatusCode.InternalServerError, Convert.ToString(ex.StackTrace));
            }
        }

        #endregion API Methods
    }
}
