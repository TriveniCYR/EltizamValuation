using Eltizam.Business.Models;
using Eltizam.Data.DataAccess.Entity;
using Eltizam.Data.DataAccess.Helper;
using Eltizam.Resource;
using Eltizam.Utility.Enums;
using Eltizam.Web.Controllers;
using Eltizam.Web.Helpers;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Localization;
using Newtonsoft.Json;

namespace EltizamValuation.Web.Controllers
{
    public class ValuationRequestController : BaseController
    {
        #region Properties

        private readonly IConfiguration _cofiguration;
        private readonly IStringLocalizer<Shared> _stringLocalizerShared;
        private readonly IHelper _helper;

        #endregion Properties

        public ValuationRequestController(IConfiguration configuration, IStringLocalizer<Shared> stringLocalizerShared, IHelper helper)
        {
            _cofiguration = configuration;
            _stringLocalizerShared = stringLocalizerShared;
            _helper = helper;
        }
         
        [HttpGet]
        public IActionResult ValuationRequests()
        {  
            //Check permissions
            int roleId = _helper.GetLoggedInRoleId();
            if (!CheckRoleAccess(ModulePermissionEnum.UserMaster, PermissionEnum.View, roleId))
                return RedirectToAction(AppConstants.AccessRestriction, AppConstants.Home);

            ViewBag.CurrentUserId = _helper.GetLoggedInUserId();
            return View();
        }


        [HttpGet]
        public IActionResult ValuationRequestManage(int? id, string view)
        {
            if (id != null)  
                ViewData["IsEdit"] = true; 

            if (view != null)
                ViewData["IsView"] = true; 

            ValuationRequestModel valuationRequestModel;
            if (id == null || id <= 0)
            {
                ViewBag.CurrentUserId = _helper.GetLoggedInUserId();
                
                valuationRequestModel = new ValuationRequestModel(); 

                return View("ValuationRequestManage", valuationRequestModel);
            }
            else
            {
                ViewBag.CurrentUserId = _helper.GetLoggedInUserId();
                HttpContext.Request.Cookies.TryGetValue(UserHelper.EltizamToken, out string token);
                APIRepository objapi = new(_cofiguration);
                HttpResponseMessage responseMessage = objapi.APICommunication(APIURLHelper.ValuationRequestGetById + "/" + id, HttpMethod.Get, token).Result;

                if (responseMessage.IsSuccessStatusCode)
                {
                    string jsonResponse = responseMessage.Content.ReadAsStringAsync().Result;
                    var data = JsonConvert.DeserializeObject<APIResponseEntity<ValuationRequestModel>>(jsonResponse);

                    //Get Footer info
                    FooterInfo(TableNameEnum.ValuationRequest, _cofiguration, id); 

                    if (data._object is null)
                        return NotFound();

                    return View(data._object);
                }
                return NotFound();
            }
        }

        [HttpPost]
        [Route("ValuationRequest/ValuationRequestManage")]
        public IActionResult ValuationRequest(int id, ValuationRequestModel request)
        {
            try
            {
                HttpContext.Request.Cookies.TryGetValue(UserHelper.EltizamToken, out string token);
                APIRepository objapi = new(_cofiguration);

                //ValuationRequestModel entity = new ValuationRequestModel();

                request.Id = id;
                //entity.ApproverId = request.ApproverId;
                //entity.ValuerId = request.ValuerId;
                //entity.ValuationModeId = request.ValuationModeId;
                //entity.ValuationTimeFrame = request.ValuationTimeFrame;
                //entity.ValuationDate = request.ValuationDate;
                //entity.StatusId = request.StatusId;
                //entity.PropertyId = request.PropertyId;
                //entity.ClientId = request.ClientId;
                //entity.ReferenceNo = request.ReferenceNo;
                //entity.OtherReferenceNo = request.OtherReferenceNo;
                //Fill audit logs field
               
                if (request.Id == 0)
                    request.CreatedBy = _helper.GetLoggedInUserId();
                request.ModifiedBy = _helper.GetLoggedInUserId();

                //valuationRequestModelNew.ValuationDate = valuationRequestModel.ValuationDate;
                HttpResponseMessage responseMessage = objapi.APICommunication(APIURLHelper.UpsertValuationRequest, HttpMethod.Post, token, new StringContent(JsonConvert.SerializeObject(request))).Result;

                if (responseMessage.IsSuccessStatusCode)
                {
                    TempData[UserHelper.SuccessMessage] = AppConstants.ActionSuccess;
                    string jsonResponse = responseMessage.Content.ReadAsStringAsync().Result; 
                }
                else
                    TempData[UserHelper.ErrorMessage] = AppConstants.ActionFailed;
            }
            catch (Exception e)
            {
                _helper.LogExceptions(e);
                TempData[UserHelper.ErrorMessage] = Convert.ToString(e.StackTrace); 
            }

            ModelState.Clear();
            return RedirectToAction(nameof(ValuationRequests));
        }

