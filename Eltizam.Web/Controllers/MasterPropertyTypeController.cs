using Eltizam.Business.Models;
using Eltizam.Data.DataAccess.Entity;
using Eltizam.Resource;
using Eltizam.Utility.Enums;
using Eltizam.Utility.Models;
using Eltizam.Utility.Utility;
using Eltizam.Web.Helpers;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Localization;
using Newtonsoft.Json;

namespace EltizamValuation.Web.Controllers
{
    public class MasterPropertyTypeController : Controller
    {

        #region Properties

        private readonly IConfiguration _cofiguration;
        private readonly IStringLocalizer<Shared> _stringLocalizerShared;
        private readonly IHelper _helper;

        #endregion Properties

        public MasterPropertyTypeController(IConfiguration configuration, IStringLocalizer<Shared> stringLocalizerShared, IHelper helper)
        {
            _cofiguration = configuration;
            _stringLocalizerShared = stringLocalizerShared;
            _helper = helper;
        }

        [HttpGet]
        [Route(" MasterPropertyType/PropertyTypes")]
        public IActionResult PropertyTypes()
        {
            //ModelState.Clear();
            //try
            //{
            //    int rolId = _helper.GetLoggedInRoleId();
            //    RolePermissionModel objPermssion = UtilityHelper.GetCntrActionAccess((int)ModulePermissionEnum.RoleMaster, rolId);
            //    ViewBag._objPermission = objPermssion;
            //    HttpContext.Request.Cookies.TryGetValue(UserHelper.EltizamToken, out string token);
            //    APIRepository objapi = new APIRepository(_cofiguration);
            //    List<Master_PropertyTypeModel> oPropertyTypeList = new List<Master_PropertyTypeModel>();
            //    HttpResponseMessage responseMessage = objapi.APICommunication(APIURLHelper.GetAllProperty, HttpMethod.Get, token).Result;
               
            //    if (responseMessage.IsSuccessStatusCode)
            //    {
            //        string jsonResponse = responseMessage.Content.ReadAsStringAsync().Result;
            //        var data = JsonConvert.DeserializeObject<APIResponseEntity<List<Master_PropertyTypeModel>>>(jsonResponse);
            //        oPropertyTypeList = data._object;

            //        return View(oPropertyTypeList);
            //    }
            //}
            //catch (Exception e)
            //{
            //    _helper.LogExceptions(e);
            //    ViewBag.errormessage = Convert.ToString(e.StackTrace);
            //    return View("Login");
            //}
            return View();
        }

        [HttpPost]
        [Route(" MasterPropertyType/PropertyTypeManage")]
        public IActionResult PropertyTypeManage(int id, Master_PropertyTypeModel masterPropertyType)
        {
            try
            {

                HttpContext.Request.Cookies.TryGetValue(UserHelper.EltizamToken, out string token);
                APIRepository objapi = new(_cofiguration);

                HttpResponseMessage responseMessage = objapi.APICommunication(APIURLHelper.UpsertProperty, HttpMethod.Post, token, new StringContent(JsonConvert.SerializeObject(masterPropertyType))).Result;

                if (responseMessage.IsSuccessStatusCode)
                {
                    TempData["StatusMessage"] = "Saved Successfully";
                    string jsonResponse = responseMessage.Content.ReadAsStringAsync().Result;
                    ModelState.Clear();
                    return RedirectToAction(nameof(PropertyType));
                }
                else
                    TempData["StatusMessage"] = "Some Eror Occured";
            }
            catch (Exception e)
            {
                _helper.LogExceptions(e);
                ViewBag.errormessage = Convert.ToString(e.StackTrace);
                ModelState.Clear();
                return View(nameof(PropertyType));
            }
            ModelState.Clear();
            return RedirectToAction(nameof(PropertyType));
        }

        [HttpGet]
        [Route(" MasterPropertyType/PropertyTypeManage")]
        public IActionResult PropertyTypeManage(int? id)
        {
            if (id != null)
            {
                ViewData["IsEdit"] = true;
            }

            Master_PropertyTypeModel masterPropertyType;
            if (id == null || id <= 0)
            {
                masterPropertyType = new Master_PropertyTypeModel();
                return View(masterPropertyType);
            }
            else
            {
                HttpContext.Request.Cookies.TryGetValue(UserHelper.EltizamToken, out string token);
                APIRepository objapi = new(_cofiguration);
                HttpResponseMessage responseMessage = objapi.APICommunication(APIURLHelper.GetPropertyById + "/" + id, HttpMethod.Get, token).Result;

                if (responseMessage.IsSuccessStatusCode)
                {
                    string jsonResponse = responseMessage.Content.ReadAsStringAsync().Result;
                    var data = JsonConvert.DeserializeObject<APIResponseEntity<Master_PropertyTypeModel>>(jsonResponse);
                    if (data._object is null)
                        return NotFound();

                    return View(data._object);
                }
                return NotFound();
            }
        }
    }
}
