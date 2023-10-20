using Eltizam.Api.Filters;
using Eltizam.Api.Helpers.Response;
using Eltizam.Business.Core.Implementation;
using Eltizam.Business.Core.Interface;
using Eltizam.Business.Core.ServiceImplementations;
using Eltizam.Business.Models;
using Eltizam.Resource;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Localization;
using static Eltizam.Utility.Enums.GeneralEnum;
using System.Net;
using Eltizam.Data.DataAccess.Helper;

namespace EltizamValuation.Api.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    //[AuthorizeAttribute]
    public class MasterDepartmentController : ControllerBase
    {
        #region Properties

        private readonly IConfiguration _configuration;
        private readonly IResponseHandler<dynamic> _ObjectResponse;
        private readonly IStringLocalizer<Errors> _stringLocalizerError;
        private Microsoft.Extensions.Hosting.IHostingEnvironment _env;
        private readonly IExceptionService _ExceptionService;
        private readonly IMasterDepartmentService _DepartmentService;

        #endregion Properties

        #region Constructor
        public MasterDepartmentController(IConfiguration configuration, IResponseHandler<dynamic> ObjectResponse, IStringLocalizer<Errors> stringLocalizerError, IExceptionService exceptionService, IMasterDepartmentService DepartmentService)
        {
            _configuration = configuration;
            _ObjectResponse = ObjectResponse;
            _stringLocalizerError = stringLocalizerError;
            _ExceptionService = exceptionService;
            _DepartmentService = DepartmentService;
        }

        #endregion Constructor


        #region API Methods

        /// <summary>
        /// Description - To Insert and Update Department
        /// </summary>
        /// <param name="oDepartment"></param>
        /// <returns></returns>
        /// <response code="200">OK</response>
        /// <response code="400">Bad Request</response>
        /// <response code="403">Forbidden</response>
        /// <response code="404">Not Found</response>
        /// <response code="405">Method Not Allowed</response>
        /// <response code="500">Internal Server</response>
        
        // get all records from master department with sorting and pagination 

        //[HttpPost, Route("GetAll")]
        //public async Task<IActionResult> GetAll([FromForm] DataTableAjaxPostModel model)
        //{
        //    try
        //    {
        //        return _ObjectResponse.CreateData(await _DepartmentService.GetAll(model), (Int32)HttpStatusCode.OK);
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
                var oRoleList = await _DepartmentService.GetAll();
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

        // get master department detail by id
        [HttpGet, Route("GetById/{id}")]
        public async Task<IActionResult> GetById([FromRoute] int id)
        {
            try
            {
                var oDepartmentEntity = await _DepartmentService.GetById(id);
                if (oDepartmentEntity != null && oDepartmentEntity.Id > 0)
                    return _ObjectResponse.Create(oDepartmentEntity, (Int32)HttpStatusCode.OK);
                else
                    return _ObjectResponse.Create(null, (Int32)HttpStatusCode.BadRequest, "Record not found");
            }
            catch (Exception ex)
            {
                return _ObjectResponse.Create(false, (Int32)HttpStatusCode.InternalServerError, Convert.ToString(ex.StackTrace));
            }
        }

        // this method is called when inserting and updating master Department detail
        [HttpPost]
        [Route("Upsert")]
        public async Task<IActionResult> Upsert(MasterDepartmentEntity oDepartment)
        {
            try
            {
                DBOperation oResponse = await _DepartmentService.Upsert(oDepartment);
                if (oResponse == DBOperation.Success)
                {
                    return _ObjectResponse.Create(true, (Int32)HttpStatusCode.OK, (oDepartment.Id > 0 ? "Updated Successfully" : "Inserted Successfully"));
                }
                else
                    return _ObjectResponse.Create(false, (Int32)HttpStatusCode.BadRequest, (oResponse == DBOperation.NotFound ? "Record not found" : AppConstants.BadRequest));
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
                DBOperation oResponse = await _DepartmentService.Delete(id);
                if (oResponse == DBOperation.Success)
                    return _ObjectResponse.Create(true, (Int32)HttpStatusCode.OK, "Deleted Successfully");
                else
                    return _ObjectResponse.Create(null, (Int32)HttpStatusCode.BadRequest, "Record not found");
            }
            catch (Exception ex)
            {
                return _ObjectResponse.Create(false, (Int32)HttpStatusCode.InternalServerError, Convert.ToString(ex.StackTrace));
            }
        }

        [HttpGet("GetDepartmentList")]
        public async Task<IActionResult> GetDepartmentList()
        {
            try
            {
                return _ObjectResponse.CreateData(await _DepartmentService.GetDepartmentList(), (Int32)HttpStatusCode.OK);
            }
            catch (Exception ex)
            {
                return _ObjectResponse.Create(false, (Int32)HttpStatusCode.InternalServerError, Convert.ToString(ex.StackTrace));
            }
        }

        #endregion API Methods
    }
}
