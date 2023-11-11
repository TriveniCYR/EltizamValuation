using Eltizam.Business.Models;
using Eltizam.Data.DataAccess.Helper;
using Eltizam.WebApi.Filters;
using Eltizam.WebApi.Helpers.Response;
using MediatR;
using Microsoft.AspNetCore.Mvc;
using System.Net;
using ValuationWeb.Application.Features;

namespace Eltizam.WebApi.Controllers
{
    [ApiController]
    [AuthorizeAttribute]
    [ApiVersion("1")]
    [Route("api/v{version:apiVersion}/[controller]")]
    public class MasterCityController : ControllerBase
    {
        #region Properties

        private readonly IConfiguration _configuration;
        private readonly IResponseHandler<dynamic> _ObjectResponse;
        private readonly IMediator _mediator;

        #endregion Properties

        #region Constructor 

        public MasterCityController(IMediator mediator, IResponseHandler<dynamic> ObjectResponse)
        {
            _mediator = mediator;
            _ObjectResponse = ObjectResponse;
        }

        #endregion Constructor

        #region API Methods

        /// <summary>
        /// Description - To Insert and Update City
        /// </summary>
        /// <param name="oCity"></param>
        /// <returns></returns>
        /// <response code="200">OK</response>
        /// <response code="400">Bad Request</response>
        /// <response code="403">Forbidden</response>
        /// <response code="404">Not Found</response>
        /// <response code="405">Method Not Allowed</response>
        /// <response code="500">Internal Server</response>

        // get all records from master City with sorting and pagination 

        [HttpPost, Route("GetAll")]
        public async Task<IActionResult> GetAll([FromForm] DataTableAjaxPostModel model)
        {
            try
            {
                var cmd = new MasterCityGetAllCommand()
                {
                    length = model.length,
                    draw = model.draw,
                    start = model.start,
                    searchText = model.search?.value
                };

                var res = await _mediator.Send(cmd);

                return _ObjectResponse.CreateData(res, (Int32)HttpStatusCode.OK);
            }
            catch (Exception ex)
            {
                return _ObjectResponse.CreateError(false, (Int32)HttpStatusCode.InternalServerError, ex);
            }
        }

        [HttpGet, Route("GetDate")]
        public async Task<IActionResult> GetDate()
        {
            return _ObjectResponse.Create(DateTime.Now, (Int32)HttpStatusCode.OK);
        }


        // get master City detail by id
        [HttpGet, Route("GetById/{id}")]
        public async Task<IActionResult> GetById([FromRoute] int id)
        {
            try
            {
                var cmd = new MasterCityGetByIdCommand()
                {
                    Id = id
                };

                var oCityEntity = await _mediator.Send(cmd);

                if (oCityEntity.Id > 0)
                    return _ObjectResponse.Create(oCityEntity, (Int32)HttpStatusCode.OK);
                else
                    return _ObjectResponse.Create(null, (Int32)HttpStatusCode.BadRequest, AppConstants.NoRecordFound);
            }
            catch (Exception ex)
            {
                return _ObjectResponse.CreateError(false, (Int32)HttpStatusCode.InternalServerError, ex);
            }
        }

        // this is for delete master Designation detail by id
        [HttpPost("Upsert")]
        public async Task<IActionResult> Upsert(MasterCityUpsertCommand model)
        {
            var oCityEntity = await _mediator.Send(model);

            if (oCityEntity == Eltizam.Utility.Enums.GeneralEnum.DBOperation.Success)
                return _ObjectResponse.Create(oCityEntity, (Int32)HttpStatusCode.OK);
            else
                return _ObjectResponse.Create(null, (Int32)HttpStatusCode.BadRequest, AppConstants.NoRecordFound);
        }

        // this is for delete master Designation detail by id
        [HttpDelete("Delete/{id}")]
        public async Task<IActionResult> Delete([FromRoute] int id)
        {
            var cmd = new MasterCityDeleteCommand()
            {
                Id = id
            };

            var oCityEntity = await _mediator.Send(cmd);

            if (oCityEntity)
                return _ObjectResponse.Create(oCityEntity, (Int32)HttpStatusCode.OK);
            else
                return _ObjectResponse.Create(null, (Int32)HttpStatusCode.BadRequest, AppConstants.NoRecordFound);
        }

        #endregion API Methods
    }
}
