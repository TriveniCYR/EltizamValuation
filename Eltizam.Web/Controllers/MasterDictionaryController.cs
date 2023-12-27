using Eltizam.Business.Models;
using Eltizam.Data.DataAccess.Entity;
using Eltizam.Data.DataAccess.Helper;
using Eltizam.Resource;
using Eltizam.Utility.Enums;
using Eltizam.Web.Controllers;
using Eltizam.Web.Helpers;
using Microsoft.AspNet.SignalR.Hubs;
using Microsoft.AspNetCore.Mvc;
using Microsoft.CodeAnalysis;
using Microsoft.CodeAnalysis.CSharp.Syntax;
using Microsoft.Extensions.Localization;
using Newtonsoft.Json;

namespace EltizamValuation.Web.Controllers
{
    public class MasterDictionaryController : BaseController
    {
        #region Properties

        private readonly IConfiguration _cofiguration;
        private readonly IStringLocalizer<Shared> _stringLocalizerShared;
        private readonly IHelper _helper;

        #endregion Properties
        public MasterDictionaryController(IConfiguration configuration, IStringLocalizer<Shared> stringLocalizerShared, IHelper helper)
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
                //Check permissions
                int roleId = _helper.GetLoggedInRoleId();
                if (!CheckRoleAccess(ModulePermissionEnum.DictionaryMaster, PermissionEnum.View, roleId))
                    return RedirectToAction(AppConstants.AccessRestriction, AppConstants.Home);

                HttpContext.Request.Cookies.TryGetValue(UserHelper.EltizamToken, out string token);
                APIRepository objapi = new APIRepository(_cofiguration); 
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
        public IActionResult MasterDictionaryManage(int? id, int? IsView)
        { 
            MasterDictionaryEntity masterDictionaryEntity;
            //Check permissions for Get
            var action = IsView == 1 ? PermissionEnum.View : (id == null ? PermissionEnum.Add : PermissionEnum.Edit);

            int roleId = _helper.GetLoggedInRoleId();

            if (!CheckRoleAccess(ModulePermissionEnum.DictionaryMaster, action, roleId))
                return RedirectToAction(AppConstants.AccessRestriction, AppConstants.Home);

            //Get Footer info
            var vw = IsView == 1;
            FooterInfo(TableNameEnum.Master_Dictionary, _cofiguration, id, vw);

            if (id == null || id <= 0)
            {
                masterDictionaryEntity = new MasterDictionaryEntity();
                masterDictionaryEntity.IsActive = true;
                return View(masterDictionaryEntity);
            }
            else
            {
                HttpContext.Request.Cookies.TryGetValue(UserHelper.EltizamToken, out string token);
                APIRepository objapi = new(_cofiguration); 
                HttpResponseMessage responseMessage = objapi.APICommunication(APIURLHelper.GetDictionaryDetailsById + "/" + id, HttpMethod.Get, token).Result;

                if (responseMessage.IsSuccessStatusCode)
                {
                    string jsonResponse = responseMessage.Content.ReadAsStringAsync().Result;
                    var data = JsonConvert.DeserializeObject<APIResponseEntity<MasterDictionaryEntity>>(jsonResponse); 

                    if (data._object is null)
                        return NotFound();

                    return View("MasterDictionaryManage", data._object);
                }
                return NotFound();
            }
        }    


        public IActionResult DictionaryAllManage(int id, string? description)
        {
            ModelState.Clear();

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

                string urlHelper = APIURLHelper.GetDictionaryById + "/" + id + "/" + description; 
                HttpResponseMessage responseMessage = objapi.APICommunication(urlHelper, HttpMethod.Get, token).Result;

                if (responseMessage.IsSuccessStatusCode)
                {
                    string jsonResponse = responseMessage.Content.ReadAsStringAsync().Result; 
                    var data = JsonConvert.DeserializeObject<List<MasterDictionaryDetailById>>(jsonResponse);

                    //Get Footer info
                    FooterInfo(TableNameEnum.Master_Dictionary, _cofiguration, id);

                    if (data is null)
                        return NotFound();

                    ViewData["ChildDictList"] = data;
                     
                    return View();
                }
                return NotFound();
            }

        }
       
