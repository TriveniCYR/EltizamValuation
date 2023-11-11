using Eltizam.Business.Models;
using Eltizam.Data.DataAccess.Entity;
using Eltizam.Data.DataAccess.Helper;
using Eltizam.Resource;
using Eltizam.Utility.Enums;
using Eltizam.Utility.Models;
using Eltizam.Utility.Utility;
using Eltizam.Web.Controllers;
using Eltizam.Web.Helpers;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Localization;
using Newtonsoft.Json;
using System.Data;

namespace EltizamValuation.Web.Controllers
{
    public class MasterDepartmentController : BaseController
    {

        #region Properties

        private readonly IConfiguration _cofiguration;
        private readonly IStringLocalizer<Shared> _stringLocalizerShared;
        private readonly IHelper _helper;

        #endregion Properties

        public MasterDepartmentController(IConfiguration configuration, IStringLocalizer<Shared> stringLocalizerShared, IHelper helper)
        {
            _cofiguration = configuration;
            _stringLocalizerShared = stringLocalizerShared;
            _helper = helper;
        }

        public IActionResult Departments()
        {
            ModelState.Clear();
            try
            {
                //Check permissions
                int roleId = _helper.GetLoggedInRoleId();
                if (!CheckRoleAccess(ModulePermissionEnum.DepartmentMaster, PermissionEnum.View, roleId))
                    return RedirectToAction(AppConstants.AccessRestriction, AppConstants.Home);
                HttpContext.Request.Cookies.TryGetValue(UserHelper.EltizamToken, out string token);
                APIRepository objapi = new APIRepository(_cofiguration);
                List<MasterDepartmentEntity> oRoleList = new List<MasterDepartmentEntity>();
                HttpResponseMessage responseMessage = objapi.APICommunication(APIURLHelper.GetAllDepartment, HttpMethod.Get, token).Result;
                if (responseMessage.IsSuccessStatusCode)
                {
                    string jsonResponse = responseMessage.Content.ReadAsStringAsync().Result;
                    var data = JsonConvert.DeserializeObject<APIResponseEntity<List<MasterDepartmentEntity>>>(jsonResponse);
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


        
        [HttpPost]
        [Route("MasterDepartment/DepartmentManage")]
        public IActionResult DepartmentManage(int id, MasterDepartmentEntity masterDepartment)
        {
            try
            {
                //Check permissions for Get
                var action = masterDepartment.Id == 0 ? PermissionEnum.Add : PermissionEnum.Edit;

                int roleId = _helper.GetLoggedInRoleId();
                if (!CheckRoleAccess(ModulePermissionEnum.DepartmentMaster, action, roleId))
                    return RedirectToAction(AppConstants.AccessRestriction, AppConstants.Home);

                //Fill audit logs field
                if (masterDepartment.Id == 0)
                    masterDepartment.CreatedBy = _helper.GetLoggedInUserId();
                masterDepartment.ModifiedBy = _helper.GetLoggedInUserId();



                HttpContext.Request.Cookies.TryGetValue(UserHelper.EltizamToken, out string token);
                APIRepository objapi = new(_cofiguration);

                HttpResponseMessage responseMessage = objapi.APICommunication(APIURLHelper.UpsertDepartment, HttpMethod.Post, token, new StringContent(JsonConvert.SerializeObject(masterDepartment))).Result;

                if (responseMessage.IsSuccessStatusCode)
                {
                    TempData["StatusMessage"] = "Saved Successfully";
                    string jsonResponse = responseMessage.Content.ReadAsStringAsync().Result;
                    ModelState.Clear();
                    return RedirectToAction(nameof(Departments));
                }
                else
                    TempData["StatusMessage"] = "Some Eror Occured";
            }
            catch (Exception e)
            {
                _helper.LogExceptions(e);
                ViewBag.errormessage = Convert.ToString(e.StackTrace);
                ModelState.Clear();
                return View(nameof(Departments));
            }
            ModelState.Clear();
            return RedirectToAction(nameof(Departments));
        }

       
        public IActionResult DepartmentManage(int? id ,string view)
        {
            if (id != null)
            {
                ViewData["IsEdit"] = true;
            }

            if (view != null)
            {
                ViewData["IsView"] = true;
            }
            MasterDepartmentEntity masterDepartment;
            //Check permissions for Get
            var action = id == null ? PermissionEnum.Add : PermissionEnum.Edit;
            int roleId = _helper.GetLoggedInRoleId();

            if (!CheckRoleAccess(ModulePermissionEnum.DepartmentMaster, action, roleId))
                return RedirectToAction(AppConstants.AccessRestriction, AppConstants.Home);
            if (id == null || id <= 0)
            {
                masterDepartment = new MasterDepartmentEntity();
                return View(masterDepartment);
            }
            else
            {
                HttpContext.Request.Cookies.TryGetValue(UserHelper.EltizamToken, out string token);
                APIRepository objapi = new(_cofiguration);
                HttpResponseMessage responseMessage = objapi.APICommunication(APIURLHelper.GetDepartmentById + "/" + id, HttpMethod.Get, token).Result;

                if (responseMessage.IsSuccessStatusCode)
                {
                    string jsonResponse = responseMessage.Content.ReadAsStringAsync().Result;
                    var data = JsonConvert.DeserializeObject<APIResponseEntity<MasterDepartmentEntity>>(jsonResponse);
                    if (data._object is null)
                        return NotFound();

                    return View(data._object);
                }
                return NotFound();
            }
        }

        [HttpGet]
        [Route("Department/DepartmentView")]
        public IActionResult DepartmentView(int? id)
        {
          
            MasterDepartmentEntity masterDepartment;
            if (id == null || id <= 0)
            {
                masterDepartment = new MasterDepartmentEntity();
                return View(masterDepartment);
            }
            else
            {
                HttpContext.Request.Cookies.TryGetValue(UserHelper.EltizamToken, out string token);
                APIRepository objapi = new(_cofiguration);
                HttpResponseMessage responseMessage = objapi.APICommunication(APIURLHelper.GetDepartmentById + "/" + id, HttpMethod.Get, token).Result;

                if (responseMessage.IsSuccessStatusCode)
                {
                    string jsonResponse = responseMessage.Content.ReadAsStringAsync().Result;
                    var data = JsonConvert.DeserializeObject<APIResponseEntity<MasterDepartmentEntity>>(jsonResponse);
                    if (data._object is null)
                        return NotFound();

                    return View(data._object);
                }
                return NotFound();
            }
        }
    }
}







