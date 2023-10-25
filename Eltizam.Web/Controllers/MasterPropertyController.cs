using Eltizam.Business.Models;
using Eltizam.Data.DataAccess.Entity;
using Eltizam.Resource;
using Eltizam.Web.Helpers;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.Extensions.Localization;
using Microsoft.Owin.BuilderProperties;
using Newtonsoft.Json;

namespace EltizamValuation.Web.Controllers
{
    public class MasterPropertyController : Controller
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
            MasterPropertyModel masterProperty;
            if (id == null || id <= 0)
            {
                masterProperty = new MasterPropertyModel();
                //masterProperty.AmenityList = 
                HttpContext.Request.Cookies.TryGetValue(UserHelper.EltizamToken, out string token);
                APIRepository objapi = new(_cofiguration);
                HttpResponseMessage responseMessage = objapi.APICommunication(APIURLHelper.GetPropertyAmenityList, HttpMethod.Get, token).Result;
                if (responseMessage.IsSuccessStatusCode)
                {
                    string jsonResponse = responseMessage.Content.ReadAsStringAsync().Result;
                    var data = JsonConvert.DeserializeObject<List<MasterAmenityListModel>>(jsonResponse);
                    if (data is null)
                        return NotFound();
                    masterProperty.AmenityList = data;
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
                HttpContext.Request.Cookies.TryGetValue(UserHelper.EltizamToken, out string token);
                APIRepository objapi = new(_cofiguration);

                HttpResponseMessage responseMessage = objapi.APICommunication(APIURLHelper.UpsertProperty, HttpMethod.Post, token, new StringContent(JsonConvert.SerializeObject(masterProperty))).Result;

                if (responseMessage.IsSuccessStatusCode)
                {
                    string jsonResponse = responseMessage.Content.ReadAsStringAsync().Result;
                    TempData[UserHelper.SuccessMessage] = Convert.ToString(_stringLocalizerShared["RecordInsertUpdate"]);

                    return RedirectToAction("Properties");
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
                    if (data._object is null)
                        return NotFound();

                    return View(data._object);
                }
                return NotFound();
            }
        }

    }
}
