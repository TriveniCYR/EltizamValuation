using Eltizam.Business.Models;
using Eltizam.Data.DataAccess.Entity;
using Eltizam.Data.DataAccess.Helper;
using Eltizam.Resource;
using Eltizam.Utility.Enums;
using Eltizam.Web.Controllers;
using Eltizam.Web.Helpers;
using Microsoft.AspNet.SignalR;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.Extensions.Localization;
using Microsoft.Owin.BuilderProperties;
using Newtonsoft.Json;

namespace EltizamValuation.Web.Controllers
{
    public class MasterPropertyController : BaseController
    {
        #region Properties

        private readonly IConfiguration _cofiguration;
        private readonly IStringLocalizer<Shared> _stringLocalizerShared;
        private readonly IHelper _helper;

        #endregion Properties

        public MasterPropertyController(IConfiguration configuration, IStringLocalizer<Shared> stringLocalizerShared, IHelper helper)
        {
            _cofiguration = configuration;
            _stringLocalizerShared = stringLocalizerShared;
            _helper = helper;
        }
        public IActionResult Properties()
        {
            try
            {
                //Check permissions
                int roleId = _helper.GetLoggedInRoleId();
                if (!CheckRoleAccess(ModulePermissionEnum.PropertyMaster, PermissionEnum.View, roleId))
                    return RedirectToAction(AppConstants.AccessRestriction, AppConstants.Home);
                return View();
            }
            catch (Exception e)
            {
                _helper.LogExceptions(e);
                ViewBag.errormessage = Convert.ToString(e.StackTrace);
                return View("Login");
            }
        }

        [HttpGet]
        public IActionResult PropertyManage(int? id)
        {
            //Check permissions for Get
            var action = id == null ? PermissionEnum.Add : PermissionEnum.Edit;
            int roleId = _helper.GetLoggedInRoleId();

            if (!CheckRoleAccess(ModulePermissionEnum.PropertyMaster, action, roleId))
                return RedirectToAction(AppConstants.AccessRestriction, AppConstants.Home);
            MasterPropertyModel masterProperty;
            if (id == null || id <= 0)
            {
                masterProperty = new MasterPropertyModel();
                masterProperty.IsActive = true;
                //masterProperty.AmenityList = 
                HttpContext.Request.Cookies.TryGetValue(UserHelper.EltizamToken, out string token);
                APIRepository objapi = new(_cofiguration);
                HttpResponseMessage responseMessage = objapi.APICommunication(APIURLHelper.GetPropertyAmenityList, HttpMethod.Get, token).Result;
                if (responseMessage.IsSuccessStatusCode)
                {
                    string jsonResponse = responseMessage.Content.ReadAsStringAsync().Result;
                    var data = JsonConvert.DeserializeObject<List<MasterAmenityListModel>>(jsonResponse);

                    //Get Footer info
                    FooterInfo(TableNameEnum.Master_Property, _cofiguration, id); 

                    if (data is null)
                        return NotFound();

                    masterProperty.AmenityList = data;
                    masterProperty.IsActive = true;
                }
                return View(masterProperty);
            }
            else
            {
                HttpContext.Request.Cookies.TryGetValue(UserHelper.EltizamToken, out string token);
                APIRepository objapi = new(_cofiguration);
                HttpResponseMessage responseMessage = objapi.APICommunication(APIURLHelper.GetPropertyById + "/" + id, HttpMethod.Get, token).Result;

                if (responseMessage.IsSuccessStatusCode)
                {
                    string jsonResponse = responseMessage.Content.ReadAsStringAsync().Result;
                    var data = JsonConvert.DeserializeObject<APIResponseEntity<MasterPropertyModel>>(jsonResponse);
                    //Get Footer info
                    FooterInfo(TableNameEnum.Master_Property, _cofiguration, id);

                    if (data._object is null)
                        return NotFound();
                    return View(data._object);
                }
                return NotFound();
            }
        }

