using Eltizam.Business.Core.Implementation;
using Eltizam.Business.Core.Interface;
using Eltizam.Business.Models;
using Eltizam.Data.DataAccess.Helper;
using Eltizam.Resource;
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
    public class ValuationInvoiceController : ControllerBase
    {
        #region Properties

        private readonly IConfiguration _configuration;
        private readonly IResponseHandler<dynamic> _ObjectResponse;
        private Microsoft.Extensions.Hosting.IHostingEnvironment _env;
        private readonly IExceptionService _ExceptionService;
        private readonly IValuationInvoiceService _ValuationInvoiceService;

        #endregion Properties

        #region Constructor
        public ValuationInvoiceController(IConfiguration configuration, IResponseHandler<dynamic> ObjectResponse,  IExceptionService exceptionService, IValuationInvoiceService ValuationInvoiceService)
        {
            _configuration = configuration;
            _ObjectResponse = ObjectResponse;
             _ExceptionService = exceptionService;
            _ValuationInvoiceService = ValuationInvoiceService;
        }

        #endregion Constructor


        #region API Methods


        // get all records from master department with sorting and pagination 

        [HttpGet, Route("GetInvoiceList")]
        public async Task<IActionResult> GetInvoiceList(int RequestId)
        {
            try
            {
                return _ObjectResponse.CreateData(await _ValuationInvoiceService.GetInvoiceList(RequestId), (Int32)HttpStatusCode.OK);
            }
            catch (Exception ex)
            {
                return _ObjectResponse.Create(false, (Int32)HttpStatusCode.InternalServerError, Convert.ToString(ex.StackTrace));
            }
        }

        [HttpPost]
        [Route("Upsert")]
        public async Task<IActionResult> Upsert(ValuationInvoiceListModel model)
        {
            try
            {
                DBOperation oResponse = await _ValuationInvoiceService.Upsert(model);
                if (oResponse == DBOperation.Success)
                {
                    return _ObjectResponse.Create(true, (Int32)HttpStatusCode.OK, (model.Id > 0 ? AppConstants.UpdateSuccess : AppConstants.InsertSuccess));
                }
                else
                    return _ObjectResponse.Create(false, (Int32)HttpStatusCode.BadRequest, (oResponse == DBOperation.NotFound ? AppConstants.NoRecordFound : AppConstants.BadRequest));
            }
            catch (Exception ex)
            {
                return _ObjectResponse.Create(false, (Int32)HttpStatusCode.InternalServerError, Convert.ToString(ex.StackTrace));
            }
        }
        [HttpGet, Route("GetInvoiceById/{id}")]
        public async Task<IActionResult> GetInvoiceById([FromRoute] int id)
        {
            try
            {
                var quatationEntity = await _ValuationInvoiceService.GetInvoiceById(id);
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
        public async Task<IActionResult> Delete([FromRoute] int id, int? by)
        {
            try
            {
                DBOperation oResponse = await _ValuationInvoiceService.InvoiceDelete(id,by);
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

        [HttpDelete("DeleteDocument/{id}")]
        public async Task<IActionResult> DeleteDocument([FromRoute] int id, int? by)
        {
            try
            {
                DBOperation oResponse = await _ValuationInvoiceService.DeleteDocument(id, by);
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


        [HttpPost]
        [Route("UpsertInvoice")]
        public async Task<IActionResult> UpsertInvoice(ValuationInvoicePaymentModel model)
        {
            try
            {
                DBOperation oResponse = await _ValuationInvoiceService.UpsertInvoice(model);
                if (oResponse == DBOperation.Success)
                {
                    return _ObjectResponse.Create(true, (Int32)HttpStatusCode.OK, (model.Id > 0 ? AppConstants.UpdateSuccess : AppConstants.InsertSuccess));
                }
                else
                    return _ObjectResponse.Create(false, (Int32)HttpStatusCode.BadRequest, (oResponse == DBOperation.NotFound ? AppConstants.NoRecordFound : AppConstants.BadRequest));
            }
            catch (Exception ex)
            {
                return _ObjectResponse.Create(false, (Int32)HttpStatusCode.InternalServerError, Convert.ToString(ex.StackTrace));
            }
        }

        [HttpGet, Route("GetPaymentInvoiceById/{requestId}")]
        public async Task<IActionResult> GetPaymentInvoiceById([FromRoute] int requestId)
        {
            try
            {
                var oinvoiceEntity = await _ValuationInvoiceService.GetPaymentInvoiceById(requestId);
                if (oinvoiceEntity != null)
                    return _ObjectResponse.Create(oinvoiceEntity, (Int32)HttpStatusCode.OK);
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