        [HttpGet]
        public IActionResult ValuationQuotationManage(int? id, int vId, string refNo)
        {
            ValuationQuatationListModel quotation;
            //Check permissions for Get
            //var action = id == null ? PermissionEnum.Add : PermissionEnum.Edit;
            //int roleId = _helper.GetLoggedInRoleId();

            //if (!CheckRoleAccess(ModulePermissionEnum.UserMaster, action, roleId))
            //    return RedirectToAction(AppConstants.AccessRestriction, AppConstants.Home);


            if (id == null || id <= 0)
            {
                quotation = new ValuationQuatationListModel();
                quotation.ValuationRequestId = vId;
                quotation.ReferenceNo = refNo;
                quotation.StatusId = 1;
                ViewBag.IsView = 0;
                return View(quotation);
            }
            else
            {
                HttpContext.Request.Cookies.TryGetValue(UserHelper.EltizamToken, out string token);
                APIRepository objapi = new(_cofiguration);
                HttpResponseMessage responseMessage = objapi.APICommunication(APIURLHelper.ValuationQuatationById + "/" + id, HttpMethod.Get, token).Result;

                if (responseMessage.IsSuccessStatusCode)
                {
                    string jsonResponse = responseMessage.Content.ReadAsStringAsync().Result;
                    var data = JsonConvert.DeserializeObject<APIResponseEntity<ValuationQuatationListModel>>(jsonResponse);

                    ViewBag.IsView = 1;
                    //Get Footer info
                    FooterInfo(TableNameEnum.Master_User, _cofiguration, id);

                    return View(data._object);
                }
                return NotFound();
            }
        }
        [HttpPost]
        public IActionResult ValuationQuotationManage(int id, ValuationQuatationListModel masterQuotation)
        {
            try
            {
                //Check permissions for Get
                //var action = masterQuotation.Id == 0 ? PermissionEnum.Add : PermissionEnum.Edit;

                //int roleId = _helper.GetLoggedInRoleId();
                //if (!CheckRoleAccess(ModulePermissionEnum.UserMaster, action, roleId))
                //    return RedirectToAction(AppConstants.AccessRestriction, AppConstants.Home);

                //masterUser.Email ??= masterUser.Address?.Email;
                //if (masterUser.Document != null && masterUser.Document.Files != null)
                //{
                //    List<MasterDocumentModel> docs = FileUpload(masterUser.Document);
                //    masterUser.uploadDocument = docs;
                //    masterUser.Document = null;
                //}

                //Fill audit logs field
                if (masterQuotation.Id == 0)
                    masterQuotation.CreatedBy = _helper.GetLoggedInUserId();
                masterQuotation.ModifiedBy = _helper.GetLoggedInUserId();

                HttpContext.Request.Cookies.TryGetValue(UserHelper.EltizamToken, out string token);
                APIRepository objapi = new(_cofiguration);

                HttpResponseMessage responseMessage = objapi.APICommunication(APIURLHelper.UpsertValuationQuatation, HttpMethod.Post, token, new StringContent(JsonConvert.SerializeObject(masterQuotation))).Result;

                if (responseMessage.IsSuccessStatusCode)
                {
                    string jsonResponse = responseMessage.Content.ReadAsStringAsync().Result;
                    TempData[UserHelper.SuccessMessage] = Convert.ToString(_stringLocalizerShared["RecordInsertUpdate"]);
                }
                else
                    TempData[UserHelper.ErrorMessage] = Convert.ToString(responseMessage.Content.ReadAsStringAsync().Result);

            }
            catch (Exception e)
            {
                _helper.LogExceptions(e);
                TempData[UserHelper.ErrorMessage] = Convert.ToString(e.StackTrace);
            }

            return RedirectToAction("ValuationRequestManage", new { id = masterQuotation.ValuationRequestId, view = 0 });
        }
        [HttpGet]
        public IActionResult ValuationInvoiceManage(int? id, int vId, string refNo)
        {
            ValuationInvoiceListModel invoice;
            //Check permissions for Get
            //var action = id == null ? PermissionEnum.Add : PermissionEnum.Edit;
            //int roleId = _helper.GetLoggedInRoleId();

            //if (!CheckRoleAccess(ModulePermissionEnum.UserMaster, action, roleId))
            //    return RedirectToAction(AppConstants.AccessRestriction, AppConstants.Home);


            if (id == null || id <= 0)
            {
                invoice = new ValuationInvoiceListModel();
                invoice.ValuationRequestId = vId;
                invoice.ReferenceNo = refNo;
                ViewBag.IsView = 0;
                return View(invoice);
            }
            else
            {
                HttpContext.Request.Cookies.TryGetValue(UserHelper.EltizamToken, out string token);
                APIRepository objapi = new(_cofiguration);
                HttpResponseMessage responseMessage = objapi.APICommunication(APIURLHelper.ValuationInvoiceById + "/" + id, HttpMethod.Get, token).Result;

                if (responseMessage.IsSuccessStatusCode)
                {
                    string jsonResponse = responseMessage.Content.ReadAsStringAsync().Result;
                    var data = JsonConvert.DeserializeObject<APIResponseEntity<ValuationInvoiceListModel>>(jsonResponse);

                    ViewBag.IsView = 1;
                    //Get Footer info
                    FooterInfo(TableNameEnum.Master_User, _cofiguration, id);
                    return View(data._object);
                }
                return NotFound();
            }
        }
        [HttpPost]
        public IActionResult ValuationInvoiceManage(int id, ValuationInvoiceListModel masterInvoice)
        {
            try
            {
                //Check permissions for Get
                //var action = masterQuotation.Id == 0 ? PermissionEnum.Add : PermissionEnum.Edit;

                //int roleId = _helper.GetLoggedInRoleId();
                //if (!CheckRoleAccess(ModulePermissionEnum.UserMaster, action, roleId))
                //    return RedirectToAction(AppConstants.AccessRestriction, AppConstants.Home);

                //masterUser.Email ??= masterUser.Address?.Email;
                //if (masterUser.Document != null && masterUser.Document.Files != null)
                //{
                //    List<MasterDocumentModel> docs = FileUpload(masterUser.Document);
                //    masterUser.uploadDocument = docs;
                //    masterUser.Document = null;
                //}

                //Fill audit logs field
                if (masterInvoice.Id == 0)
                    masterInvoice.CreatedBy = _helper.GetLoggedInUserId();
                masterInvoice.ModifiedBy = _helper.GetLoggedInUserId();

                HttpContext.Request.Cookies.TryGetValue(UserHelper.EltizamToken, out string token);
                APIRepository objapi = new(_cofiguration);

                HttpResponseMessage responseMessage = objapi.APICommunication(APIURLHelper.UpsertValuationInvoice, HttpMethod.Post, token, new StringContent(JsonConvert.SerializeObject(masterInvoice))).Result;

                if (responseMessage.IsSuccessStatusCode)
                {
                    string jsonResponse = responseMessage.Content.ReadAsStringAsync().Result;
                    TempData[UserHelper.SuccessMessage] = Convert.ToString(_stringLocalizerShared["RecordInsertUpdate"]);
                }
                else
                    TempData[UserHelper.ErrorMessage] = Convert.ToString(responseMessage.Content.ReadAsStringAsync().Result);

            }
            catch (Exception e)
            {
                _helper.LogExceptions(e);
                TempData[UserHelper.ErrorMessage] = Convert.ToString(e.StackTrace);
            }

            return RedirectToAction("ValuationRequestManage");
        }
    }
}
