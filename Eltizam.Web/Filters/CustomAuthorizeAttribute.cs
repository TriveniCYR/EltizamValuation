using Microsoft.AspNetCore.Mvc.Filters;
using Microsoft.AspNetCore.Mvc;
using Newtonsoft.Json;
using Eltizam.Business.Models;
using Eltizam.Utility.Models;
using Eltizam.Utility.Utility;
using Eltizam.Web.Helpers;
using Microsoft.AspNetCore.Authorization;

namespace Eltizam.Web.Filters
{
    [AttributeUsage(AttributeTargets.Class | AttributeTargets.Method, AllowMultiple = true, Inherited = true)]
    public class CustomAuthorizeAttribute : AuthorizeAttribute, IAsyncAuthorizationFilter
    {
        public async Task OnAuthorizationAsync(AuthorizationFilterContext context)
        {
            try
            {
                var user = context.HttpContext.User;

                if (!user.Identity.IsAuthenticated)
                    context.Result = new RedirectResult("~/Account/Login");
                else
                {


                    UserSessionEntity oUserLoggedInModel = UtilityHelper.GetUserFromClaims(user.Claims);

                    context.HttpContext.Session.SetString(UserHelper.LoggedInUserEmailAddress, oUserLoggedInModel.Email);
                    if (String.IsNullOrEmpty(context.HttpContext.Session.GetString(UserHelper.LoggedInUserName)))
                    {
                        context.HttpContext.Session.SetString(UserHelper.LoggedInUserName, oUserLoggedInModel.FullName);
                    }
                    context.HttpContext.Session.SetInt32(UserHelper.LoggedInRoleId, oUserLoggedInModel.RoleId);
                    context.HttpContext.Session.SetString(UserHelper.AssignedBusinessUnit, oUserLoggedInModel.AssignedBusinessUnit);
                    context.HttpContext.Session.SetString(UserHelper.IsManagement, Convert.ToString(oUserLoggedInModel.IsManagement));
                    if (oUserLoggedInModel.UserId > 0)
                    {
                        context.HttpContext.Session.SetString(UserHelper.LoggedInUserId, oUserLoggedInModel.UserId.ToString());
                    }
                    var roles = UtilityHelper.GetModuleRole<dynamic>(oUserLoggedInModel.RoleId);
                    if (roles == null)
                    {
                        APIRepository objapi = new APIRepository(APIURLHelper.Configuration);

                        context.HttpContext.Request.Cookies.TryGetValue(UserHelper.EmcureNPDToken, out string token);

                        HttpResponseMessage resRoles = objapi.APICommunication(APIURLHelper.GetByPermisionRoleUsingRoleId + "/" + oUserLoggedInModel.RoleId, HttpMethod.Get, token).Result;

                        if (resRoles.IsSuccessStatusCode)
                        {
                            string rolJson = resRoles.Content.ReadAsStringAsync().Result;
                            var data = JsonConvert.DeserializeObject<APIResponseEntity<IEnumerable<RolePermissionModel>>>(rolJson);
                            UtilityHelper.AddModuleRole(oUserLoggedInModel.RoleId, data._object);
                            roles = data._object;
                        }
                    }

                    oUserLoggedInModel.UserToken = string.Empty;

                    IsUserAuthorized(context);
                }
            }
            catch (Exception)
            {
                throw;
            }
        }

        private void IsUserAuthorized(AuthorizationFilterContext context)
        {
            try
            {
                if (context.HttpContext.Session.GetInt32(UserHelper.LoggedInRoleId) != null)
                {
                    int rolId = (int)context.HttpContext.Session.GetInt32(UserHelper.LoggedInRoleId);
                    if (rolId > 0)
                    {
                        IEnumerable<RolePermissionModel> obj = UtilityHelper.GetModuleRole<dynamic>((Convert.ToInt32(rolId)));

                        var controllerName = context.RouteData.Values["controller"];
                        var action = context.RouteData.Values["action"];
                        if (obj != null)
                        {
                            RolePermissionModel objList = obj.Where(o => o.ControlName != null && o.ControlName.Trim() == Convert.ToString(controllerName).Trim()).FirstOrDefault();
                            // || (!objList.Add && !objList.View && !objList.Edit && !objList.Delete && !objList.Approve)
                            if ((objList == null) && Convert.ToString(controllerName) != "Home" && Convert.ToString(controllerName) != "Notifications")
                                context.Result = new RedirectResult("~/Home/AccessRestriction");
                        }
                    }
                }
            }
            catch (Exception)
            {
                throw;
            }
        }
    }
}
