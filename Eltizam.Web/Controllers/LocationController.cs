using Eltizam.Business.Models;
using Eltizam.Resource;
using Eltizam.Web.Controllers;
using Eltizam.Web.Helpers;
using Humanizer.Localisation;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Localization;
using Newtonsoft.Json;

namespace EltizamValuation.Web.Controllers
{
    public class LocationController : BaseController
    {
        #region Properties

        private readonly IConfiguration _cofiguration;
        private readonly IStringLocalizer<Shared> _stringLocalizerShared;
        private readonly IHelper _helper;

        #endregion Properties

        public LocationController(IConfiguration configuration, IStringLocalizer<Shared> stringLocalizerShared, IHelper helper)
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
                HttpContext.Request.Cookies.TryGetValue(UserHelper.EltizamToken, out string token);
                APIRepository objapi = new APIRepository(_cofiguration);
                List<MasterLocationEntity> oLocationList = new List<MasterLocationEntity>();
                HttpResponseMessage responseMessage = objapi.APICommunication(APIURLHelper.GetAllLocations, HttpMethod.Post, token).Result;
                if (responseMessage.IsSuccessStatusCode)
                {
                    string jsonResponse = responseMessage.Content.ReadAsStringAsync().Result;                    
                      //var data = JsonConvert.DeserializeObject<APIResponseEntity<List<MasterLocationEntity>>>(jsonResponse);
                     var data = JsonConvert.DeserializeObject<MasterLocationList>(jsonResponse);
                    //MasterLocationList oLocationListRoot =data;
                    oLocationList = data.data;
                    ViewData["locationList"] = oLocationList;
                    return View();
                  //  return View(oLocationListRoot);
                }
            }
            catch (Exception e)
            {
                _helper.LogExceptions(e);
                ViewBag.errormessage = Convert.ToString(e.StackTrace);
                return View("Login");
            }
            return View();
        }
        //public IActionResult LocationManage(int? id)
        //{
        //    MasterLocationEntity masterlocation;
        //    if (id == null || id <= 0)
        //    {
        //        masterlocation = new MasterLocationEntity();
        //        return View(masterlocation);
        //    }
        //    else
        //    {
        //        HttpContext.Request.Cookies.TryGetValue(UserHelper.EltizamToken, out string token);
        //        APIRepository objapi = new(_cofiguration);
        //        HttpResponseMessage responseMessage = objapi.APICommunication(APIURLHelper.GetUserById + "/" + id, HttpMethod.Get, token).Result;

        //        if (responseMessage.IsSuccessStatusCode)
        //        {
        //            string jsonResponse = responseMessage.Content.ReadAsStringAsync().Result;
        //            var data = JsonConvert.DeserializeObject<APIResponseEntity<MasterLocationEntity>>(jsonResponse);
        //            if (data._object is null)
        //                return NotFound();

        //            return View(data._object);
        //        }
        //        return NotFound();
        //    }
        //}

        
        //    public IActionResult LocationById(int id)
        //{

        //    MasterLocationEntity masterlocation;
        //    if (id == null || id <= 0)
        //    {
        //        masterlocation = new MasterLocationEntity();
        //        return View(masterlocation);
        //    }
        //    else
        //    {
        //        HttpContext.Request.Cookies.TryGetValue(UserHelper.EltizamToken, out string token);
        //        APIRepository objapi = new(_cofiguration);
        //        HttpResponseMessage responseMessage = objapi.APICommunication(APIURLHelper.GetLocationById + "/" + id, HttpMethod.Get, token).Result;

        //        if (responseMessage.IsSuccessStatusCode)
        //        {
        //            string jsonResponse = responseMessage.Content.ReadAsStringAsync().Result;
        //            var data = JsonConvert.DeserializeObject<APIResponseEntity<MasterLocationEntity>>(jsonResponse);
        //            if (data._object is null)
        //                return NotFound();

        //            return View(data._object);
        //        }
        //        return NotFound();
        //    }
        //}
            
                [HttpPost]
        public IActionResult LocationManage(int id, MasterLocationEntity masterlocation)
        {
            try
            {
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
