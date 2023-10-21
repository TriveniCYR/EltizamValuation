using Eltizam.Api.Helpers.Response;
using Eltizam.Business.Core.Interface;
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
    public class MasterValuationFeeTypeController : ControllerBase
    {
        #region Properties

        private readonly IConfiguration _configuration;
        private readonly IResponseHandler<dynamic> _ObjectResponse;
        private readonly IStringLocalizer<Errors> _stringLocalizerError;
        private Microsoft.Extensions.Hosting.IHostingEnvironment _env;
        private readonly IExceptionService _ExceptionService;
        private readonly IMasterValuationFeeTypeService _ValuationFeeTypeService;

        #endregion Properties

        #region Constructor
        public MasterValuationFeeTypeController(IConfiguration configuration, IResponseHandler<dynamic> ObjectResponse, IStringLocalizer<Errors> stringLocalizerError, IExceptionService exceptionService, IMasterValuationFeeTypeService ValuationFeeTypeService)
        {
            _configuration = configuration;
            _ObjectResponse = ObjectResponse;
            _stringLocalizerError = stringLocalizerError;
            _ExceptionService = exceptionService;
            _ValuationFeeTypeService = ValuationFeeTypeService;
        }

        #endregion Constructor

        #region API Methods

        /// <summary>
        /// Description - To Insert and Update ValuationFeeType
        /// </summary>
        /// <param name="oValuationFeeType"></param>
        /// <returns></returns>
        /// <response code="200">OK</response>
        /// <response code="400">Bad Request</response>
        /// <response code="403">Forbidden</response>
        /// <response code="404">Not Found</response>
        /// <response code="405">Method Not Allowed</response>
        /// <response code="500">Internal Server</response>

        // get all records from master ValuationFeeType with sorting and pagination 

        [HttpPost, Route("GetAll")]
        public async Task<IActionResult> GetAll([FromForm] DataTableAjaxPostModel model)
        {
            try
            {
                return _ObjectResponse.CreateData(await _ValuationFeeTypeService.GetAll(model), (Int32)HttpStatusCode.OK);
            }
            catch (Exception ex)
            {
                return _ObjectResponse.Create(false, (Int32)HttpStatusCode.InternalServerError, Convert.ToString(ex.StackTrace));
            }
        }

        // get master ValuationFeeType detail by id
        [HttpGet, Route("GetById/{id}")]
        public async Task<IActionResult> GetById([FromRoute] int id)
        {
            try
            {
                var oValuationFeeTypeEntity = await _ValuationFeeTypeService.GetById(id);
                if (oValuationFeeTypeEntity != null && oValuationFeeTypeEntity.Id > 0)
                    return _ObjectResponse.Create(oValuationFeeTypeEntity, (Int32)HttpStatusCode.OK);
                else
                    return _ObjectResponse.Create(null, (Int32)HttpStatusCode.BadRequest, AppConstants.NoRecordFound);
            }
            catch (Exception ex)
            {
                return _ObjectResponse.Create(false, (Int32)HttpStatusCode.InternalServerError, Convert.ToString(ex.StackTrace));
            }
        }

        // this method is called when inserting and updating master ValuationFeeType detail
        [HttpPost]
        [Route("Upsert")]
        public async Task<IActionResult> Upsert(MasterValuationFeeTypeModel oValuationFeeType)
        {
            try
            {
                DBOperation oResponse = await _ValuationFeeTypeService.Upsert(oValuationFeeType);
                if (oResponse == DBOperation.Success)
                {
                    return _ObjectResponse.Create(true, (Int32)HttpStatusCode.OK, (oValuationFeeType.Id > 0 ? AppConstants.UpdateSuccess : AppConstants.InsertSuccess));
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
                DBOperation oResponse = await _ValuationFeeTypeService.Delete(id);
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
