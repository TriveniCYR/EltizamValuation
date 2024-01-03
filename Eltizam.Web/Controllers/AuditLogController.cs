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
    public class AuditLogController : BaseController
    {

        #region Properties

        private readonly IConfiguration _cofiguration;
        private readonly IStringLocalizer<Shared> _stringLocalizerShared;
        private readonly IHelper _helper;

        #endregion Properties

        public AuditLogController(IConfiguration configuration, IStringLocalizer<Shared> stringLocalizerShared, IHelper helper)
        {
            _cofiguration = configuration;
            _stringLocalizerShared = stringLocalizerShared;
            _helper = helper;
        }


        public IActionResult Logs()
        {
            ModelState.Clear();
            try
            {
                //Check permissions
                int roleId = _helper.GetLoggedInRoleId();
                if (!CheckRoleAccess(ModulePermissionEnum.AuditLog, PermissionEnum.View, roleId))
                    return RedirectToAction(AppConstants.AccessRestriction, AppConstants.Home);

                return View();

            }
            catch (Exception e)
            {
                _helper.LogExceptions(e);
                TempData[UserHelper.ErrorMessage] = Convert.ToString(e.StackTrace);

                return View("Login");
            }
        }

        [HttpGet]
        public IActionResult AuditLogDetails(string TableName, int? Id = null, int? TableKey = null, DateTime? DateFrom = null, DateTime? DateTo = null)
        {
            try
            {
                //Check permissions
                int roleId = _helper.GetLoggedInRoleId();
                if (!CheckRoleAccess(ModulePermissionEnum.AuditLog, PermissionEnum.View, roleId))
                    return RedirectToAction(AppConstants.AccessRestriction, AppConstants.Home);


                HttpContext.Request.Cookies.TryGetValue(UserHelper.EltizamToken, out string token);

                var url = string.Format("{0}?TableName={1}&Id={2}&TableKey={3}&DateFrom={4}&DateTo={5}&",
                                        APIURLHelper.GetDetailsAudit, TableName, Id, TableKey, DateFrom, DateTo);

                APIRepository objapi = new(_cofiguration);
                HttpResponseMessage responseMessage = objapi.APICommunication(url, HttpMethod.Get, token).Result;
                if (responseMessage.IsSuccessStatusCode)
                {
                    string jsonResponse = responseMessage.Content.ReadAsStringAsync().Result;
                    AuditData rootObject = JsonConvert.DeserializeObject<AuditData>(jsonResponse); 

                    //return View(data._object);
                    return View(rootObject);
                }
                return View();
            }
            catch (Exception e)
            {
                _helper.LogExceptions(e);
                TempData[UserHelper.ErrorMessage] = Convert.ToString(e.StackTrace);

                return View("Login");
            }
        }

        public IActionResult AuditLogDetailList(string TableName, int? Id = null, int? TableKey = null, DateTime? DateFrom = null, DateTime? DateTo = null)
        {
            ModelState.Clear();
            try
            {
                //Check permissions
                int roleId = _helper.GetLoggedInRoleId();
                if (!CheckRoleAccess(ModulePermissionEnum.AuditLog, PermissionEnum.View, roleId))
                    return RedirectToAction(AppConstants.AccessRestriction, AppConstants.Home);


                AuditLogDetailsFilter filter = new AuditLogDetailsFilter();
                filter.TableName = TableName;
                filter.Id = Id;
                filter.TableKey = TableKey;
                filter.DateFrom = DateFrom;
                filter.DateTo = DateTo;
                ViewBag.Filter = filter;
                return View("AuditLogDetails");
            }
            catch (Exception e)
            {
                _helper.LogExceptions(e);
                TempData[UserHelper.ErrorMessage] = Convert.ToString(e.StackTrace);

                return View("Login");
            } 
        } 
    }
}







