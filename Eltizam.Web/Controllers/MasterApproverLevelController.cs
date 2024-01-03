using Eltizam.Business.Models;
using Eltizam.Data.DataAccess.Helper;
using Eltizam.Resource;
using Eltizam.Utility.Enums;
using Eltizam.Web.Controllers;
using Eltizam.Web.Helpers;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Localization;
using Newtonsoft.Json;

namespace EltizamValuation.Web.Controllers
{
    public class MasterApproverLevelController : BaseController
    {

        #region Properties

        private readonly IConfiguration _cofiguration;
        private readonly IStringLocalizer<Shared> _stringLocalizerShared;
        private readonly IHelper _helper;

        #endregion Properties

        public MasterApproverLevelController(IConfiguration configuration, IStringLocalizer<Shared> stringLocalizerShared, IHelper helper)
        {
            _cofiguration = configuration;
            _stringLocalizerShared = stringLocalizerShared;
            _helper = helper;
        }

        [HttpGet]
        [Route("MasterApproverLevel/ApproverLevels")]
        public IActionResult ApproverLevels()
        {

            //Check permissions
            int roleId = _helper.GetLoggedInRoleId();
            if (!CheckRoleAccess(ModulePermissionEnum.ApproverMaster, PermissionEnum.View, roleId))
                return RedirectToAction(AppConstants.AccessRestriction, AppConstants.Home);
            return View();
        }

        [HttpPost]
        [Route("MasterApproverLevel/MasterApproverLevelManage")]
        public IActionResult MasterApproverLevelManage(int id, MasterApproverLevelModel masterapproverlevel)
        {
            try
            {
                //Check permissions for Get
                var action = masterapproverlevel.Id == 0 ? PermissionEnum.Add : PermissionEnum.Edit;

                int roleId = _helper.GetLoggedInRoleId();
                if (!CheckRoleAccess(ModulePermissionEnum.ApproverMaster, action, roleId))
                    return RedirectToAction(AppConstants.AccessRestriction, AppConstants.Home);

                //Fill audit logs field
                if (masterapproverlevel.Id == 0)
                    masterapproverlevel.CreatedBy = _helper.GetLoggedInUserId();
                masterapproverlevel.ModifiedBy = _helper.GetLoggedInUserId();

                HttpContext.Request.Cookies.TryGetValue(UserHelper.EltizamToken, out string token);
                APIRepository objapi = new(_cofiguration);

                HttpResponseMessage responseMessage = objapi.APICommunication(APIURLHelper.UpsertMasterApproverLevel, HttpMethod.Post, token, new StringContent(JsonConvert.SerializeObject(masterapproverlevel))).Result;

                if (responseMessage.IsSuccessStatusCode)
                {
                    if (responseMessage.IsSuccessStatusCode && masterapproverlevel.Id == 0)
                    {
                        string jsonResponse = responseMessage.Content.ReadAsStringAsync().Result;
                        TempData[UserHelper.SuccessMessage] = Convert.ToString(_stringLocalizerShared["RecordInsertUpdate"]);
                        return RedirectToAction("ApproverLevels");

                    }
                    if (responseMessage.IsSuccessStatusCode)
                    {
                        string jsonResponse = responseMessage.Content.ReadAsStringAsync().Result;
                        TempData[UserHelper.SuccessMessage] = Convert.ToString(_stringLocalizerShared["RecordInsertUpdate"]);
                        return Redirect($"/Masterapproverlevel/ApproverLevels?id={masterapproverlevel.Id}");

                    }
                    else
                    {
                        TempData[UserHelper.ErrorMessage] = Convert.ToString(responseMessage.Content.ReadAsStringAsync().Result);
                        return RedirectToAction("ApproverLevels");
                    }
                }
                return RedirectToAction("ApproverLevels");
            }

            catch (Exception e)
            {
                _helper.LogExceptions(e);
                TempData[UserHelper.SuccessMessage] = Convert.ToString(_stringLocalizerShared["RecordInsertUpdate"]);
                ModelState.Clear();
                return RedirectToAction("ApproverLevels");
            }
        }

        [HttpGet]
        public IActionResult MasterApproverLevelManage(int? id)
        {
            //Check permissions for Get
            var action = id == null ? PermissionEnum.Add : PermissionEnum.Edit;
            int roleId = _helper.GetLoggedInRoleId();

            if (!CheckRoleAccess(ModulePermissionEnum.ApproverMaster, action, roleId))
                return RedirectToAction(AppConstants.AccessRestriction, AppConstants.Home);
            if (id != null)
            {
                ViewData["IsEdit"] = true;
            }

            MasterApproverLevelModel masterapproverlevel;
            if (id == null || id <= 0)
            {
                masterapproverlevel = new MasterApproverLevelModel();
                return View(masterapproverlevel);
            }
            else
            {
                HttpContext.Request.Cookies.TryGetValue(UserHelper.EltizamToken, out string token);
                APIRepository objapi = new(_cofiguration);

                HttpResponseMessage responseMessage = objapi.APICommunication(APIURLHelper.GetMasterApproverLevelById + "/" + id, HttpMethod.Get, token).Result;

                if (responseMessage.IsSuccessStatusCode)
                {
                    string jsonResponse = responseMessage.Content.ReadAsStringAsync().Result;
                    var data = JsonConvert.DeserializeObject<APIResponseEntity<MasterApproverLevelModel>>(jsonResponse);

                    //Get Footer info
                    FooterInfo(TableNameEnum.Master_PropertyType, _cofiguration, id);

                    if (data._object is null)
                        return NotFound();

                    return View("MasterApproverLevelManage", data._object);
                }
                return NotFound();
            }
        }
        [HttpGet]
        public IActionResult MasterApproverLevelDetail(int? id)
        {

            //Check permissions for Get
            var action = PermissionEnum.View;

            int roleId = _helper.GetLoggedInRoleId();
            if (!CheckRoleAccess(ModulePermissionEnum.ApproverMaster, action, roleId))
                return RedirectToAction(AppConstants.AccessRestriction, AppConstants.Home);

            MasterApproverLevelModel masterapproverlevel;
            if (id == null || id <= 0)
            {
                masterapproverlevel = new MasterApproverLevelModel();
                return View(masterapproverlevel);
            }
            else
            {
                HttpContext.Request.Cookies.TryGetValue(UserHelper.EltizamToken, out string token);
                APIRepository objapi = new(_cofiguration);

                HttpResponseMessage responseMessage = objapi.APICommunication(APIURLHelper.GetMasterApproverLevelById + "/" + id, HttpMethod.Get, token).Result;

                if (responseMessage.IsSuccessStatusCode)
                {
                    string jsonResponse = responseMessage.Content.ReadAsStringAsync().Result;
                    var data = JsonConvert.DeserializeObject<APIResponseEntity<MasterApproverLevelModel>>(jsonResponse);

                    FooterInfo(TableNameEnum.MasterApproverLevel, _cofiguration, id, true);

                    return View("MasterApproverLevelDetail", data._object);
                }
                return NotFound();
            }
        }
    }

}