        [HttpPost]
        public IActionResult PropertyManage(int id, MasterPropertyModel masterProperty)
        {
            try
            {
                //Check permissions for Get
                var action = masterProperty.Id == 0 ? PermissionEnum.Add : PermissionEnum.Edit;

                int roleId = _helper.GetLoggedInRoleId();
                if (!CheckRoleAccess(ModulePermissionEnum.PropertyMaster, action, roleId))
                    return RedirectToAction(AppConstants.AccessRestriction, AppConstants.Home);

                //Do fill audit fields
                if (masterProperty.Id == 0)
                    masterProperty.CreatedBy = _helper.GetLoggedInUserId();
                masterProperty.ModifiedBy = _helper.GetLoggedInUserId();

                masterProperty.PropertySubTypeId = masterProperty.PropertySubTypeId == 0 ? null : masterProperty.PropertySubTypeId;
                masterProperty.FurnishedId   = masterProperty.FurnishedId == 0 ? null : masterProperty.FurnishedId;

                HttpContext.Request.Cookies.TryGetValue(UserHelper.EltizamToken, out string token);
                APIRepository objapi = new(_cofiguration);

                HttpResponseMessage responseMessage = objapi.APICommunication(APIURLHelper.UpsertProperty, HttpMethod.Post, token, new StringContent(JsonConvert.SerializeObject(masterProperty))).Result;

                if (responseMessage.IsSuccessStatusCode && masterProperty.Id==0)
                {
                    string jsonResponse = responseMessage.Content.ReadAsStringAsync().Result;
                    TempData[UserHelper.SuccessMessage] = Convert.ToString(_stringLocalizerShared["RecordInsertUpdate"]);

                    return RedirectToAction("Properties");
                }
                if (responseMessage.IsSuccessStatusCode)
                {
                    string jsonResponse = responseMessage.Content.ReadAsStringAsync().Result;
                    TempData[UserHelper.SuccessMessage] = Convert.ToString(_stringLocalizerShared["RecordInsertUpdate"]);

                    return Redirect($"/MasterProperty/PropertyManage?id={masterProperty.Id}");
                }
                else
                {
                    TempData[UserHelper.ErrorMessage] = Convert.ToString(responseMessage.Content.ReadAsStringAsync().Result);
                    return RedirectToAction("PropertyManage", new { id = masterProperty.Id });
                }
            }
            catch (Exception e)
            {
                _helper.LogExceptions(e);
                TempData[UserHelper.ErrorMessage] = Convert.ToString(e.StackTrace);
                return RedirectToAction("PropertyManage", new { Id = masterProperty.Id });
            }
        }

        [HttpGet]
        [Route("MasterProperty/PropertyDetail")]
        public IActionResult PropertyDetail(int? id)
        {

            //Check permissions for Get
            var action = id == null ? PermissionEnum.Edit : PermissionEnum.View;

            int roleId = _helper.GetLoggedInRoleId();
            if (!CheckRoleAccess(ModulePermissionEnum.PropertyMaster, action, roleId))
                return RedirectToAction(AppConstants.AccessRestriction, AppConstants.Home);

            MasterPropertyModel masterProperty;
            if (id == null || id <= 0)
            {
                masterProperty = new MasterPropertyModel();
                return RedirectToAction("Properties");
            }
            else
            {
                HttpContext.Request.Cookies.TryGetValue(UserHelper.EltizamToken, out string token);
                APIRepository objapi = new(_cofiguration);
                HttpResponseMessage responseMessage = objapi.APICommunication(APIURLHelper.GetPropertyById + "/" + id, HttpMethod.Get, token).Result;

                if (responseMessage.IsSuccessStatusCode)
                {
                    string jsonResponse = responseMessage.Content.ReadAsStringAsync().Result;
                    var data = JsonConvert.DeserializeObject<APIResponseEntity<MasterPropertyModel>>(jsonResponse);
                    
                    //Get Footer info
                    FooterInfo(TableNameEnum.Master_Property, _cofiguration, id, true);
                   

                    return View(data._object);
                }
                return NotFound();
            }
        }

    }
}
