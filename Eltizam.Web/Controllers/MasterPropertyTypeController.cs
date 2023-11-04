using Eltizam.Business.Models;
using Eltizam.Data.DataAccess.Entity;
using Eltizam.Data.DataAccess.Helper;
using Eltizam.Resource;
using Eltizam.Utility.Enums;
using Eltizam.Utility.Models;
using Eltizam.Utility.Utility;
using Eltizam.Web.Helpers;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Localization;
using Newtonsoft.Json;
using System.Net;

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
        [Route("MasterPropertyType/PropertyTypes")]
        public IActionResult PropertyTypes()
        { 
            return View();
        }

        [HttpPost]
        [Route("MasterPropertyType/PropertyTypeManage")]
        public IActionResult PropertyTypeManage(int id, Master_PropertyTypeModel masterPropertyType)
        {
            try
            {
                HttpContext.Request.Cookies.TryGetValue(UserHelper.EltizamToken, out string token);
                APIRepository objapi = new(_cofiguration);

                HttpResponseMessage responseMessage = objapi.APICommunication(APIURLHelper.UpsertPropertyType, HttpMethod.Post, token, new StringContent(JsonConvert.SerializeObject(masterPropertyType))).Result;

                if (responseMessage.IsSuccessStatusCode)
                {
                    if (responseMessage.IsSuccessStatusCode)
                    {
                        string jsonResponse = responseMessage.Content.ReadAsStringAsync().Result;
                        TempData[UserHelper.SuccessMessage] = Convert.ToString(_stringLocalizerShared["RecordInsertUpdate"]);

                        return RedirectToAction("PropeprtyTypes");
                    }
                    else
                    {
                        TempData[UserHelper.ErrorMessage] = Convert.ToString(responseMessage.Content.ReadAsStringAsync().Result);  
                        return RedirectToAction("PropeprtyTypes");
                    }
                }
                return RedirectToAction("PropeprtyTypes");
            }

            catch (Exception e)
            {
                _helper.LogExceptions(e);
                TempData[UserHelper.SuccessMessage] = Convert.ToString(_stringLocalizerShared["RecordInsertUpdate"]);
                ModelState.Clear();
                return RedirectToAction("PropeprtyTypes");
            } 
        }

        [HttpGet]
      //  [Route(" MasterPropertyType/PropertyTypeManage")]
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
             
                HttpResponseMessage responseMessage = objapi.APICommunication(APIURLHelper.GetPropertyTypeById + "/" + id, HttpMethod.Get, token).Result;

                if (responseMessage.IsSuccessStatusCode)
                {
                    string jsonResponse = responseMessage.Content.ReadAsStringAsync().Result;
                    var data = JsonConvert.DeserializeObject<APIResponseEntity<Master_PropertyTypeModel>>(jsonResponse);

                    //Get FooterInfo
                    var url = string.Format("{0}/{1}/{2}", APIURLHelper.GetFooterDetails, id, TableName.Master_PropertyType);
                    var footerRes = objapi.APICommunication(url, HttpMethod.Get, token).Result;
                    if (footerRes.IsSuccessStatusCode)
                    {
                        string json = footerRes.Content.ReadAsStringAsync().Result;
                        ViewBag.FooterInfo = JsonConvert.DeserializeObject<FooterDetails>(json);
                    }

                    //if (data._object is null)
                    //    return NotFound();

                    return View("PropertyTypeManage", data._object);
                }
                return NotFound();
            }
        }

        [HttpGet] 
        public IActionResult PropertyTypeDetail(int? id)
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

                HttpResponseMessage responseMessage = objapi.APICommunication(APIURLHelper.GetPropertyTypeById + "/" + id, HttpMethod.Get, token).Result;

                if (responseMessage.IsSuccessStatusCode)
                {
                    string jsonResponse = responseMessage.Content.ReadAsStringAsync().Result;
                    var data = JsonConvert.DeserializeObject<APIResponseEntity<Master_PropertyTypeModel>>(jsonResponse);
                    if (data._object is null)
                        return NotFound();

                    return View("PropertyTypeDetail", data._object);
                }
                return NotFound();
            }
        }

        [HttpGet]
        [Route("CheckPropertTypeExists")]
        public IActionResult CheckPropertTypeExists(string PropertyType)
        {
            try
            {
                HttpContext.Request.Cookies.TryGetValue(UserHelper.EltizamToken, out string token);
                APIRepository objapi = new(_cofiguration);

                HttpResponseMessage responseMessage = objapi.APICommunication(APIURLHelper.CheckPropertyTypeExists + "?PropertyType=" + PropertyType, HttpMethod.Get, token).Result;

                if (responseMessage.IsSuccessStatusCode)
                {
                    if (responseMessage.IsSuccessStatusCode)
                    {
                        string jsonResponse = responseMessage.Content.ReadAsStringAsync().Result;
                        TempData[UserHelper.SuccessMessage] = Convert.ToString(_stringLocalizerShared["RecordInsertUpdate"]); 
                    }
                    else
                    {
                        TempData[UserHelper.ErrorMessage] = Convert.ToString(responseMessage.Content.ReadAsStringAsync().Result); 
                    }
                }

                return null;
            } 
            catch (Exception e)
            {
                return null;
            }
        }

    }
}
