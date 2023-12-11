using Eltizam.Business.Models;
using Eltizam.Data.DataAccess.Entity;
using Eltizam.Data.DataAccess.Helper;
using Eltizam.Resource;
using Eltizam.Utility.Enums;
using Eltizam.Utility.Utility;
using Eltizam.Web.Controllers;
using Eltizam.Web.Helpers;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Localization;
using Newtonsoft.Json;
using System;
using System.Data;

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
            if (!CheckRoleAccess(ModulePermissionEnum.ValuationRequest, PermissionEnum.View, roleId, SubModuleEnum.ValuationRequest))
                return RedirectToAction(AppConstants.AccessRestriction, AppConstants.Home);

            //Get module wise permissions
            ViewBag.Access = GetRoleAccessValuations(ModulePermissionEnum.ValuationRequest, roleId, SubModuleEnum.ValuationRequest);
            ViewBag.QuotationAccess = GetRoleAccessValuations(ModulePermissionEnum.ValuationRequest, roleId, SubModuleEnum.ValuationQuotation);
            ViewBag.InvoiceAccess = GetRoleAccessValuations(ModulePermissionEnum.ValuationRequest, roleId, SubModuleEnum.ValuationInvoice);

            ViewBag.CurrentUserId = _helper.GetLoggedInUserId();
            return View();
        }


        [HttpGet]
        public IActionResult ValuationData(int id)
        {
            DataSet ds = new DataSet();
            ValuationRequestModel model = new ValuationRequestModel();
            HttpContext.Request.Cookies.TryGetValue(UserHelper.EltizamToken, out string token);
            APIRepository objapi = new(_cofiguration);
            HttpResponseMessage responseMessage = objapi.APICommunication(APIURLHelper.GetValuationPDFData + "/" + id, HttpMethod.Get, token).Result;

            if (responseMessage.IsSuccessStatusCode)
            {
                string jsonResponse = responseMessage.Content.ReadAsStringAsync().Result;              
                ds = JsonConvert.DeserializeObject<DataSet>(jsonResponse);
               
                    var listmodel = ds.Tables[0].DataTableToList<ValuationRequestModel>();
                    model = listmodel[0];
                

            }
            ViewBag.pdfdata = null;
            return View("ValuationData",model);
        }

            [HttpGet]
        public IActionResult ValuationRequestManage(int? id, string view)
        {
            if (id != null)
                ViewData["IsEdit"] = true;

            if (view != null)
                ViewData["IsView"] = true;
            if (view != null)
                ViewBag.IsView = view;
            //ValuationRequestModel valuationRequestModel;

            var _ValuationEntity = new ValuationRequestModel();

            _ValuationEntity.ValuationAssesment = new ValuationAssesmentActionModel();
            _ValuationEntity.ValuationAssesment.SiteDescription = new SiteDescriptionModel();
            _ValuationEntity.ValuationAssesment.comparableEvidenceModel = new ComparableEvidenceModel();
            _ValuationEntity.ValuationAssesment.valuationAssessementModel = new ValuationAssessementModel();
            //Check permissions for Get
            var action = id == null ? PermissionEnum.Add : PermissionEnum.Edit;

            //var action =id == null? PermissionEnum.Add:true? PermissionEnum.Edit: PermissionEnum.View;
            int roleId = _helper.GetLoggedInRoleId();

            if (!CheckRoleAccess(ModulePermissionEnum.ValuationRequest, action, roleId))
                return RedirectToAction(AppConstants.AccessRestriction, AppConstants.Home);

            //Get module wise permissions
            ViewBag.Access = GetRoleAccessValuations(ModulePermissionEnum.ValuationRequest, roleId, SubModuleEnum.ValuationRequest);
            ViewBag.QuotationAccess = GetRoleAccessValuations(ModulePermissionEnum.ValuationRequest, roleId, SubModuleEnum.ValuationQuotation);
            ViewBag.InvoiceAccess = GetRoleAccessValuations(ModulePermissionEnum.ValuationRequest, roleId, SubModuleEnum.ValuationInvoice);
            ViewBag.SiteDescription = GetRoleAccessValuations(ModulePermissionEnum.ValuationRequest, roleId, SubModuleEnum.SiteDescription);
            ViewBag.ComparableEvidences = GetRoleAccessValuations(ModulePermissionEnum.ValuationRequest, roleId, SubModuleEnum.ComparableEvidences);
            ViewBag.ValuationAssessement = GetRoleAccessValuations(ModulePermissionEnum.ValuationRequest, roleId, SubModuleEnum.ValuationAssessement);

            if (id == null || id <= 0)
            {
                ViewBag.CurrentUserId = _helper.GetLoggedInUserId();

                //valuationRequestModel = new ValuationRequestModel(); 
                return View("ValuationRequestManage", _ValuationEntity);
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

                    //var requestid data._object.ValuationAssesment.RequestId

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
                //entity.ApproverId = request.ApproverId;
                //entity.ValuerId = request.ValuerId;
                //entity.ValuationModeId = request.ValuationModeId;
                //entity.ValuationTimeFrame = request.ValuationTimeFrame;
                //entity.ValuationDate = request.ValuationDate;
                //entity.StatusId = request.StatusId;
                ////entity.PropertyId = request.PropertyId;
                //entity.ClientId = request.ClientId;
                //entity.ReferenceNo = request.ReferenceNo;
                //entity.OtherReferenceNo = request.OtherReferenceNo;
                //Fill audit logs field

                request.Id = id;
                if (request.Id == 0)
                    request.CreatedBy = _helper.GetLoggedInUserId();
                request.ModifiedBy = _helper.GetLoggedInUserId();

                //valuationRequestModelNew.ValuationDate = valuationRequestModel.ValuationDate;
                HttpResponseMessage responseMessage = objapi.APICommunication(APIURLHelper.UpsertValuationRequest, HttpMethod.Post, token, new StringContent(JsonConvert.SerializeObject(request))).Result;

                if (responseMessage.IsSuccessStatusCode && request.Id == 0)
                {
                    TempData[UserHelper.SuccessMessage] = AppConstants.ActionSuccess;
                    string jsonResponse = responseMessage.Content.ReadAsStringAsync().Result;
                    return RedirectToAction(nameof(ValuationRequests));
                }
                if (responseMessage.IsSuccessStatusCode)
                {
                    TempData[UserHelper.SuccessMessage] = AppConstants.ActionSuccess;
                    string jsonResponse = responseMessage.Content.ReadAsStringAsync().Result;
                    return Redirect($"/ValuationRequest/ValuationRequestManage?id={request.Id}");
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
            var action = id == null ? PermissionEnum.Add : PermissionEnum.View;


            int roleId = _helper.GetLoggedInRoleId();

            if (!CheckRoleAccess(ModulePermissionEnum.ValuationRequest, action, roleId))
                return RedirectToAction(AppConstants.AccessRestriction, AppConstants.Home);

            //Get module wise permissions
            ViewBag.Access = GetRoleAccessValuations(ModulePermissionEnum.ValuationRequest, roleId, SubModuleEnum.ValuationRequest);
            ViewBag.QuotationAccess = GetRoleAccessValuations(ModulePermissionEnum.ValuationRequest, roleId, SubModuleEnum.ValuationQuotation);
            ViewBag.InvoiceAccess = GetRoleAccessValuations(ModulePermissionEnum.ValuationRequest, roleId, SubModuleEnum.ValuationInvoice);


            // Assuming ViewBag.QuotationAccess is an object with a property View (boolean)
            bool hasQuatationViewAccess = ViewBag.QuotationAccess?.View ?? false;
            bool hasQuatationEditAccess = ViewBag.QuotationAccess?.Edit ?? false;
            bool hasQuatationAddAccess = ViewBag.QuotationAccess?.Add ?? false;

            if (action == PermissionEnum.View && !hasQuatationViewAccess)
            {
                return RedirectToAction(AppConstants.AccessRestriction, AppConstants.Home);
            }
            else if (action == PermissionEnum.Edit && !hasQuatationEditAccess)
            {
                return RedirectToAction(AppConstants.AccessRestriction, AppConstants.Home);
            }
            else if (action == PermissionEnum.Add && !hasQuatationAddAccess)
            {
                return RedirectToAction(AppConstants.AccessRestriction, AppConstants.Home);
            }

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
                var action = id == null ? PermissionEnum.Add : PermissionEnum.View;


                int roleId = _helper.GetLoggedInRoleId();

                if (!CheckRoleAccess(ModulePermissionEnum.ValuationRequest, action, roleId))
                    return RedirectToAction(AppConstants.AccessRestriction, AppConstants.Home);

                //Get module wise permissions
                ViewBag.Access = GetRoleAccessValuations(ModulePermissionEnum.ValuationRequest, roleId, SubModuleEnum.ValuationRequest);
                ViewBag.QuotationAccess = GetRoleAccessValuations(ModulePermissionEnum.ValuationRequest, roleId, SubModuleEnum.ValuationQuotation);
                ViewBag.InvoiceAccess = GetRoleAccessValuations(ModulePermissionEnum.ValuationRequest, roleId, SubModuleEnum.ValuationInvoice);


                // Assuming ViewBag.QuotationAccess is an object with a property View (boolean)
                bool hasQuatationViewAccess = ViewBag.QuotationAccess?.View ?? false;
                bool hasQuatationEditAccess = ViewBag.QuotationAccess?.Edit ?? false;
                bool hasQuatationAddAccess = ViewBag.QuotationAccess?.Add ?? false;

                if (action == PermissionEnum.View && !hasQuatationViewAccess)
                {
                    return RedirectToAction(AppConstants.AccessRestriction, AppConstants.Home);
                }
                else if (action == PermissionEnum.Edit && !hasQuatationEditAccess)
                {
                    return RedirectToAction(AppConstants.AccessRestriction, AppConstants.Home);
                }
                else if (action == PermissionEnum.Add && !hasQuatationAddAccess)
                {
                    return RedirectToAction(AppConstants.AccessRestriction, AppConstants.Home);
                }


                if (masterQuotation.Id == 0)
                    masterQuotation.CreatedBy = _helper.GetLoggedInUserId();
                masterQuotation.ModifiedBy = _helper.GetLoggedInUserId();

                if (masterQuotation.Document != null && masterQuotation.Document.Files != null)
                {
                    List<MasterDocumentModel> docs = FileUpload(masterQuotation.Document);
                    masterQuotation.uploadDocument = docs;
                    masterQuotation.Document = null;
                }

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
            return RedirectToAction("ValuationRequests");
            //return RedirectToAction("ValuationRequestManage", new { id = masterQuotation.ValuationRequestId });
        }
        [HttpGet]
        public IActionResult ValuationInvoiceManage(int? id, int vId, string refNo)
        {
            ValuationInvoiceListModel invoice;


            //Check permissions for Get
            var action = id == null ? PermissionEnum.Add : PermissionEnum.View;


            int roleId = _helper.GetLoggedInRoleId();

            if (!CheckRoleAccess(ModulePermissionEnum.ValuationRequest, action, roleId))
                return RedirectToAction(AppConstants.AccessRestriction, AppConstants.Home);

            //Get module wise permissions
            ViewBag.Access = GetRoleAccessValuations(ModulePermissionEnum.ValuationRequest, roleId, SubModuleEnum.ValuationRequest);
            ViewBag.QuotationAccess = GetRoleAccessValuations(ModulePermissionEnum.ValuationRequest, roleId, SubModuleEnum.ValuationQuotation);
            ViewBag.InvoiceAccess = GetRoleAccessValuations(ModulePermissionEnum.ValuationRequest, roleId, SubModuleEnum.ValuationInvoice);



            bool hasInvoiceViewAccess = ViewBag.QuotationAccess?.View ?? false;
            bool hasInvoiceEditAccess = ViewBag.QuotationAccess?.Edit ?? false;
            bool hasInvoiceAddAccess = ViewBag.QuotationAccess?.Add ?? false;

            if (action == PermissionEnum.View && !hasInvoiceViewAccess)
            {
                return RedirectToAction(AppConstants.AccessRestriction, AppConstants.Home);
            }
            else if (action == PermissionEnum.Edit && !hasInvoiceEditAccess)
            {
                return RedirectToAction(AppConstants.AccessRestriction, AppConstants.Home);
            }
            else if (action == PermissionEnum.Add && !hasInvoiceAddAccess)
            {
                return RedirectToAction(AppConstants.AccessRestriction, AppConstants.Home);
            }



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
                var action = id == null ? PermissionEnum.Add : PermissionEnum.View;


                int roleId = _helper.GetLoggedInRoleId();

                if (!CheckRoleAccess(ModulePermissionEnum.ValuationRequest, action, roleId))
                    return RedirectToAction(AppConstants.AccessRestriction, AppConstants.Home);

                //Get module wise permissions
                ViewBag.Access = GetRoleAccessValuations(ModulePermissionEnum.ValuationRequest, roleId, SubModuleEnum.ValuationRequest);
                ViewBag.QuotationAccess = GetRoleAccessValuations(ModulePermissionEnum.ValuationRequest, roleId, SubModuleEnum.ValuationQuotation);
                ViewBag.InvoiceAccess = GetRoleAccessValuations(ModulePermissionEnum.ValuationRequest, roleId, SubModuleEnum.ValuationInvoice);



                bool hasInvoiceViewAccess = ViewBag.QuotationAccess?.View ?? false;
                bool hasInvoiceEditAccess = ViewBag.QuotationAccess?.Edit ?? false;
                bool hasInvoiceAddAccess = ViewBag.QuotationAccess?.Add ?? false;

                if (action == PermissionEnum.View && !hasInvoiceViewAccess)
                {
                    return RedirectToAction(AppConstants.AccessRestriction, AppConstants.Home);
                }
                else if (action == PermissionEnum.Edit && !hasInvoiceEditAccess)
                {
                    return RedirectToAction(AppConstants.AccessRestriction, AppConstants.Home);
                }
                else if (action == PermissionEnum.Add && !hasInvoiceAddAccess)
                {
                    return RedirectToAction(AppConstants.AccessRestriction, AppConstants.Home);
                }

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


        [HttpPost]
        [Route("ValuationRequest/ReviewerRequestStatus")]
        public IActionResult ReviewerRequestStatus(int id, ValutionRequestForApproverModel appoveRequestModel)
        {
            try
            {


                HttpContext.Request.Cookies.TryGetValue(UserHelper.EltizamToken, out string token);
                APIRepository objapi = new(_cofiguration);

                ValutionRequestForApproverModel valuationRequestModelNew = new ValutionRequestForApproverModel();
                valuationRequestModelNew.Id = id;

                valuationRequestModelNew.StatusId = appoveRequestModel.StatusId;

                valuationRequestModelNew.ApproverComment = appoveRequestModel.ApproverComment;

                HttpResponseMessage responseMessage = objapi.APICommunication(APIURLHelper.ReviewRequestStatus, HttpMethod.Post, token, new StringContent(JsonConvert.SerializeObject(valuationRequestModelNew))).Result;

                if (responseMessage.IsSuccessStatusCode)
                {
                    TempData["StatusMessage"] = "Saved Successfully";
                    string jsonResponse = responseMessage.Content.ReadAsStringAsync().Result;
                    ModelState.Clear();
                    return RedirectToAction(nameof(ValuationRequests));
                }
                else
                    TempData["StatusMessage"] = "Some Eror Occured";
            }
            catch (Exception e)
            {
                _helper.LogExceptions(e);
                ViewBag.errormessage = Convert.ToString(e.StackTrace);
                ModelState.Clear();
                return View(nameof(ValuationRequests));
            }
            ModelState.Clear();
            return RedirectToAction(nameof(ValuationRequests));
        }


        [HttpPost]
        [Route("ValuationRequest/ValuationAssesmentManage")]
        public IActionResult ValuationAssesmentManage(int id, ValuationAssesmentActionModel valuationAssesment)
        {
            try
            {
                //Check permissions for Get
                var action = id == null ? PermissionEnum.Add : PermissionEnum.Edit;
                var requestId = id;
                valuationAssesment.SiteDescription.ValuationRequestId = requestId;
                valuationAssesment.comparableEvidenceModel.RequestId = requestId;
                valuationAssesment.valuationAssessementModel.RequestId = requestId;

                if (valuationAssesment.SiteDescription.Document != null && valuationAssesment.SiteDescription.Document.Files != null)
                {
                    List<MasterDocumentModel> docs = FileUpload(valuationAssesment.SiteDescription.Document);
                    valuationAssesment.SiteDescription.uploadDocument = docs;
                    valuationAssesment.SiteDescription.Document = null;
                }
                if (valuationAssesment.comparableEvidenceModel.Document != null && valuationAssesment.comparableEvidenceModel.Document.Files != null)
                {
                    List<MasterDocumentModel> docs = FileUpload(valuationAssesment.comparableEvidenceModel.Document);
                    valuationAssesment.comparableEvidenceModel.uploadDocument = docs;
                    valuationAssesment.comparableEvidenceModel.Document = null;
                }
                if (valuationAssesment.valuationAssessementModel.Document != null && valuationAssesment.valuationAssessementModel.Document.Files != null)
                {
                    List<MasterDocumentModel> docs = FileUpload(valuationAssesment.valuationAssessementModel.Document);
                    valuationAssesment.valuationAssessementModel.uploadDocument = docs;
                    valuationAssesment.valuationAssessementModel.Document = null;
                }
                int roleId = _helper.GetLoggedInRoleId();

                if (!CheckRoleAccess(ModulePermissionEnum.ValuationRequest, action, roleId))
                    return RedirectToAction(AppConstants.AccessRestriction, AppConstants.Home);

                //Get module wise permissions
                ViewBag.Access = GetRoleAccessValuations(ModulePermissionEnum.ValuationRequest, roleId, SubModuleEnum.ValuationRequest);
                ViewBag.SiteDescription = GetRoleAccessValuations(ModulePermissionEnum.ValuationRequest, roleId, SubModuleEnum.SiteDescription);
                ViewBag.ComparableEvidences = GetRoleAccessValuations(ModulePermissionEnum.ValuationRequest, roleId, SubModuleEnum.ComparableEvidences);
                ViewBag.ValuationAssessement = GetRoleAccessValuations(ModulePermissionEnum.ValuationRequest, roleId, SubModuleEnum.ValuationAssessement);


                // Assuming ViewBag.QuotationAccess is an object with a property View (boolean)
                bool hasSiteDescriptionViewAccess = ViewBag.SiteDescription?.View ?? false;
                bool hasSiteDescriptionEditAccess = ViewBag.SiteDescription?.Edit ?? false;
                bool hasSiteDescriptionAddAccess = ViewBag.SiteDescription?.Add ?? false;

                if (action == PermissionEnum.View && !hasSiteDescriptionViewAccess)
                {
                    return RedirectToAction(AppConstants.AccessRestriction, AppConstants.Home);
                }
                else if (action == PermissionEnum.Edit && !hasSiteDescriptionViewAccess)
                {
                    return RedirectToAction(AppConstants.AccessRestriction, AppConstants.Home);
                }
                else if (action == PermissionEnum.Add && !hasSiteDescriptionViewAccess)
                {
                    return RedirectToAction(AppConstants.AccessRestriction, AppConstants.Home);
                }




                if (valuationAssesment.SiteDescription.Id == 0)
                    valuationAssesment.SiteDescription.CreatedBy = _helper.GetLoggedInUserId();
                valuationAssesment.SiteDescription.ModifiedBy = _helper.GetLoggedInUserId();
                if (valuationAssesment.comparableEvidenceModel.Id == 0)
                    valuationAssesment.comparableEvidenceModel.CreatedBy = _helper.GetLoggedInUserId();
                valuationAssesment.comparableEvidenceModel.ModifiedBy = _helper.GetLoggedInUserId();
                if (valuationAssesment.valuationAssessementModel.Id == 0)
                    valuationAssesment.valuationAssessementModel.CreatedBy = _helper.GetLoggedInUserId();
                valuationAssesment.valuationAssessementModel.ModifiedBy = _helper.GetLoggedInUserId();

                HttpContext.Request.Cookies.TryGetValue(UserHelper.EltizamToken, out string token);
                APIRepository objapi = new(_cofiguration);

                HttpResponseMessage responseMessage = objapi.APICommunication(APIURLHelper.ValuationAssesment, HttpMethod.Post, token, new StringContent(JsonConvert.SerializeObject(valuationAssesment))).Result;

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
            //return RedirectToAction("ValuationRequests");
            return Redirect($"/ValuationRequest/ValuationRequestManage?id={valuationAssesment.SiteDescription.ValuationRequestId}");
            //return RedirectToAction("ValuationRequestManage", new { id = masterQuotation.ValuationRequestId });
        }

        [HttpGet]
        public IActionResult DeleteSiteDescriptionDocument(int id, string? fileName)
        {
            try
            {
                //Check permissions for Get                
                int isFileDelete = DeleteFile(id, fileName);
                HttpContext.Request.Cookies.TryGetValue(UserHelper.EltizamToken, out string token);
                APIRepository objapi = new(_cofiguration);
                HttpResponseMessage responseMessage = objapi.APICommunication(APIURLHelper.DeleteDocument + "/" + id, HttpMethod.Delete, token).Result;

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

            return RedirectToAction("Users");
        }
        private List<MasterDocumentModel> FileUpload(DocumentFilesModel document)
        {
            List<MasterDocumentModel> uploadFils = new List<MasterDocumentModel>();
            if (document.Files == null || document.Files.Count == 0)
            {
                throw new ArgumentException("No files were uploaded.");
            }
            //var currentUser = _helper.GetLoggedInUserId();
            var savedFileNames = new List<string>();

            foreach (var file in document.Files)
            {
                if (file == null || file.Length == 0)
                {
                    continue;
                }

                // Check if the file type is allowed
                //var allowedFileTypes = new List<string> { "image/jpeg", "image/png", "application/msword", "application/pdf" };
                //if (!allowedFileTypes.Contains(file.ContentType))
                //{
                //    throw new ArgumentException($"File type '{file.ContentType}' is not allowed.");
                //}

                var fileName = Guid.NewGuid().ToString() + Path.GetExtension(file.FileName);
                var docName = Path.GetFileNameWithoutExtension(file.FileName);
                var filePath = Path.Combine("wwwroot/Uploads", fileName);
                filePath = filePath.Replace("\\", "/");
                using (var stream = new FileStream(filePath, FileMode.Create))
                {
                    file.CopyToAsync(stream);
                }

                // Save information about the uploaded file to the database
                var upload = new MasterDocumentModel
                {
                    FileName = fileName,
                    FilePath = filePath.Replace("wwwroot", ".."),
                    DocumentName = docName,
                    IsActive = 1,
                    //CreatedBy = currentUser,
                    FileType = GetFileType(file.ContentType),
                    CreatedDate = null,
                    CreatedName = ""
                };

                uploadFils.Add(upload);
            }
            return uploadFils;
        }

        private int DeleteFile(int id, string? fileName)
        {
            int isDelete = 0;
            if (fileName != null || fileName != "")
            {
                var filePath = Path.Combine("wwwroot/Uploads", fileName);
                filePath = filePath.Replace("\\", "/");
                // Check if the file type is allowed
                if (System.IO.File.Exists(filePath))
                {
                    // If file found, delete it
                    System.IO.File.Delete(filePath);
                    isDelete = 1;
                }

            }
            return isDelete;
        }
        private string GetFileType(string contentType)
        {
            switch (contentType)
            {
                case "image/jpeg":
                case "image/png":
                    return "Image";
                case "application/msword":
                    return "Word";
                case "application/pdf":
                    return "PDF";
                default:
                    return "Unknown";
            }
        }

    }
}


