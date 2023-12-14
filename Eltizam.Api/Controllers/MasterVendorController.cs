using Eltizam.Api.Filters;
using Eltizam.Api.Helpers.Response;
using Eltizam.Business.Core.Interface;
using Eltizam.Business.Models;
using Eltizam.Data.DataAccess.Helper;
using Microsoft.AspNetCore.Mvc;
using System.Net;
using static Eltizam.Utility.Enums.GeneralEnum;

namespace EltizamValuation.Api.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    [AuthorizeAttribute]
    public class MasterVendorController : ControllerBase
    {
        #region Properties
        private readonly IMasterVendorService _vendorServices;
        private readonly IResponseHandler<dynamic> _ObjectResponse;
        private readonly IExceptionService _ExceptionService;
        IExceptionService exceptionService;
        #endregion Properties

        #region Constructor
        public MasterVendorController(IMasterVendorService vendorServices, IResponseHandler<dynamic> ObjectResponse)
        {
            _vendorServices = vendorServices;
            _ObjectResponse = ObjectResponse;
            _ExceptionService = exceptionService;
        }
        #endregion Constructor

        #region API Methods
        [HttpPost]
        [Route("Upsert")]
        public async Task<IActionResult> Upsert(MasterVendorModel vendor)
        {
            try
            {
                DBOperation oResponse = await _vendorServices.AddUpdateMasterVendor(vendor);
                if (oResponse == DBOperation.Success)
                {
                    return _ObjectResponse.Create(true, (Int32)HttpStatusCode.OK, (vendor.Id > 0 ? AppConstants.UpdateSuccess : AppConstants.InsertSuccess));
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
        [Route("GetById/{id}")]
        public async Task<IActionResult> GetMasterVendorById([FromRoute] int id)
        {
            try
            {
                var masterVendor = await _vendorServices.GetMasterVendorByIdAsync(id);

                if (masterVendor != null && masterVendor.Id > 0)
                {
                    // Assuming _ObjectResponse.Create takes three parameters: data, status code, and message.
                    return _ObjectResponse.Create(masterVendor, (int)HttpStatusCode.OK);
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


        [HttpPost, Route("GetAll")]
        public async Task<IActionResult> GetAll([FromForm] DataTableAjaxPostModel model)
        {
            try
            {
                return _ObjectResponse.CreateData(await _vendorServices.GetAll(model), (Int32)HttpStatusCode.OK);
            }
            catch (Exception ex)
            {
                return _ObjectResponse.Create(false, (Int32)HttpStatusCode.InternalServerError, Convert.ToString(ex.StackTrace));
            }
        }

        [HttpPost("Delete/{id}")]
        public async Task<IActionResult> Delete([FromRoute] int id, int? by)
        {
            try
            {
                DBOperation oResponse = await _vendorServices.DeleteVendor(id,by);
                if (oResponse == DBOperation.Success)
                    return _ObjectResponse.Create(true, (Int32)HttpStatusCode.OK, AppConstants.DeleteSuccess);
                else
                    return _ObjectResponse.Create(null, (Int32)HttpStatusCode.BadRequest, AppConstants.NoRecordFound);
            }
            catch (Exception ex)
            {
                await _ExceptionService.LogException(ex);
                return _ObjectResponse.Create(false, (Int32)HttpStatusCode.InternalServerError, Convert.ToString(ex.StackTrace));
            }
        }
        #endregion API Methods
    }
}
