using Eltizam.Business.Models;
using Eltizam.Data.DataAccess.Helper;
using Eltizam.Resource;
using Eltizam.Utility.Enums;
using Eltizam.Web.Helpers;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Localization;
using Newtonsoft.Json;

namespace EltizamValuation.Web.Controllers
{
    public class MasterClientTypeController : Controller
    {
        #region Properties

        private readonly IConfiguration _cofiguration;
        private readonly IStringLocalizer<Shared> _stringLocalizerShared;
        private readonly IHelper _helper;

        #endregion Properties

        public MasterClientTypeController(IConfiguration configuration, IStringLocalizer<Shared> stringLocalizerShared, IHelper helper)
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
                return View();
            }
            catch (Exception e)
            { 
                _helper.LogExceptions(e);
                ViewBag.errormessage = Convert.ToString(e.StackTrace);
                return View("Login");
            } 
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

                    //Get FooterInfo
                    var url = string.Format("{0}/{1}/{2}", APIURLHelper.GetGlobalAuditFields, id, Enum.GetName(TableNameEnum.Master_ClientType));
                    var footerRes = objapi.APICommunication(url, HttpMethod.Get, token).Result;
                    if (footerRes.IsSuccessStatusCode)
                    {
                        string json = footerRes.Content.ReadAsStringAsync().Result;
                        ViewBag.FooterInfo = JsonConvert.DeserializeObject<GlobalAuditFields>(json);
                    }

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
