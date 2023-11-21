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
    public class MasterDictionaryController : ControllerBase
    {
        #region Properties

        private readonly IConfiguration _configuration;
        private readonly IResponseHandler<dynamic> _ObjectResponse;
        private Microsoft.Extensions.Hosting.IHostingEnvironment _env;
        private readonly IExceptionService _ExceptionService;
        private readonly IMasterDictionaryService _DictionaryService;

        #endregion Properties
        #region Constructor
        public MasterDictionaryController(IConfiguration configuration, IResponseHandler<dynamic> ObjectResponse, IExceptionService exceptionService, IMasterDictionaryService DictionaryService)
        {
            _configuration = configuration;
            _ObjectResponse = ObjectResponse;
            _ExceptionService = exceptionService;
            _DictionaryService = DictionaryService;
        }

        #endregion Constructor

        #region API Methods

        [HttpPost, Route("GetAll")]
        public async Task<IActionResult> GetAll([FromForm] DataTableAjaxPostModel? model)
        {
            try
            {
                return _ObjectResponse.CreateData(await _DictionaryService.GetAll(model), (Int32)HttpStatusCode.OK);
            }
            catch (Exception ex)
            {
                return _ObjectResponse.Create(false, (Int32)HttpStatusCode.InternalServerError, Convert.ToString(ex.StackTrace));
            }
        }

        [HttpGet]
        [Route("GetById/{id}/{description}")]
        public async Task<IActionResult> GetById(int id, string? description)
        {
            try
            {

                var masterDictionary = await _DictionaryService.GetDictionaryDetailsByIdAsync(id, description);

                if (masterDictionary != null)
                {
                    // Assuming _ObjectResponse.Create takes three parameters: data, status code, and message.
                    return _ObjectResponse.CreateData(masterDictionary, (int)HttpStatusCode.OK);
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

        [HttpGet]
        [Route("GetDictionaryWithSubDetails")]
        public async Task<IActionResult> GetDictionaryWithSubDetails(int? id = null, string? description = null, string? code = null)
        {
            try
            {
                var masterDictionary = await _DictionaryService.GetDictionaryWithSubDetailsAsync(id, description, code);

                if (masterDictionary != null)
                {
                    // Assuming _ObjectResponse.Create takes three parameters: data, status code, and message.
                    return _ObjectResponse.CreateData(masterDictionary, (int)HttpStatusCode.OK);
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

        [HttpGet]
        [Route("GetById/{id}")]
        public async Task<IActionResult> GetById(int id)
        {
            try
            {

                var masterDictionary = await _DictionaryService.GetDictionaryDetailsByIdAsync(id);

                if (masterDictionary != null)
                {
                    // Assuming _ObjectResponse.Create takes three parameters: data, status code, and message.
                    return _ObjectResponse.CreateData(masterDictionary, (int)HttpStatusCode.OK);
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

        // this method is called when inserting and updating master Location detail
        [HttpPost]
        [Route("Upsert")]
        public async Task<IActionResult> Upsert(MasterDictionaryDetailById dictionarydetail)
        {
            try
            {
                DBOperation oResponse = await _DictionaryService.AddUpdateMasterDictionary(dictionarydetail);
                if (oResponse == DBOperation.Success)
                {
                    return _ObjectResponse.Create(true, (Int32)HttpStatusCode.OK, (dictionarydetail.Id > 0 ? AppConstants.UpdateSuccess : AppConstants.InsertSuccess));
                }
                else
                    return _ObjectResponse.Create(false, (Int32)HttpStatusCode.BadRequest, (oResponse == DBOperation.NotFound ? AppConstants.NoRecordFound : AppConstants.BadRequest));
            }
            catch (Exception ex)
            {
                return _ObjectResponse.Create(false, (Int32)HttpStatusCode.InternalServerError, Convert.ToString(ex.StackTrace));
            }
        }

        [HttpPost("Delete/{id}")]
        public async Task<IActionResult> Delete([FromRoute] int id)
        {
            try
            {
                DBOperation oResponse = await _DictionaryService.Delete(id);
                if (oResponse == DBOperation.Success)
                    return _ObjectResponse.Create(true, (Int32)HttpStatusCode.OK, "Deleted Successfully");
                else
                    return _ObjectResponse.Create(null, (Int32)HttpStatusCode.BadRequest, AppConstants.NoRecordFound);
            }
            catch (Exception ex)
            {
                return _ObjectResponse.Create(false, (Int32)HttpStatusCode.InternalServerError, Convert.ToString(ex.StackTrace));
            }
        }

        [HttpPost]
        [Route("UpsertMasterDictionary")]
        public async Task<IActionResult> UpsertMasterDictionary(MasterDictionaryEntity oPrpoertyType)
        {
            try
            {
                DBOperation oResponse = await _DictionaryService.MasterDictionaryAddUpdate(oPrpoertyType);
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
        [Route("GetDictionaryDetailsById/{id}")]
        public async Task<IActionResult> GetDictionaryDetailsById([FromRoute] int id)
        {
            try
            {
                var MasterDictEntity = await _DictionaryService.GetMasterDictionaryDetailByIdAsync(id);

                if (MasterDictEntity != null && MasterDictEntity.Id > 0)
                {
                    var subtypes = await _DictionaryService.GetMasterDictionaryDetailSubByIdAsync(MasterDictEntity.Id);
                    MasterDictEntity.MasterDicitonaryDetails = subtypes;

                    return _ObjectResponse.Create(MasterDictEntity, (Int32)HttpStatusCode.OK);
                }
                else
                    return _ObjectResponse.Create(null, (Int32)HttpStatusCode.BadRequest, AppConstants.NoRecordFound);
            }
            catch (Exception ex)
            {
                return _ObjectResponse.Create(false, (Int32)HttpStatusCode.InternalServerError, Convert.ToString(ex.StackTrace));
            }
        }
        [HttpGet]
        [Route("GetDictionaryDescriptionById/{id}")]
        public async Task<IActionResult> GetDictionaryDescriptionById([FromRoute] int id)
        {
            try
            {

                var subtypes = _DictionaryService.GetMasterDictionaryDetailSubByIdAsync(id);
                var res = subtypes.Result;
                if (subtypes != null)
                {
                    // Assuming _ObjectResponse.Create takes three parameters: data, status code, and message.
                    return _ObjectResponse.CreateData(res, (int)HttpStatusCode.OK);
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
        #endregion API Methods

    }

}
