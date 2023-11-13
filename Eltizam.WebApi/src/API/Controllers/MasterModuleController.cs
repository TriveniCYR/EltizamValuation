using Eltizam.Business.Core.Interface;
using Eltizam.Data.DataAccess.Helper;
using Microsoft.AspNetCore.Mvc;
using Eltizam.WebApi.Filters;
using Eltizam.WebApi.Helpers.Response;
using System.Net;

namespace Eltizam.WebApi.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    [AuthorizeAttribute]
    public class MasterModuleController : ControllerBase
    {
        #region Properties

        private readonly IMasterModuleService _MasterModuleService;

        private readonly IResponseHandler<dynamic> _ObjectResponse;

        #endregion Properties

        public MasterModuleController(IMasterModuleService MasterModuleService, IResponseHandler<dynamic> ObjectResponse)
        {
            _MasterModuleService = MasterModuleService;

            _ObjectResponse = ObjectResponse;
        }

        /// <summary>
        /// Description - To Get All Module
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        /// <response code="200">OK</response>
        /// <response code="400">Bad Request</response>
        /// <response code="401">Unauthorized</response>
        /// <response code="403">Forbidden</response>
        /// <response code="404">Not Found</response>
        /// <response code="405">Method Not Allowed</response>
        /// <response code="500">Internal Server</response>
        [HttpGet, Route("GetAllModule")]
        public async Task<IActionResult> GetAllModule()
        {
            try
            {
                var oModuleList = await _MasterModuleService.GetAll();
                if (oModuleList != null)
                    return _ObjectResponse.Create(oModuleList, (Int32)HttpStatusCode.OK);
                else
                    return _ObjectResponse.Create(null, (Int32)HttpStatusCode.BadRequest, AppConstants.NoRecordFound);
            }
            catch (Exception ex)
            {
                return _ObjectResponse.Create(false, (Int32)HttpStatusCode.InternalServerError, Convert.ToString(ex.StackTrace));
            }
        }
    }
}