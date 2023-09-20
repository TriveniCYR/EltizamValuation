using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Localization;
using Newtonsoft.Json;
using Eltizam.Business.Models;
using Eltizam.Resource;
using Eltizam.Utility.Enums;
using Eltizam.Utility.Models;
using Eltizam.Utility.Utility;
using Eltizam.Web.Helpers;

namespace Eltizam.Web.Controllers
{
	public class UserController : BaseController
	{
		#region Properties

		private readonly IConfiguration _cofiguration;
		private readonly IStringLocalizer<Errors> _stringLocalizerError;
		private readonly IStringLocalizer<Shared> _stringLocalizerShared;
		private Microsoft.AspNetCore.Hosting.IHostingEnvironment _env;
		private readonly IHelper _helper;

		#endregion Properties

		public UserController(IConfiguration configuration, Microsoft.AspNetCore.Hosting.IHostingEnvironment env,
			   IStringLocalizer<Errors> stringLocalizerError, IStringLocalizer<Shared> stringLocalizerShared, IHelper helper)
		{
			_cofiguration = configuration;
			_stringLocalizerError = stringLocalizerError;
			_stringLocalizerShared = stringLocalizerShared;
			_env = env;
			_helper = helper;
		}
		
        public IActionResult TblUser()
        {
            int rolId = _helper.GetLoggedInRoleId();
            RolePermissionModel objPermssion = UtilityHelper.GetCntrActionAccess((int)ModulePermissionEnum.UserManagement, rolId);
            ViewBag._objPermission = objPermssion;
            return View();
        }
     
        public IActionResult TblUserManage(int? Id)
        {
            TblUserModel masterUser;
            if (Id == null || Id <= 0)
            {
                masterUser = new TblUserModel();
                return View(masterUser);
            }
            else
            {
                HttpContext.Request.Cookies.TryGetValue(UserHelper.EmcureNPDToken, out string token);
                APIRepository objapi = new(_cofiguration);
                HttpResponseMessage responseMessage = objapi.APICommunication(APIURLHelper.GetTblUserById + "/" + Id, HttpMethod.Get, token).Result;

                if (responseMessage.IsSuccessStatusCode)
                {
                    string jsonResponse = responseMessage.Content.ReadAsStringAsync().Result;
                    var data = JsonConvert.DeserializeObject<APIResponseEntity<TblUserModel>>(jsonResponse);
                    if (data._object is null)
                        return NotFound();

                    return View(data._object);
                }
                return NotFound();
            }
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public IActionResult TblUserManage(int Id, TblUserModel masterUser)
        {
            try
            {
                masterUser.Password = string.IsNullOrEmpty(masterUser.Password) ? "" : masterUser.Password;
                masterUser.ConfirmPassowrd = string.IsNullOrEmpty(masterUser.ConfirmPassowrd) ? "" : masterUser.ConfirmPassowrd;
                masterUser.LoggedUserId = _helper.GetLoggedInUserId();
               
            }
            catch (Exception e)
            {
                _helper.LogExceptions(e);
                TempData[UserHelper.ErrorMessage] = Convert.ToString(e.StackTrace);
                return RedirectToAction("TblUserManage", new { UserId = masterUser.Id });
            }
            try
            {
                masterUser.WebApplicationUrl = HttpContext.Request.Scheme + "://" + HttpContext.Request.Host.Value;
                HttpContext.Request.Cookies.TryGetValue(UserHelper.EmcureNPDToken, out string token);
                APIRepository objapi = new(_cofiguration);

                HttpResponseMessage responseMessage = objapi.APICommunication(APIURLHelper.SaveTblUser, HttpMethod.Post, token, new StringContent(JsonConvert.SerializeObject(masterUser))).Result;

                if (responseMessage.IsSuccessStatusCode)
                {
                    string jsonResponse = responseMessage.Content.ReadAsStringAsync().Result;
                    TempData[UserHelper.SuccessMessage] = Convert.ToString(_stringLocalizerShared["RecordInsertUpdate"]);

                    return RedirectToAction(nameof(TblUser));
                }
                else
                {
                    TempData[UserHelper.ErrorMessage] = Convert.ToString(responseMessage.Content.ReadAsStringAsync().Result);
                    return RedirectToAction("TblUserManage", new { UserId = masterUser.Id });
                }
            }
            catch (Exception e)
            {
                _helper.LogExceptions(e);
                TempData[UserHelper.ErrorMessage] = Convert.ToString(e.StackTrace);
                return RedirectToAction("TblUserManage", new { UserId = masterUser.Id });
            }
        }
    }
}
