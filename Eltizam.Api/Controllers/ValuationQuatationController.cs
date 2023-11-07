using Eltizam.Api.Helpers.Response;
using Eltizam.Business.Core.Interface;
using Eltizam.Business.Models;
using Eltizam.Data.DataAccess.Helper;
using Eltizam.Resource;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Localization;
using static Eltizam.Utility.Enums.GeneralEnum;
using System.Net;

namespace EltizamValuation.Api.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ValuationQuatationController : ControllerBase
    {
        #region Properties

        private readonly IConfiguration _configuration;
        private readonly IResponseHandler<dynamic> _ObjectResponse;
        private readonly IStringLocalizer<Errors> _stringLocalizerError;
        private Microsoft.Extensions.Hosting.IHostingEnvironment _env;
        private readonly IExceptionService _ExceptionService;
        private readonly IValuationQuatationService _ValuationQuatatiionService;

        #endregion Properties

        #region Constructor
        public ValuationQuatationController(IConfiguration configuration, IResponseHandler<dynamic> ObjectResponse, IStringLocalizer<Errors> stringLocalizerError, IExceptionService exceptionService, IValuationQuatationService ValuationQuatatiionService)
        {
            _configuration = configuration;
            _ObjectResponse = ObjectResponse;
            _stringLocalizerError = stringLocalizerError;
            _ExceptionService = exceptionService;
            _ValuationQuatatiionService = ValuationQuatatiionService;
        }

        #endregion Constructor


        #region API Methods

        
        // get all records from master department with sorting and pagination 

        [HttpGet, Route("GetQuatationList")]
        public async Task<IActionResult> GetQuatationList(int RequestId)
        {
            try
            {
                return _ObjectResponse.CreateData(await _ValuationQuatatiionService.GetQuatationList(RequestId), (Int32)HttpStatusCode.OK);
            }
            catch (Exception ex)
            {
                return _ObjectResponse.Create(false, (Int32)HttpStatusCode.InternalServerError, Convert.ToString(ex.StackTrace));
            }
        }

        [HttpGet, Route("GetQuatationById/{id}")]
        public async Task<IActionResult> GetQuatationById([FromRoute] int id)
        {
            try
            {
                var quatationEntity = await _ValuationQuatatiionService.GetQuatationById(id);
                if (quatationEntity != null && quatationEntity.Id > 0)
                    return _ObjectResponse.Create(quatationEntity, (Int32)HttpStatusCode.OK);
                else
                    return _ObjectResponse.Create(null, (Int32)HttpStatusCode.BadRequest, AppConstants.NoRecordFound);
            }
            catch (Exception ex)
            {
                await _ExceptionService.LogException(ex);
                return _ObjectResponse.Create(false, (Int32)HttpStatusCode.InternalServerError, Convert.ToString(ex.StackTrace));
            }
        }
        // this is for delete master Designation detail by id
        [HttpPost("Delete/{id}")]
        public async Task<IActionResult> Delete([FromRoute] int id)
        {
            try
            {
                DBOperation oResponse = await _ValuationQuatatiionService.QuatationDelete(id);
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
