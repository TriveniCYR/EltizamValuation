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
using System.Data;

namespace Eltizam.Web.Controllers
{
    public class MasterRoleController : BaseController
    {
        #region Properties

        private readonly IConfiguration _cofiguration;
        private readonly IStringLocalizer<Shared> _stringLocalizerShared;
        private readonly IHelper _helper;

        #endregion Properties

        public MasterRoleController(IConfiguration configuration, IStringLocalizer<Shared> stringLocalizerShared, IHelper helper)
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
                //Check permissions
                int roleId = _helper.GetLoggedInRoleId();
                if (!CheckRoleAccess(ModulePermissionEnum.UserMaster, PermissionEnum.View, roleId))
                    return RedirectToAction(AppConstants.AccessRestriction, AppConstants.Home);
                return View();
            }
            catch (Exception e)
            {
                _helper.LogExceptions(e);
                ViewBag.errormessage = Convert.ToString(e.StackTrace);
                return View("Login");
            } 
        }

        public IActionResult RoleManage(int? id, string flag1)
        {
            ViewBag.IsEdit = id != null;
            ViewBag.IsView= flag1 != null;
            MasterRoleEntity MasterRole = new MasterRoleEntity();
            //Check permissions for Get
            var action = id == null ? PermissionEnum.Add : PermissionEnum.Edit;
            
            int roleId = _helper.GetLoggedInRoleId();

            if (!CheckRoleAccess(ModulePermissionEnum.RoleMaster, action, roleId))
                return RedirectToAction(AppConstants.AccessRestriction, AppConstants.Home);

            if (id == null)
            {
                HttpContext.Request.Cookies.TryGetValue(UserHelper.EltizamToken, out string token);
                APIRepository objapi = new(_cofiguration);
                HttpResponseMessage responseMessage = objapi.APICommunication(APIURLHelper.GetAllModule + "/" + id, HttpMethod.Get, token).Result;

                if (responseMessage.IsSuccessStatusCode)
                {
                    string jsonResponse = responseMessage.Content.ReadAsStringAsync().Result;

                    var data = JsonConvert.DeserializeObject<APIResponseEntity<List<MasterModuleEntity>>>(jsonResponse);
                    MasterRole.MasterModules = data._object.OrderBy(x => x.SortOrder).ToList();
                    return View(MasterRole);
                } 
            }
            else
            {
                HttpContext.Request.Cookies.TryGetValue(UserHelper.EltizamToken, out string token);
                APIRepository objapi = new(_cofiguration);
                HttpResponseMessage responseMessage = objapi.APICommunication(APIURLHelper.GetRoleById + "/" + id, HttpMethod.Get, token).Result;

                if (responseMessage.IsSuccessStatusCode)
                {
                    string jsonResponse = responseMessage.Content.ReadAsStringAsync().Result;

                    var data = JsonConvert.DeserializeObject<APIResponseEntity<MasterRoleEntity>>(jsonResponse);

                    //Get Footer info
                    FooterInfo(TableNameEnum.Master_Role, _cofiguration, id);

                    //var url = string.Format("{0}/{1}/{2}", APIURLHelper.GetGlobalAuditFields, id, Enum.GetName(TableNameEnum.Master_Role));
                    //var footerRes = objapi.APICommunication(url, HttpMethod.Get, token).Result;
                    //if (footerRes.IsSuccessStatusCode)
                    //{
                    //    string json = footerRes.Content.ReadAsStringAsync().Result;
                    //    ViewBag.FooterInfo = JsonConvert.DeserializeObject<GlobalAuditFields>(json);
                    //}

                    if (data._object is null) 
                        return NotFound(); 

                    List<MasterModuleEntity> _oListMasterModules = data._object.MasterModules.OrderBy(x => x.SortOrder).ToList();
                    data._object.MasterModules = _oListMasterModules;
                    return View(data._object);
                } 
            }

            return View();
        }

        public IActionResult RoleView(int? id, string flag1)
        {
            ViewBag.IsEdit = id != null;
            ViewBag.IsView = flag1 != null;

            var action = id == null ? PermissionEnum.Edit : PermissionEnum.View;
            int roleId = _helper.GetLoggedInRoleId();
            if (!CheckRoleAccess(ModulePermissionEnum.UserMaster, action, roleId))
                return RedirectToAction(AppConstants.AccessRestriction, AppConstants.Home);

            MasterRoleEntity MasterRole = new MasterRoleEntity();


            if (id == null)
            {
                HttpContext.Request.Cookies.TryGetValue(UserHelper.EltizamToken, out string token);
                APIRepository objapi = new(_cofiguration);
                HttpResponseMessage responseMessage = objapi.APICommunication(APIURLHelper.GetAllModule + "/" + id, HttpMethod.Get, token).Result;

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
                HttpResponseMessage responseMessage = objapi.APICommunication(APIURLHelper.GetRoleById + "/" + id, HttpMethod.Get, token).Result;

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
        public IActionResult RoleManage(int id, MasterRoleEntity masterRole)
        {
            try
            {
                //Check permissions for Get
                var action = masterRole.Id == 0 ? PermissionEnum.Add : PermissionEnum.Edit;

                int roleId = _helper.GetLoggedInRoleId();
                if (!CheckRoleAccess(ModulePermissionEnum.UserMaster, action, roleId))
                    return RedirectToAction(AppConstants.AccessRestriction, AppConstants.Home);

                //Fill audit logs field
                if (masterRole.Id == 0)
                    masterRole.CreatedBy = _helper.GetLoggedInUserId();
                masterRole.ModifiedBy = _helper.GetLoggedInUserId();

                masterRole.LoggedUserId = _helper.GetLoggedInUserId();
                HttpContext.Request.Cookies.TryGetValue(UserHelper.EltizamToken, out string token);
                APIRepository objapi = new(_cofiguration);

                HttpResponseMessage responseMessage = objapi.APICommunication(APIURLHelper.SaveRole, HttpMethod.Post, token, new StringContent(JsonConvert.SerializeObject(masterRole))).Result;

                if (responseMessage.IsSuccessStatusCode)
                { 
                    if (masterRole.Id > 0)
                    {
                        UtilityHelper.RemoveModuleRole(masterRole.Id);

                        HttpResponseMessage resRoles = objapi.APICommunication(APIURLHelper.GetByPermisionRoleUsingRoleId + "/" + masterRole.Id, HttpMethod.Get, token).Result;
                        if (resRoles.IsSuccessStatusCode)
                        {
                            string rolJson = resRoles.Content.ReadAsStringAsync().Result;
                            var data = JsonConvert.DeserializeObject<APIResponseEntity<IEnumerable<RolePermissionModel>>>(rolJson);
                            UtilityHelper.AddModuleRole(masterRole.Id, data._object);
                        }
                    }

                    if (responseMessage.IsSuccessStatusCode)
                    {
                        string jsonResponse = responseMessage.Content.ReadAsStringAsync().Result;
                        TempData[UserHelper.SuccessMessage] = Convert.ToString(_stringLocalizerShared["RecordInsertUpdate"]);

                        return RedirectToAction("Roles");
                    }
                    else
                    {
                        TempData[UserHelper.ErrorMessage] = Convert.ToString(responseMessage.Content.ReadAsStringAsync().Result);
                        //return RedirectToAction("ManageRole", new { id = masterRole.Id });
                        return RedirectToAction("Roles");
                    }
                }
                return RedirectToAction("Roles");
            } 
            catch (Exception e)
            {
                _helper.LogExceptions(e);
                TempData[UserHelper.ErrorMessage] = Convert.ToString(e.StackTrace);
                return RedirectToAction("Roles");
            } 
        }  
    }
}