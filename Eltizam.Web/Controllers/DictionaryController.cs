using Eltizam.Business.Models;
using Eltizam.Data.DataAccess.Entity;
using Eltizam.Resource;
using Eltizam.Web.Helpers;
using Microsoft.AspNet.SignalR.Hubs;
using Microsoft.AspNetCore.Mvc;
using Microsoft.CodeAnalysis;
using Microsoft.CodeAnalysis.CSharp.Syntax;
using Microsoft.Extensions.Localization;
using Newtonsoft.Json;

namespace EltizamValuation.Web.Controllers
{
    public class DictionaryController : Controller
    {
        #region Properties

        private readonly IConfiguration _cofiguration;
        private readonly IStringLocalizer<Shared> _stringLocalizerShared;
        private readonly IHelper _helper;

        #endregion Properties
        public DictionaryController(IConfiguration configuration, IStringLocalizer<Shared> stringLocalizerShared, IHelper helper)
        {
            _cofiguration = configuration;
            _stringLocalizerShared = stringLocalizerShared;
            _helper = helper;
        }
        public IActionResult Dictionary()
        {
            ModelState.Clear();
            try
            {
                HttpContext.Request.Cookies.TryGetValue(UserHelper.EltizamToken, out string token);
                APIRepository objapi = new APIRepository(_cofiguration);
                //List<MasterDictionaryEntity> oLocationList = new List<MasterDictionaryEntity>();
                //HttpResponseMessage responseMessage = objapi.APICommunication(APIURLHelper.GetAllDictionary, HttpMethod.Post, token).Result;
                //if (responseMessage.IsSuccessStatusCode)
                //{
                //    string jsonResponse = responseMessage.Content.ReadAsStringAsync().Result;
                //  //  var data = JsonConvert.DeserializeObject<APIResponseEntity<List<MasterDictionaryEntity>>>(jsonResponse);
                //    var data = JsonConvert.DeserializeObject<MasterDictionaryList>(jsonResponse);               
                //    ViewData["locationList"] = oLocationList;
                return View();
                //  return View(oLocationListRoot);
                //}
            }
            catch (Exception e)
            {
                _helper.LogExceptions(e);
                ViewBag.errormessage = Convert.ToString(e.StackTrace);
                return View("Login");
            }
            return View();
        }
        public IActionResult DictionaryAllManage(int id, string? description)
        {
            //id = 3; description = "ValuationType";
            MasterDictionaryDetailById masterdictionary;
            if (id == null || id <= 0)
            {
                masterdictionary = new MasterDictionaryDetailById();

                return View(masterdictionary);
            }
            else
            {
                HttpContext.Request.Cookies.TryGetValue(UserHelper.EltizamToken, out string token);
                APIRepository objapi = new(_cofiguration);
                string urlHelper = string.Empty;
                if (!string.IsNullOrEmpty(description))
                {
                    urlHelper = APIURLHelper.GetDictionaryById + "/" + id + "/" + description;
                }
                else { urlHelper = APIURLHelper.GetDictionaryById + "/" + id; }
                HttpResponseMessage responseMessage = objapi.APICommunication(urlHelper, HttpMethod.Get, token).Result;

                if (responseMessage.IsSuccessStatusCode)
                {
                    string jsonResponse = responseMessage.Content.ReadAsStringAsync().Result;
                    var data = JsonConvert.DeserializeObject<List<MasterDictionaryDetailById>>(jsonResponse);
                    if (data is null)
                        return NotFound();
                    ViewData["ChildDictList"] = data;
                    ModelState.Clear();
                    // ViewBag.IsView = Isview;
                    // return View(data);
                    return View();
                }
                return NotFound();
            }
        }

        [HttpPost]
        public IActionResult DictionaryAllManage(int? id, MasterDictionaryDetailById masterdictionary)
        {
            try
            {

                masterdictionary.DictionaryId = 3;// id;
                HttpContext.Request.Cookies.TryGetValue(UserHelper.EltizamToken, out string token);
                APIRepository objapi = new(_cofiguration);

                HttpResponseMessage responseMessage = objapi.APICommunication(APIURLHelper.UpsertDictionary, HttpMethod.Post, token, new StringContent(JsonConvert.SerializeObject(masterdictionary))).Result;

                if (responseMessage.IsSuccessStatusCode)
                {
                    string jsonResponse = responseMessage.Content.ReadAsStringAsync().Result;
                    TempData[UserHelper.SuccessMessage] = Convert.ToString(_stringLocalizerShared["RecordInsertUpdate"]);

                    return RedirectToAction(nameof(DictionaryAllManage));
                }
                else
                {
                    TempData[UserHelper.ErrorMessage] = Convert.ToString(responseMessage.Content.ReadAsStringAsync().Result);
                    return RedirectToAction("DictionaryAllManage", new { id = masterdictionary.Id });
                }
            }
            catch (Exception e)
            {
                _helper.LogExceptions(e);
                TempData[UserHelper.ErrorMessage] = Convert.ToString(e.StackTrace);
                return RedirectToAction("DictionaryAllManage", new { Id = masterdictionary.Id });
            }
        }
    }
}
