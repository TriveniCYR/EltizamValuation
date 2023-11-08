using Eltizam.Business.Models;
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
        {  //Check permissions
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
            {
               
                ViewData["IsEdit"] = true;
            }

            if (view != null)
            {
                ViewData["IsView"] = true;
            }
            ValuationRequestModel valuationRequestModel;
            if (id == null || id <= 0)
            {
                ViewBag.CurrentUserId = _helper.GetLoggedInUserId();
                
                valuationRequestModel = new ValuationRequestModel();
                valuationRequestModel.ReferenceNo = "123";
               // Master_PropertyTypeModel master_PropertyType = new Master_PropertyTypeModel();
                //valuationRequestModel.master_PropertyType = master_PropertyType;


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

                    //var url = string.Format("{0}/{1}/{2}", APIURLHelper.GetGlobalAuditFields, id, Enum.GetName(TableNameEnum.ValuationRequest));
                    //var footerRes = objapi.APICommunication(url, HttpMethod.Get, token).Result;
                    //if (footerRes.IsSuccessStatusCode)
                    //{
                    //    string json = footerRes.Content.ReadAsStringAsync().Result;
                    //    ViewBag.FooterInfo = JsonConvert.DeserializeObject<GlobalAuditFields>(json);
                    //} 

                    if (data._object is null)
                        return NotFound();

                    return View(data._object);
                }
                return NotFound();
            }
        }

        [HttpPost]
        [Route("ValuationRequest/ValuationRequestManage")]
        public IActionResult ValuationRequest(int id, ValuationRequestModel valuationRequestModel)
        {
            try
            {
                HttpContext.Request.Cookies.TryGetValue(UserHelper.EltizamToken, out string token);
                APIRepository objapi = new(_cofiguration);

                ValuationRequestModel valuationRequestModelNew = new ValuationRequestModel();
                valuationRequestModelNew.Id = id;
                valuationRequestModelNew.ApproverId = valuationRequestModel.ApproverId;
                valuationRequestModelNew.ValuerId = valuationRequestModel.ValuerId;
                valuationRequestModelNew.ValuationModeId = valuationRequestModel.ValuationModeId;
                valuationRequestModelNew.ValuationTimeFrame = valuationRequestModel.ValuationTimeFrame;
                valuationRequestModelNew.ValuationDate = valuationRequestModel.ValuationDate;
                valuationRequestModelNew.StatusId = valuationRequestModel.StatusId;
                valuationRequestModelNew.PropertyId = valuationRequestModel.PropertyId;
                valuationRequestModelNew.ClientId = valuationRequestModel.ClientId;
                valuationRequestModelNew.ReferenceNo = "123";
                valuationRequestModelNew.OtherReferenceNo = valuationRequestModel.OtherReferenceNo;
                //valuationRequestModelNew.ValuationDate = valuationRequestModel.ValuationDate;
                HttpResponseMessage responseMessage = objapi.APICommunication(APIURLHelper.UpsertValuationRequest, HttpMethod.Post, token, new StringContent(JsonConvert.SerializeObject(valuationRequestModelNew))).Result;

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

    }
}
