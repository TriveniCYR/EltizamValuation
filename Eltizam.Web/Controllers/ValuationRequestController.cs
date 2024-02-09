using Eltizam.Business.Models;
using Eltizam.Data.DataAccess.Helper;
using Eltizam.Resource;
using Eltizam.Utility.Enums;
using Eltizam.Utility.Utility;
using Eltizam.Web.Controllers;
using Eltizam.Web.Helpers;
using Microsoft.AspNet.SignalR;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Localization;
using Newtonsoft.Json;
using Org.BouncyCastle.Asn1.Ocsp;
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
        public IActionResult ValuationPaymentInvoiceManage(int? id, int vId)
        {
            ValuationInvoicePaymentModel invoice;

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

            invoice = new ValuationInvoicePaymentModel();

            //Get basic info
            ValReqHeaderInfo(vId);
            invoice.ValuationRequestId = vId;


            HttpContext.Request.Cookies.TryGetValue(UserHelper.EltizamToken, out string token);
            APIRepository objapi = new(_cofiguration);

            if (id == null || id <= 0)
            {
                //Get Footer info
                FooterInfo(TableNameEnum.ValuationInvoice, _cofiguration, id);
                return View(invoice);
            }
            else
            {
                HttpContext.Request.Cookies.TryGetValue(UserHelper.EltizamToken, out string _token);
                APIRepository _objapi = new(_cofiguration);
                HttpResponseMessage _responseMessage = _objapi.APICommunication(APIURLHelper.PaymentInvoiceById + "/" + id, HttpMethod.Get, _token).Result;

                if (_responseMessage.IsSuccessStatusCode)
                {
                    string jsonResponse = _responseMessage.Content.ReadAsStringAsync().Result;
                    var data = JsonConvert.DeserializeObject<APIResponseEntity<ValuationInvoicePaymentModel>>(jsonResponse);

                    ////Get Footer info
                    FooterInfo(TableNameEnum.ValuationInvoice, _cofiguration, id, true);

                    return View("ValuationPaymentInvoiceManage", data._object);
                }
                return NotFound();
            }
        }


        [HttpPost]
        public IActionResult ValuationPaymentInvoiceManage(int id, ValuationInvoicePaymentModel invoice)
        {
            try
            {
                //Check permissions for Get
                var action = id == null ? PermissionEnum.Edit : PermissionEnum.Add;

                if (invoice.Id == 0)
                    invoice.CreatedBy = _helper.GetLoggedInUserId();
                invoice.ModifiedBy = _helper.GetLoggedInUserId();

                HttpContext.Request.Cookies.TryGetValue(UserHelper.EltizamToken, out string token);
                APIRepository objapi = new(_cofiguration);

                HttpResponseMessage responseMessage = objapi.APICommunication(APIURLHelper.UpsertInvoice, HttpMethod.Post, token, new StringContent(JsonConvert.SerializeObject(invoice))).Result;

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

            return Redirect($"/ValuationRequest/ValuationRequestManage?id={invoice.ValuationRequestId}");
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
            ViewBag.pdfdata = ds;
            return View("ValuationData", model);
        }

        [HttpGet]
        public IActionResult ValuationRequestManage(int? id, int? IsView)
        {
            var _ValuationEntity = new ValuationRequestModel();

            _ValuationEntity.ValuationAssesment = new ValuationAssesmentActionModel();
            _ValuationEntity.ValuationAssesment.SiteDescription = new SiteDescriptionModel();
            _ValuationEntity.ValuationAssesment.comparableEvidenceModel = new ComparableEvidenceModel();
            _ValuationEntity.ValuationAssesment.valuationAssessementModel = new ValuationAssessementModel();
            IsView = (IsView == null || IsView == 0) ? 0 : 1;
            //var action =id == null? PermissionEnum.Add:true? PermissionEnum.Edit: PermissionEnum.View;
            int roleId = _helper.GetLoggedInRoleId();
            int userId = _helper.GetLoggedInUserId();

            if(IsView==0)
            {
                //Check edit permission
                if (!string.IsNullOrWhiteSpace(CheckUserEditable(id, roleId)))
                    IsView = 1;
            }
            //return Redirect($"/ValuationRequest/ValuationRequestManage?id={id}&IsView=1");

                //Check permissions for Get
            var action = IsView == 1 ? PermissionEnum.View : (id == null ? PermissionEnum.Add : PermissionEnum.Edit);

            if (!CheckRoleAccess(ModulePermissionEnum.ValuationRequest, action, roleId))
                return RedirectToAction(AppConstants.AccessRestriction, AppConstants.Home);

            //Get Footer info
            var vw = IsView == 1;
            ViewBag.IsView = IsView;
            FooterInfo(TableNameEnum.ValuationRequest, _cofiguration, id, vw);

            //Get module wise permissions
            ViewBag.Access = GetRoleAccessValuations(ModulePermissionEnum.ValuationRequest, roleId, SubModuleEnum.ValuationRequest);
            ViewBag.QuotationAccess = GetRoleAccessValuations(ModulePermissionEnum.ValuationRequest, roleId, SubModuleEnum.ValuationQuotation);
            ViewBag.InvoiceAccess = GetRoleAccessValuations(ModulePermissionEnum.ValuationRequest, roleId, SubModuleEnum.ValuationInvoice);
            ViewBag.SiteDescription = GetRoleAccessValuations(ModulePermissionEnum.ValuationRequest, roleId, SubModuleEnum.SiteDescription);
            ViewBag.ComparableEvidences = GetRoleAccessValuations(ModulePermissionEnum.ValuationRequest, roleId, SubModuleEnum.ComparableEvidences);
            ViewBag.ValuationAssessement = GetRoleAccessValuations(ModulePermissionEnum.ValuationRequest, roleId, SubModuleEnum.ValuationAssessement);
            ViewBag.CurrentUserId = userId;

            //Get details by Id
            var _id = id ?? 0;
            HttpContext.Request.Cookies.TryGetValue(UserHelper.EltizamToken, out string token);
            APIRepository objapi = new(_cofiguration);
            HttpResponseMessage responseMessage = objapi.APICommunication(APIURLHelper.ValuationRequestGetById + "/" + _id, HttpMethod.Get, token).Result;

            if (responseMessage.IsSuccessStatusCode)
            {
                string jsonResponse = responseMessage.Content.ReadAsStringAsync().Result;
                var data = JsonConvert.DeserializeObject<APIResponseEntity<ValuationRequestModel>>(jsonResponse);

                _ValuationEntity = data?._object;
            }

            if (id == null || id <= 0)
            { 
                //valuationRequestModel = new ValuationRequestModel(); 
                return View("ValuationRequestManage", _ValuationEntity);
            }
            else
            {
                //Give access of only requestes which they beed assigned for
                if ((roleId == (int)RoleEnum.Valuer && _ValuationEntity?.ValuerId != userId) ||
                    (roleId == (int)RoleEnum.Approver && _ValuationEntity?.ApproverId != userId))
                {
                    if (_ValuationEntity?.ApproverId != userId)
                    {
                        return RedirectToAction(nameof(ValuationRequests));
                    }
                    else
                    {
                        return RedirectToAction(AppConstants.AccessRestriction, AppConstants.Home);
                    }
                }

                //Get basic info
                ValReqHeaderInfo(id.Value); 

                return View(_ValuationEntity);
            }
        }

        [HttpPost]
        [Route("ValuationRequest/ValuationRequestManage")]
        public IActionResult ValuationRequest(int id, ValuationRequestModel request)
        {
            try
            {
                request.Id = id;
                if (request.Id == 0)
                    request.CreatedBy = _helper.GetLoggedInUserId();
                request.ModifiedBy = _helper.GetLoggedInUserId();
                if(request.Id == 0)
                {
                    request.StatusId = 1;
                }
                
                int roleId = _helper.GetLoggedInRoleId();

                //Check edit permission
                if (!string.IsNullOrWhiteSpace(CheckUserEditable(id, roleId))) 
                    return Redirect($"/ValuationRequest/ValuationRequestManage?id={request.Id}"); 


                HttpContext.Request.Cookies.TryGetValue(UserHelper.EltizamToken, out string token);
                APIRepository objapi = new(_cofiguration);
                HttpResponseMessage responseMessage = objapi.APICommunication(APIURLHelper.UpsertValuationRequest, HttpMethod.Post, token, new StringContent(JsonConvert.SerializeObject(request))).Result;


                if (responseMessage.IsSuccessStatusCode)
                {
                    TempData[UserHelper.SuccessMessage] = AppConstants.ActionSuccess;
                    string jsonResponse = responseMessage.Content.ReadAsStringAsync().Result;

                    if (request.Id == 0)
                        return RedirectToAction(nameof(ValuationRequests));
                    else
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
        public IActionResult ValuationQuotationManage(int? id, int vId)
        {
            ValuationQuatationListModel quotation;
            //Check permissions for Get
            var action = id == null ? PermissionEnum.Add : PermissionEnum.View;


            int roleId = _helper.GetLoggedInRoleId();
            if (id == 0)
            {
                if (!string.IsNullOrWhiteSpace(CheckUserEditable(vId, roleId)))
                    return Redirect($"/ValuationRequest/ValuationRequestManage?id={vId}");
            }
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

            quotation = new ValuationQuatationListModel();

            //Get basic info
            ValReqHeaderInfo(vId);
            quotation.ValuationRequestId = vId;

            if (id == null || id <= 0)
            {
                quotation.StatusId = 13;
                FooterInfo(TableNameEnum.ValuationQuotation, _cofiguration, id);
                return View(quotation);
            }
            else
            {
                HttpContext.Request.Cookies.TryGetValue(UserHelper.EltizamToken, out string _token);
                APIRepository _objapi = new(_cofiguration);
                HttpResponseMessage _responseMessage = _objapi.APICommunication(APIURLHelper.ValuationQuatationById + "/" + id, HttpMethod.Get, _token).Result;

                if (_responseMessage.IsSuccessStatusCode)
                {
                    string jsonResponse = _responseMessage.Content.ReadAsStringAsync().Result;
                    var data = JsonConvert.DeserializeObject<APIResponseEntity<ValuationQuatationListModel>>(jsonResponse);

                    ////Get Footer info
                    FooterInfo(TableNameEnum.ValuationQuotation, _cofiguration, id, true);

                    return View(data._object);
                }
                return NotFound();
            }
        }
        private void ValReqHeaderInfo(int vId)
        {
            HttpContext.Request.Cookies.TryGetValue(UserHelper.EltizamToken, out string token);
            APIRepository objapi = new(_cofiguration);
            HttpResponseMessage responseMessage = objapi.APICommunication(APIURLHelper.ValuationRequestGetHeaderInfoById + "/" + vId, HttpMethod.Get, token).Result;

            if (responseMessage.IsSuccessStatusCode)
            {
                string jsonResponse = responseMessage.Content.ReadAsStringAsync().Result;
                var data = JsonConvert.DeserializeObject<APIResponseEntity<ValuationRequestDependencies>>(jsonResponse);

                if (data != null && data._object != null)
                {
                    //quotation.ValuationRequestId = vId;
                    //quotation.ReferenceNo = data._object.ReferenceNO;
                    //quotation.StatusName = data._object.StatusName;
                    //quotation.ColorCode = data._object.ColorCode;
                    //quotation.BackGroundColor = data._object.BackGroundColor;
                    //quotation.ClientName = data._object.ClientName;
                    //quotation.PropertyName = data._object.PropertyName;

                    TempData[UserHelper.ValReqHeader] = data._object;
                }
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

                if (!string.IsNullOrWhiteSpace(CheckUserEditable(masterQuotation.ValuationRequestId, roleId)))
                    return Redirect($"/ValuationRequest/ValuationRequestManage?id={masterQuotation.ValuationRequestId}");

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
                    List<MasterDocumentModel> docs = _helper.FileUpload(masterQuotation.Document);
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

            return Redirect($"/ValuationRequest/ValuationRequestManage?id={masterQuotation.ValuationRequestId}");
        }

        [HttpGet]
        public IActionResult ValuationInvoiceManage(int? id, int vId)
        {
            ValuationInvoiceListModel invoice;

            //Check permissions for Get
            var action = id == null ? PermissionEnum.Add : PermissionEnum.View;

            int roleId = _helper.GetLoggedInRoleId();
            if (id == 0)
            {
                if (!string.IsNullOrWhiteSpace(CheckUserEditable(vId, roleId)))
                    return Redirect($"/ValuationRequest/ValuationRequestManage?id={vId}");
            }
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

            invoice = new ValuationInvoiceListModel();

            //Get basic info
            ValReqHeaderInfo(vId);
            invoice.ValuationRequestId = vId;

            if (id == null || id <= 0)
            {
                //Get Footer info
                FooterInfo(TableNameEnum.ValuationInvoice, _cofiguration, id);
                return View(invoice);
            }
            else
            {
                HttpContext.Request.Cookies.TryGetValue(UserHelper.EltizamToken, out string _token);
                APIRepository _objapi = new(_cofiguration);
                HttpResponseMessage _responseMessage = _objapi.APICommunication(APIURLHelper.ValuationInvoiceById + "/" + id, HttpMethod.Get, _token).Result;

                if (_responseMessage.IsSuccessStatusCode)
                {
                    string jsonResponse = _responseMessage.Content.ReadAsStringAsync().Result;
                    var data = JsonConvert.DeserializeObject<APIResponseEntity<ValuationInvoiceListModel>>(jsonResponse);

                    //Get Footer info
                    FooterInfo(TableNameEnum.ValuationInvoice, _cofiguration, id, true);

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

                if (!string.IsNullOrWhiteSpace(CheckUserEditable(masterInvoice.ValuationRequestId, roleId)))
                    return Redirect($"/ValuationRequest/ValuationRequestManage?id={masterInvoice.ValuationRequestId}");

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
                if (masterInvoice.TransactionModeId == 1)
                {
                    masterInvoice.TransactionStatusId = masterInvoice.CashTransactionStatusId ?? 0;
                    masterInvoice.TransactionDate = masterInvoice.CashTransactionDate;
                    masterInvoice.Amount = masterInvoice.CashAmount ?? 0;
                }
                else if (masterInvoice.TransactionModeId == 2)
                {
                    masterInvoice.TransactionStatusId = masterInvoice.ChequeTransactionStatusId ?? 0;
                    masterInvoice.TransactionDate = masterInvoice.ChequeTransactionDate;
                    masterInvoice.Amount = masterInvoice.ChequeAmount ?? 0;
                }
                else if (masterInvoice.TransactionModeId == 3)
                {
                    masterInvoice.TransactionStatusId = masterInvoice.CardTransactionStatusId ?? 0;
                    masterInvoice.TransactionDate = masterInvoice.CardTransactionDate;
                    masterInvoice.Amount = masterInvoice.CardAmount ?? 0;
                    masterInvoice.TransactionId = masterInvoice.CardTransactionId;
                }
                else if (masterInvoice.TransactionModeId == 4)
                {
                    masterInvoice.TransactionStatusId = masterInvoice.BankTransactionStatusId ?? 0;
                    masterInvoice.TransactionDate = masterInvoice.BankTransactionDate;
                    masterInvoice.Amount = masterInvoice.BankAmount ?? 0;
                    masterInvoice.TransactionId = masterInvoice.BankTransactionId;
                }

                //Fill audit logs field
                if (masterInvoice.Id == 0)
                    masterInvoice.CreatedBy = _helper.GetLoggedInUserId();
                masterInvoice.ModifiedBy = _helper.GetLoggedInUserId();

                if (masterInvoice.Document != null && masterInvoice.Document.Files != null)
                {
                    List<MasterDocumentModel> docs = _helper.FileUpload(masterInvoice.Document);
                    masterInvoice.uploadDocument = docs;
                    masterInvoice.Document = null;
                }


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
            return Redirect($"/ValuationRequest/ValuationRequestManage?id={masterInvoice.ValuationRequestId}"); 
        }


        [HttpPost]
        [Route("ValuationRequest/UpdateRequestStatus")]
        public IActionResult UpdateRequestStatus(int id, ValutionRequestStatusChangeModel appoveRequestModel)
        {
            try
            {
                HttpContext.Request.Cookies.TryGetValue(UserHelper.EltizamToken, out string token);
                APIRepository objapi = new(_cofiguration);

                ValutionRequestStatusChangeModel valuationRequestModelNew = new ValutionRequestStatusChangeModel();
                valuationRequestModelNew.Id = id;
                valuationRequestModelNew.StatusId = appoveRequestModel.StatusId;
                valuationRequestModelNew.ApproverComment = appoveRequestModel.ApproverComment;

                HttpResponseMessage responseMessage = objapi.APICommunication(APIURLHelper.UpdateRequestStatus, HttpMethod.Post, token, new StringContent(JsonConvert.SerializeObject(valuationRequestModelNew))).Result;

                if (responseMessage.IsSuccessStatusCode)
                {
                    TempData[UserHelper.SuccessMessage] = Convert.ToString(_stringLocalizerShared["RecordInsertUpdate"]);
                    string jsonResponse = responseMessage.Content.ReadAsStringAsync().Result;
                    ModelState.Clear();
                    return RedirectToAction(nameof(ValuationRequests));
                }
                else
                    TempData[UserHelper.ErrorMessage] = Convert.ToString(_stringLocalizerShared["Error"]);
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
                    List<MasterDocumentModel> docs = _helper.FileUpload(valuationAssesment.SiteDescription.Document);
                    valuationAssesment.SiteDescription.uploadDocument = docs;
                    valuationAssesment.SiteDescription.Document = null;
                }
                if (valuationAssesment.comparableEvidenceModel.Document != null && valuationAssesment.comparableEvidenceModel.Document.Files != null)
                {
                    List<MasterDocumentModel> docs = _helper.FileUpload(valuationAssesment.comparableEvidenceModel.Document);
                    valuationAssesment.comparableEvidenceModel.uploadDocument = docs;
                    valuationAssesment.comparableEvidenceModel.Document = null;
                }
                if (valuationAssesment.valuationAssessementModel.Document != null && valuationAssesment.valuationAssessementModel.Document.Files != null)
                {
                    List<MasterDocumentModel> docs = _helper.FileUpload(valuationAssesment.valuationAssessementModel.Document);
                    valuationAssesment.valuationAssessementModel.uploadDocument = docs;
                    valuationAssesment.valuationAssessementModel.Document = null;
                }
                int roleId = _helper.GetLoggedInRoleId();

                if (!string.IsNullOrWhiteSpace(CheckUserEditable(requestId, roleId)))
                    return Redirect($"/ValuationRequest/ValuationRequestManage?id={requestId}");

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
        }

        [HttpPost]
        [Route("ValuationRequest/ValuationDocumentUpload")]
        public IActionResult ValuationDocumentUpload(int id, ValuationDocumentModel valuationDocument)
        {
            try
            {
                //Check permissions for Get
                var action = id == null ? PermissionEnum.Add : PermissionEnum.Edit;
                var requestId = id;
                valuationDocument.ValuationRequestId = requestId;
                if (valuationDocument.Document != null && valuationDocument.Document.Files != null)
                {
                    List<MasterDocumentModel> docs = _helper.FileUpload(valuationDocument.Document);
                    valuationDocument.uploadDocument = docs;
                    valuationDocument.Document = null;
                }
                int roleId = _helper.GetLoggedInRoleId();

                if (!CheckRoleAccess(ModulePermissionEnum.ValuationRequest, action, roleId))
                    return RedirectToAction(AppConstants.AccessRestriction, AppConstants.Home);
                valuationDocument.CreatedBy = _helper.GetLoggedInUserId();
                HttpContext.Request.Cookies.TryGetValue(UserHelper.EltizamToken, out string token);
                APIRepository objapi = new(_cofiguration);

                HttpResponseMessage responseMessage = objapi.APICommunication(APIURLHelper.ValuationDocument, HttpMethod.Post, token, new StringContent(JsonConvert.SerializeObject(valuationDocument))).Result;

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
            return Redirect($"/ValuationRequest/ValuationRequestManage?id={valuationDocument.ValuationRequestId}");
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

        //private List<MasterDocumentModel> FileUpload(DocumentFilesModel document)
        //{
        //    List<MasterDocumentModel> uploadFiles = new List<MasterDocumentModel>();

        //    if (document.Files == null || document.Files.Count == 0)
        //    {
        //        throw new ArgumentException("No files were uploaded.");
        //    }

        //    foreach (var file in document.Files)
        //    {
        //        if (file == null || file.Length == 0)
        //        {
        //            continue;
        //        }

        //        var fileName = Guid.NewGuid().ToString() + Path.GetExtension(file.FileName);
        //        var docName = Path.GetFileNameWithoutExtension(file.FileName);
        //        var filePath = Path.Combine("wwwroot/Uploads", fileName);
        //        filePath = filePath.Replace("\\", "/");

        //        using (var stream = new FileStream(filePath, FileMode.Create))
        //        {
        //            // Use synchronous copy operation
        //            file.CopyTo(stream);
        //        }

        //        var upload = new MasterDocumentModel
        //        {
        //            FileName = fileName,
        //            FilePath = filePath.Replace("wwwroot", ".."),
        //            DocumentName = docName,
        //            IsActive = true,
        //            FileType = GetFileType(file.ContentType),
        //            CreatedDate = null,
        //            CreatedName = ""
        //        };

        //        uploadFiles.Add(upload);
        //    }

        //    return uploadFiles;
        //}


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
        //private string GetFileType(string contentType)
        //{
        //    switch (contentType)
        //    {
        //        case "image/jpeg":
        //        case "image/png":
        //            return "Image";
        //        case "application/msword":
        //            return "Word";
        //        case "application/pdf":
        //            return "PDF";
        //        default:
        //            return "Unknown";
        //    }
        //}

        private string CheckUserEditable(int? id, int roleId)
        {
            string? msg = null;
            ViewBag.IsEditAllowed = 1;

            if (id > 0)
            {
                HttpContext.Request.Cookies.TryGetValue(UserHelper.EltizamToken, out string token);
                APIRepository objapi = new(_cofiguration);
                HttpResponseMessage responseMessage = objapi.APICommunication(APIURLHelper.ValuationEditable + "?ValReqId=" + id + "&RoleId=" + roleId, HttpMethod.Get, token).Result;


                if (responseMessage.IsSuccessStatusCode)
                {
                    string jsonResponse = responseMessage.Content.ReadAsStringAsync().Result;
                    var data = JsonConvert.DeserializeObject<APIResponseEntity<ValuationEditableModel>>(jsonResponse);

                    msg = data?._object.EditError;
                    if (!string.IsNullOrWhiteSpace(msg))
                    {
                        TempData[UserHelper.ErrorMessage] = msg;
                        ViewBag.IsEditAllowed = 0;
                    }
                }
            }

            return msg;
        }
    }
}