        public IActionResult DictionaryDetailsManage(int id, int? status, string? pdesc)
        {
            ModelState.Clear();
            //id = 3; description = "ValuationType";
            MasterDictionaryDetailById masterdictionary;
            if (id > 0 && status == 1)
            {
                masterdictionary = new MasterDictionaryDetailById();
                masterdictionary.DictionaryId = id;
                masterdictionary.ParentDescription = pdesc;
                return View(masterdictionary);
            }
            else
            {
                HttpContext.Request.Cookies.TryGetValue(UserHelper.EltizamToken, out string token);

                APIRepository objapi = new(_cofiguration); 

                var urlHelper = APIURLHelper.GetDictionaryById + "/" + id;
                HttpResponseMessage responseMessage = objapi.APICommunication(urlHelper, HttpMethod.Get, token).Result;

                if (responseMessage.IsSuccessStatusCode)
                {
                    string jsonResponse = responseMessage.Content.ReadAsStringAsync().Result; 
                    var data = JsonConvert.DeserializeObject<MasterDictionaryDetailById>(jsonResponse);

                    //Get Footer info
                    FooterInfo(TableNameEnum.Master_Dictionary, _cofiguration, id);

                    if (data is null)
                        return NotFound();

                    //   ModelState.Clear();
                    data.ParentDescription = pdesc;
                    return View(data);

                }
                // return NotFound();
                return View();
            }

        }

        public IActionResult DictionaryDetailsView(int id)
        {
            //Check permissions for Get
            var action = PermissionEnum.View;

            int roleId = _helper.GetLoggedInRoleId();
            if (!CheckRoleAccess(ModulePermissionEnum.DictionaryMaster, action, roleId))
                return RedirectToAction(AppConstants.AccessRestriction, AppConstants.Home);

            MasterDictionaryDetailById model = new MasterDictionaryDetailById();

            HttpContext.Request.Cookies.TryGetValue(UserHelper.EltizamToken, out string token);
            ViewData["ParentId"] = id;
            APIRepository objapi = new(_cofiguration); 


            var urlHelper = APIURLHelper.GetDictionaryById + "/" + id;
            HttpResponseMessage responseMessage = objapi.APICommunication(urlHelper, HttpMethod.Get, token).Result;

            if (responseMessage.IsSuccessStatusCode)
            {
                string jsonResponse = responseMessage.Content.ReadAsStringAsync().Result; 
                var data = JsonConvert.DeserializeObject<MasterDictionaryDetailById>(jsonResponse);

                //Get Footer info
                FooterInfo(TableNameEnum.Master_Dictionary, _cofiguration, id, true);

                if (data is null)
                    return NotFound();

                //   ModelState.Clear();
                return View(data);

            }
            // return NotFound();
            return View(model); 
        }


        [HttpPost]
        public IActionResult DictionaryDetailsManage(int? Id, MasterDictionaryDetailById masterdictionary)
        {
            try
            {
                //Check permissions for Get
                var action = Id == null ? PermissionEnum.Edit : PermissionEnum.View;

                int roleId = _helper.GetLoggedInRoleId();
                if (!CheckRoleAccess(ModulePermissionEnum.DictionaryMaster, action, roleId))
                    return RedirectToAction(AppConstants.AccessRestriction, AppConstants.Home);

                //Fill audit logs field
                if (masterdictionary.Id == 0)
                    masterdictionary.CreatedBy = _helper.GetLoggedInUserId();
                masterdictionary.ModifiedBy = _helper.GetLoggedInUserId(); 

                HttpContext.Request.Cookies.TryGetValue(UserHelper.EltizamToken, out string token);
                APIRepository objapi = new(_cofiguration);

                HttpResponseMessage responseMessage = objapi.APICommunication(APIURLHelper.UpsertDictionary, HttpMethod.Post, token, new StringContent(JsonConvert.SerializeObject(masterdictionary))).Result;

                if (responseMessage.IsSuccessStatusCode)
                {
                    string jsonResponse = responseMessage.Content.ReadAsStringAsync().Result;
                    TempData[UserHelper.SuccessMessage] = Convert.ToString(_stringLocalizerShared["RecordInsertUpdate"]);

                    //return RedirectToAction(nameof(DictionaryAllManage));
                    return RedirectToAction("DictionaryAllManage", new { id = masterdictionary.DictionaryId, description = masterdictionary.ParentDescription });
                }
                else
                {
                    TempData[UserHelper.ErrorMessage] = Convert.ToString(responseMessage.Content.ReadAsStringAsync().Result);
                    return RedirectToAction("DictionaryAllManage", new { id = masterdictionary.DictionaryId });
                }
            }
            catch (Exception e)
            {
                _helper.LogExceptions(e);
                TempData[UserHelper.ErrorMessage] = Convert.ToString(e.StackTrace);
                return RedirectToAction("DictionaryAllManage", new { Id = masterdictionary.DictionaryId });
            }
        } 
    }
}
