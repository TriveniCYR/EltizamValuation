using Eltizam.Business.Models;
using Eltizam.Resource;
using Eltizam.Utility.Enums;
using Eltizam.Utility.Models;
using Eltizam.Utility.Utility;
using Eltizam.Web.Helpers;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.Localization;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Net.Http;

namespace Eltizam.Web.Controllers
{
    public class RoleController : BaseController
    {
        #region Properties

        private readonly IConfiguration _cofiguration;
        private readonly IStringLocalizer<Shared> _stringLocalizerShared;
        private readonly IHelper _helper;

        #endregion Properties

        public RoleController(IConfiguration configuration, IStringLocalizer<Shared> stringLocalizerShared, IHelper helper)
        {
            _cofiguration = configuration;
            _stringLocalizerShared = stringLocalizerShared;
            _helper = helper;
        }

        public IActionResult Roles()
        {
            ModelState.Clear();
            try
            {
                int rolId = _helper.GetLoggedInRoleId();
                RolePermissionModel objPermssion = UtilityHelper.GetCntrActionAccess((int)ModulePermissionEnum.RoleManagement, rolId);
                ViewBag._objPermission = objPermssion;

                HttpContext.Request.Cookies.TryGetValue(UserHelper.EltizamToken, out string token);
                APIRepository objapi = new APIRepository(_cofiguration);
                List<MasterRoleEntity> oRoleList = new List<MasterRoleEntity>();
                HttpResponseMessage responseMessage = objapi.APICommunication(APIURLHelper.GetAllRole, HttpMethod.Get, token).Result;
                if (responseMessage.IsSuccessStatusCode)
                {
                    string jsonResponse = responseMessage.Content.ReadAsStringAsync().Result;
                    var data = JsonConvert.DeserializeObject<APIResponseEntity<List<MasterRoleEntity>>>(jsonResponse);
                    oRoleList = data._object;

                    return View(oRoleList);
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

        public IActionResult RoleManage(int? roleId, string flag1)
        {
            ViewBag.IsEdit = roleId != null;
            ViewBag.IsView= flag1 != null;
            MasterRoleEntity MasterRole = new MasterRoleEntity();
            if (roleId == null)
            {
                HttpContext.Request.Cookies.TryGetValue(UserHelper.EltizamToken, out string token);
                APIRepository objapi = new(_cofiguration);
                HttpResponseMessage responseMessage = objapi.APICommunication(APIURLHelper.GetAllModule + "/" + roleId, HttpMethod.Get, token).Result;

                if (responseMessage.IsSuccessStatusCode)
                {
                    string jsonResponse = responseMessage.Content.ReadAsStringAsync().Result;

                    var data = JsonConvert.DeserializeObject<APIResponseEntity<List<MasterModuleEntity>>>(jsonResponse);
                    MasterRole.MasterModules = data._object.OrderBy(x => x.SortOrder).ToList();
                    return View(MasterRole);
                }

                return View();
            }
            else
            {
                HttpContext.Request.Cookies.TryGetValue(UserHelper.EltizamToken, out string token);
                APIRepository objapi = new(_cofiguration);
                HttpResponseMessage responseMessage = objapi.APICommunication(APIURLHelper.GetRoleById + "/" + roleId, HttpMethod.Get, token).Result;

                if (responseMessage.IsSuccessStatusCode)
                {
                    string jsonResponse = responseMessage.Content.ReadAsStringAsync().Result;

                    var data = JsonConvert.DeserializeObject<APIResponseEntity<MasterRoleEntity>>(jsonResponse);
                    if (data._object is null)
                    {
                        return NotFound();
                    }
                    List<MasterModuleEntity> _oListMasterModules = data._object.MasterModules.OrderBy(x => x.SortOrder).ToList();
                    data._object.MasterModules = _oListMasterModules;
                    return View(data._object);
                }
                return NotFound();
            }
        }

        public IActionResult RoleView(int? roleId, string flag1)
        {
            ViewBag.IsEdit = roleId != null;
            ViewBag.IsView = flag1 != null;
            MasterRoleEntity MasterRole = new MasterRoleEntity();
            if (roleId == null)
            {
                HttpContext.Request.Cookies.TryGetValue(UserHelper.EltizamToken, out string token);
                APIRepository objapi = new(_cofiguration);
                HttpResponseMessage responseMessage = objapi.APICommunication(APIURLHelper.GetAllModule + "/" + roleId, HttpMethod.Get, token).Result;

                if (responseMessage.IsSuccessStatusCode)
                {
                    string jsonResponse = responseMessage.Content.ReadAsStringAsync().Result;

                    var data = JsonConvert.DeserializeObject<APIResponseEntity<List<MasterModuleEntity>>>(jsonResponse);
                    MasterRole.MasterModules = data._object.OrderBy(x => x.SortOrder).ToList();
                    return View(MasterRole);
                }

                return View();
            }
            else
            {
                HttpContext.Request.Cookies.TryGetValue(UserHelper.EltizamToken, out string token);
                APIRepository objapi = new(_cofiguration);
                HttpResponseMessage responseMessage = objapi.APICommunication(APIURLHelper.GetRoleById + "/" + roleId, HttpMethod.Get, token).Result;

                if (responseMessage.IsSuccessStatusCode)
                {
                    string jsonResponse = responseMessage.Content.ReadAsStringAsync().Result;

                    var data = JsonConvert.DeserializeObject<APIResponseEntity<MasterRoleEntity>>(jsonResponse);
                    if (data._object is null)
                    {
                        return NotFound();
                    }
                    List<MasterModuleEntity> _oListMasterModules = data._object.MasterModules.OrderBy(x => x.SortOrder).ToList();
                    data._object.MasterModules = _oListMasterModules;
                    return View(data._object);
                }
                return NotFound();
            }
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public IActionResult RoleManage(int roleId, MasterRoleEntity masterRole)
        {
            try
            {
                masterRole.LoggedUserId = _helper.GetLoggedInUserId();
                HttpContext.Request.Cookies.TryGetValue(UserHelper.EltizamToken, out string token);
                APIRepository objapi = new(_cofiguration);
                
                HttpResponseMessage responseMessage = objapi.APICommunication(APIURLHelper.SaveRole, HttpMethod.Post, token, new StringContent(JsonConvert.SerializeObject(masterRole))).Result;

                if (responseMessage.IsSuccessStatusCode)
                {
                    TempData["StatusMessage"] = "Saved Successfully";
                    if (masterRole.RoleId > 0)
                    {
                        UtilityHelper.RemoveModuleRole(masterRole.RoleId);

                        HttpResponseMessage resRoles = objapi.APICommunication(APIURLHelper.GetByPermisionRoleUsingRoleId + "/" + masterRole.RoleId, HttpMethod.Get, token).Result;
                        if (resRoles.IsSuccessStatusCode)
                        {
                            string rolJson = resRoles.Content.ReadAsStringAsync().Result;
                            var data = JsonConvert.DeserializeObject<APIResponseEntity<IEnumerable<RolePermissionModel>>>(rolJson);
                            UtilityHelper.AddModuleRole(masterRole.RoleId, data._object);
                        }
                    }

                    string jsonResponse = responseMessage.Content.ReadAsStringAsync().Result;
                    ModelState.Clear();
                    return RedirectToAction(nameof(Roles));
                }
                else
                    TempData["StatusMessage"] = "Some Eror Occured";
            }
            catch (Exception e)
            {
                _helper.LogExceptions(e);
                ViewBag.errormessage = Convert.ToString(e.StackTrace);
                ModelState.Clear();
                return View(nameof(Roles));
            }
            ModelState.Clear();
            return RedirectToAction(nameof(Roles));
        }


    }
}