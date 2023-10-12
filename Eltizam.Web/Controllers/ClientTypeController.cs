using Eltizam.Business.Models;
using Eltizam.Resource;
using Eltizam.Web.Helpers;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Localization;
using Newtonsoft.Json;

namespace EltizamValuation.Web.Controllers
{
    public class ClientTypeController : Controller
    {
        #region Properties

        private readonly IConfiguration _cofiguration;
        private readonly IStringLocalizer<Shared> _stringLocalizerShared;
        private readonly IHelper _helper;

        #endregion Properties

        public ClientTypeController(IConfiguration configuration, IStringLocalizer<Shared> stringLocalizerShared, IHelper helper)
        {
            _cofiguration = configuration;
            _stringLocalizerShared = stringLocalizerShared;
            _helper = helper;
        }
        public IActionResult ClientType()
        {
            try
            {
                HttpContext.Request.Cookies.TryGetValue(UserHelper.EltizamToken, out string token);
                APIRepository objapi = new APIRepository(_cofiguration);
                Master_ClientTypeModel oUserList = new Master_ClientTypeModel();
                //HttpResponseMessage responseMessage = objapi.APICommunication(APIURLHelper.GetAll, HttpMethod.Post, token).Result;
                //if (responseMessage.IsSuccessStatusCode)
                //{
                //    string jsonResponse = responseMessage.Content.ReadAsStringAsync().Result;
                //    var data = JsonConvert.DeserializeObject<APIResponseEntity<List<MasterUserModel>>>(jsonResponse);
                //    oUserList.Users = data._object;

                //    return View();
                //}
                return View();
            }
            catch (Exception e)
            {

                _helper.LogExceptions(e);
                ViewBag.errormessage = Convert.ToString(e.StackTrace);
                return View("Login");
            }
            return View();

        }

        public IActionResult ClientTypeManage(int? id)
        {
            Master_ClientTypeModel masterUser;
            if (id == null || id <= 0)
            {
                masterUser = new Master_ClientTypeModel();
                return View(masterUser);
            }
            else
            {
                HttpContext.Request.Cookies.TryGetValue(UserHelper.EltizamToken, out string token);
                APIRepository objapi = new(_cofiguration);
                HttpResponseMessage responseMessage = objapi.APICommunication(APIURLHelper.GetClientTypeById + "/" + id, HttpMethod.Get, token).Result;

                if (responseMessage.IsSuccessStatusCode)
                {
                    string jsonResponse = responseMessage.Content.ReadAsStringAsync().Result;
                    var data = JsonConvert.DeserializeObject<APIResponseEntity<Master_ClientTypeModel>>(jsonResponse);
                    if (data._object is null)
                        return NotFound();

                    return View(data._object);
                }
                return NotFound();
            }
        }
        [HttpPost,Route("ClientTypeManage")]
        public IActionResult ClientTypeManage(int id, Master_ClientTypeModel masterUser)
        {
            try
            {
                HttpContext.Request.Cookies.TryGetValue(UserHelper.EltizamToken, out string token);
                APIRepository objapi = new(_cofiguration);

                HttpResponseMessage responseMessage = objapi.APICommunication(APIURLHelper.UpsertClientType, HttpMethod.Post, token, new StringContent(JsonConvert.SerializeObject(masterUser))).Result;

                if (responseMessage.IsSuccessStatusCode)
                {
                    string jsonResponse = responseMessage.Content.ReadAsStringAsync().Result;
                    TempData[UserHelper.SuccessMessage] = Convert.ToString(_stringLocalizerShared["RecordInsertUpdate"]);

                    return RedirectToAction(nameof(ClientType));
                }
                else
                {
                    TempData[UserHelper.ErrorMessage] = Convert.ToString(responseMessage.Content.ReadAsStringAsync().Result);
                    return RedirectToAction("ClientType");
                }
            }
            catch (Exception e)
            {
                _helper.LogExceptions(e);
                TempData[UserHelper.ErrorMessage] = Convert.ToString(e.StackTrace);
                return RedirectToAction("ClientType");
            }
        }
    }
}
