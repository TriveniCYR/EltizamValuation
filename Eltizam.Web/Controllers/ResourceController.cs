using Eltizam.Business.Models;
using Eltizam.Resource;
using Eltizam.Web.Helpers;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.Extensions.Localization;
using Newtonsoft.Json;

namespace EltizamValuation.Web.Controllers
{
    public class ResourceController : Controller
    {
        #region Properties

        private readonly IConfiguration _cofiguration;
        private readonly IStringLocalizer<Shared> _stringLocalizerShared;
        private readonly IHelper _helper;

        #endregion Properties

        public ResourceController(IConfiguration configuration, IStringLocalizer<Shared> stringLocalizerShared, IHelper helper)
        {
            _cofiguration = configuration;
            _stringLocalizerShared = stringLocalizerShared;
            _helper = helper;
        }
        public IActionResult Resource()
        {
            try
            {
                HttpContext.Request.Cookies.TryGetValue(UserHelper.EltizamToken, out string token);
                APIRepository objapi = new APIRepository(_cofiguration);
                MasterUserModel oUserList = new MasterUserModel();
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

        public IActionResult ResourceManage(int? Id)
        {
            MasterUserModel masterUser;
            if (Id == null || Id <= 0)
            {
                masterUser = new MasterUserModel();
                return View(masterUser);
            }
            else
            {
                HttpContext.Request.Cookies.TryGetValue(UserHelper.EltizamToken, out string token);
                APIRepository objapi = new(_cofiguration);
                HttpResponseMessage responseMessage = objapi.APICommunication(APIURLHelper.GetUserById + "/" + Id, HttpMethod.Get, token).Result;

                if (responseMessage.IsSuccessStatusCode)
                {
                    string jsonResponse = responseMessage.Content.ReadAsStringAsync().Result;
                    var data = JsonConvert.DeserializeObject<APIResponseEntity<MasterUserModel>>(jsonResponse);
                    if (data._object is null)
                        return NotFound();

                    return View(data._object);
                }
                return NotFound();
            }
        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        public IActionResult ResourceManage(int Id, MasterUserModel masterUser)
        {
            try
            {
                HttpContext.Request.Cookies.TryGetValue(UserHelper.EltizamToken, out string token);
                APIRepository objapi = new(_cofiguration);

                HttpResponseMessage responseMessage = objapi.APICommunication(APIURLHelper.UpsertUser, HttpMethod.Post, token, new StringContent(JsonConvert.SerializeObject(masterUser))).Result;

                if (responseMessage.IsSuccessStatusCode)
                {
                    string jsonResponse = responseMessage.Content.ReadAsStringAsync().Result;
                    TempData[UserHelper.SuccessMessage] = Convert.ToString(_stringLocalizerShared["RecordInsertUpdate"]);

                    return RedirectToAction(nameof(User));
                }
                else
                {
                    TempData[UserHelper.ErrorMessage] = Convert.ToString(responseMessage.Content.ReadAsStringAsync().Result);
                    return RedirectToAction("ResourceManage", new { UserId = masterUser.Id });
                }
            }
            catch (Exception e)
            {
                _helper.LogExceptions(e);
                TempData[UserHelper.ErrorMessage] = Convert.ToString(e.StackTrace);
                return RedirectToAction("ResourceManage", new { Id = masterUser.Id });
            }
        }
    }
}
