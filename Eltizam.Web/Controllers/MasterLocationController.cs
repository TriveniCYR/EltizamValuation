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
    public class MasterLocationController : BaseController
    {
        #region Properties

        private readonly IConfiguration _cofiguration;
        private readonly IStringLocalizer<Shared> _stringLocalizerShared;
        private readonly IHelper _helper;

        #endregion Properties

        public MasterLocationController(IConfiguration configuration, IStringLocalizer<Shared> stringLocalizerShared, IHelper helper)
        {
            _cofiguration = configuration;
            _stringLocalizerShared = stringLocalizerShared;
            _helper = helper;
        }

        public IActionResult Locations()
        {
            ModelState.Clear();
            try
            {
                //Check permissions
                int roleId = _helper.GetLoggedInRoleId();
                if (!CheckRoleAccess(ModulePermissionEnum.UserMaster, PermissionEnum.View, roleId))
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



        public IActionResult LocationById(int id)
        {
            MasterLocationEntity masterlocation;

            //Check permissions for Get
            var action = id == null ? PermissionEnum.Add : PermissionEnum.Edit;
            int roleId = _helper.GetLoggedInRoleId();

            if (!CheckRoleAccess(ModulePermissionEnum.UserMaster, action, roleId))
                return RedirectToAction(AppConstants.AccessRestriction, AppConstants.Home);


            if (id == null || id <= 0)
            {
                masterlocation = new MasterLocationEntity();
                return View(masterlocation);
            }
            else
            {
                HttpContext.Request.Cookies.TryGetValue(UserHelper.EltizamToken, out string token);
                APIRepository objapi = new(_cofiguration);
                HttpResponseMessage responseMessage = objapi.APICommunication(APIURLHelper.GetLocationById + "/" + id, HttpMethod.Get, token).Result;

                if (responseMessage.IsSuccessStatusCode)
                {
                    string jsonResponse = responseMessage.Content.ReadAsStringAsync().Result;
                    var data = JsonConvert.DeserializeObject<APIResponseEntity<MasterLocationEntity>>(jsonResponse);

                    //Get Footer info
                    FooterInfo(TableNameEnum.Master_Location, _cofiguration, id);

                    //var url = string.Format("{0}/{1}/{2}", APIURLHelper.GetGlobalAuditFields, id, Enum.GetName(TableNameEnum.Master_Location));
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

        public IActionResult LocationManage(int? id, int Isview = 0)
        {
            MasterLocationEntity masterlocation;
            //Check permissions for Get
            var action = id == null ? PermissionEnum.Add : PermissionEnum.Edit;

            int roleId = _helper.GetLoggedInRoleId();
            if (!CheckRoleAccess(ModulePermissionEnum.UserMaster, action, roleId))
                return RedirectToAction(AppConstants.AccessRestriction, AppConstants.Home);

            if (id == null || id <= 0)
            {
                masterlocation = new MasterLocationEntity();
                ViewBag.IsView = Isview;
                return View(masterlocation);
            }
            else
            {
                HttpContext.Request.Cookies.TryGetValue(UserHelper.EltizamToken, out string token);
                APIRepository objapi = new(_cofiguration);
                HttpResponseMessage responseMessage = objapi.APICommunication(APIURLHelper.GetLocationById + "/" + id, HttpMethod.Get, token).Result;

                if (responseMessage.IsSuccessStatusCode)
                {
                    string jsonResponse = responseMessage.Content.ReadAsStringAsync().Result;
                    var data = JsonConvert.DeserializeObject<APIResponseEntity<MasterLocationEntity>>(jsonResponse);
                    if (data._object is null)
                        return NotFound();
                    ViewBag.IsView = Isview;
                    return View(data._object);
                }
                return NotFound();
            }
        }


        [HttpPost]
        public IActionResult LocationManage(int id, MasterLocationEntity masterlocation)
        {
            try
            {
                //Check permissions for Get
                var action = id == null ? PermissionEnum.Edit : PermissionEnum.Add;

                int roleId = _helper.GetLoggedInRoleId();
                if (!CheckRoleAccess(ModulePermissionEnum.UserMaster, action, roleId))
                    return RedirectToAction(AppConstants.AccessRestriction, AppConstants.Home);

                //Fill audit logs field
                if (masterlocation.Id == 0)
                    masterlocation.CreatedBy = _helper.GetLoggedInUserId();
                masterlocation.ModifiedBy = _helper.GetLoggedInUserId();

                HttpContext.Request.Cookies.TryGetValue(UserHelper.EltizamToken, out string token);
                APIRepository objapi = new(_cofiguration);

                HttpResponseMessage responseMessage = objapi.APICommunication(APIURLHelper.UpsertLocation, HttpMethod.Post, token, new StringContent(JsonConvert.SerializeObject(masterlocation))).Result;

                if (responseMessage.IsSuccessStatusCode)
                {
                    string jsonResponse = responseMessage.Content.ReadAsStringAsync().Result;
                    TempData[UserHelper.SuccessMessage] = Convert.ToString(_stringLocalizerShared["RecordInsertUpdate"]);

                    return RedirectToAction(nameof(Locations));
                }
                else
                {
                    TempData[UserHelper.ErrorMessage] = Convert.ToString(responseMessage.Content.ReadAsStringAsync().Result);
                    return RedirectToAction("LocationManage", new { id = masterlocation.Id });
                }
            }
            catch (Exception e)
            {
                _helper.LogExceptions(e);
                TempData[UserHelper.ErrorMessage] = Convert.ToString(e.StackTrace);
                return RedirectToAction("LocationManage", new { Id = masterlocation.Id });
            }
        }
    }
}
