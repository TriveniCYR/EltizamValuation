using Eltizam.Business.Core.Interface;
using Eltizam.Business.Models;
using Eltizam.Data.DataAccess.Helper;
using Eltizam.Resource;
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
    public class MasterOwnershipTypeController : ControllerBase
    {

        #region Properties

        private readonly IConfiguration _configuration;
        private readonly IResponseHandler<dynamic> _ObjectResponse;
        private Microsoft.Extensions.Hosting.IHostingEnvironment _env;
        private readonly IExceptionService _ExceptionService;
        private readonly IMasterOwnershipTypeService _OwnershipTypeService;

        #endregion Properties

        #region Constructor
        public MasterOwnershipTypeController(IConfiguration configuration, IResponseHandler<dynamic> ObjectResponse, IExceptionService exceptionService, IMasterOwnershipTypeService OwnershipTypeService)
        {
            _configuration = configuration;
            _ObjectResponse = ObjectResponse;
            _ExceptionService = exceptionService;
            _OwnershipTypeService = OwnershipTypeService;
        }

        #endregion Constructor


        #region API Methods

        /// <summary>
        /// Description - To Insert and Update OwnershipType
        /// </summary>
        /// <param name="oOwnershipType"></param>
        /// <returns></returns>
        /// <response code="200">OK</response>
        /// <response code="400">Bad Request</response>
        /// <response code="403">Forbidden</response>
        /// <response code="404">Not Found</response>
        /// <response code="405">Method Not Allowed</response>
        /// <response code="500">Internal Server</response>

        // get all records from master OwnershipType with sorting and pagination 

        [HttpPost, Route("GetAll")]
        public async Task<IActionResult> GetAll([FromForm] DataTableAjaxPostModel model)
        {
            try
            {
                return _ObjectResponse.CreateData(await _OwnershipTypeService.GetAll(model), (Int32)HttpStatusCode.OK);
            }
            catch (Exception ex)
            {
                return _ObjectResponse.Create(false, (Int32)HttpStatusCode.InternalServerError, Convert.ToString(ex.StackTrace));
            }
        }

        [HttpGet, Route("GetAllOwnershipType")]
        public async Task<IActionResult> GetAllOwnershipType()
        {
            try
            {
                var oRoleList = await _OwnershipTypeService.GetOwnershipTypeList();
                if (oRoleList != null)
                    return _ObjectResponse.CreateData(oRoleList, (Int32)HttpStatusCode.OK);
                else
                    return _ObjectResponse.Create(null, (Int32)HttpStatusCode.BadRequest, AppConstants.NoRecordFound);
            }
            catch (Exception ex)
            {
                return _ObjectResponse.Create(false, (Int32)HttpStatusCode.InternalServerError, Convert.ToString(ex.StackTrace));
            }
        }

        // get master OwnershipType detail by id
        [HttpGet, Route("GetById/{id}")]
        public async Task<IActionResult> GetById([FromRoute] int id)
        {
            try
            {
                var oOwnershipTypeEntity = await _OwnershipTypeService.GetById(id);
                if (oOwnershipTypeEntity != null && oOwnershipTypeEntity.Id > 0)
                    return _ObjectResponse.Create(oOwnershipTypeEntity, (Int32)HttpStatusCode.OK);
                else
                    return _ObjectResponse.Create(null, (Int32)HttpStatusCode.BadRequest, AppConstants.NoRecordFound);
            }
            catch (Exception ex)
            {
                return _ObjectResponse.Create(false, (Int32)HttpStatusCode.InternalServerError, Convert.ToString(ex.StackTrace));
            }
        }

        // this method is called when inserting and updating master OwnershipType detail
        [HttpPost]
        [Route("Upsert")]
        public async Task<IActionResult> Upsert(MasterOwnershipTypeEntity oOwnershipType)
        {
            try
            {
                DBOperation oResponse = await _OwnershipTypeService.Upsert(oOwnershipType);
                if (oResponse == DBOperation.Success)
                {
                    return _ObjectResponse.Create(true, (Int32)HttpStatusCode.OK, (oOwnershipType.Id > 0 ? AppConstants.UpdateSuccess : AppConstants.InsertSuccess));
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
        [HttpDelete("Delete/{id}")]
        public async Task<IActionResult> Delete([FromRoute] int id)
        {
            try
            {
                DBOperation oResponse = await _OwnershipTypeService.Delete(id);
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
