using Microsoft.AspNetCore.Authentication.Cookies;
using Microsoft.AspNetCore.Authentication;
using Microsoft.AspNetCore.Http.Extensions;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Caching.Distributed;
using Microsoft.Extensions.Localization;
using Newtonsoft.Json;
using System.Security.Claims;
using System.Security.Principal;
using Eltizam.Business.Models;
using Eltizam.Resource;
using Eltizam.Web.Helpers;
using Eltizam.Utility.Utility;
using Eltizam.Utility.Models;

namespace Eltizam.Web.Controllers
{
    public class AccountController : Controller
    {
        #region Properties

        private readonly IDistributedCache _cache;
        private readonly IConfiguration _cofiguration;
        private readonly IStringLocalizer<Account> _stringLocalizer;
        private readonly IHelper _helper;

        #endregion Properties
        public AccountController(IDistributedCache cache, IConfiguration configuration, IStringLocalizer<Account> stringLocalizer, IHelper helper)
        {
            _cache = cache;
            _cofiguration = configuration;
            _stringLocalizer = stringLocalizer;
            _helper = helper;
        }
        public IActionResult Login()
        {

            LoginViewModel loginViewModel = new LoginViewModel();
            return View(loginViewModel);
        }

        [HttpPost]
        public IActionResult Login(LoginViewModel loginViewModel)
        {
            try
            {
                APIRepository objapi = new APIRepository(_cofiguration);

                if (!(string.IsNullOrEmpty(loginViewModel.Email) && string.IsNullOrEmpty(loginViewModel.Password)))
                {
                    HttpResponseMessage responseMessage = objapi.APICommunication(APIURLHelper.LoginURL, HttpMethod.Post, string.Empty, new StringContent(JsonConvert.SerializeObject(loginViewModel))).Result;

                    if (responseMessage.IsSuccessStatusCode)
                    {
                        string jsonResponse = responseMessage.Content.ReadAsStringAsync().Result;
                        var oUserDetail = JsonConvert.DeserializeObject<APIResponseEntity<UserSessionEntity>>(jsonResponse);
                        SetUserClaim(oUserDetail._object);
                        HttpContext.Session.SetInt32(UserHelper.LoggedInRoleId, oUserDetail._object.RoleId);
                        var roles = UtilityHelper.GetModuleRole<dynamic>(oUserDetail._object.RoleId);
                        return RedirectToAction("Index", "Home");
                    }
                    else
                    {
                        ViewBag.errormessage = _stringLocalizer["InvalidUser"].Value;
                        return View(loginViewModel);
                    }
                }
                else
                {
                    ViewBag.errormessage = _stringLocalizer["InvalidUser"].Value;
                    return View(loginViewModel);
                }
            }
            catch (Exception e)
            {
                _helper.LogExceptions(e);
                ViewBag.errormessage = Convert.ToString(e.StackTrace);
                return View(loginViewModel);
            }
        }

        private void SetUserClaim(UserSessionEntity oUserDetail)
        {
            HttpContext.Response.Cookies.Append(UserHelper.EmcureNPDToken, oUserDetail.UserToken, new CookieOptions { Expires = oUserDetail.VallidTo });

            var claims = new List<Claim>
                            {
                                new Claim("FullName", oUserDetail.FullName),
                                new Claim("Email", oUserDetail.Email),
                                new Claim("UserId", Convert.ToString(oUserDetail.UserId)),
                                new Claim("RoleId", Convert.ToString(oUserDetail.RoleId)),
                                new Claim("IsManagement", Convert.ToString(oUserDetail.IsManagement)),
                                new Claim("AssignedBusinessUnit", oUserDetail.AssignedBusinessUnit)
                            };

            var claimsIdentity = new ClaimsIdentity(
                claims, CookieAuthenticationDefaults.AuthenticationScheme);

            var identity = new ClaimsIdentity(claims, CookieAuthenticationDefaults.AuthenticationScheme);

            var principal = new ClaimsPrincipal(identity);

            var props = new AuthenticationProperties();
            props.IsPersistent = true;
            props.ExpiresUtc = oUserDetail.VallidTo;

            HttpContext.SignInAsync(CookieAuthenticationDefaults.AuthenticationScheme, principal, props);
            HttpContext.Session.SetString(UserHelper.LoggedInUserId, Convert.ToString(oUserDetail.UserId));
        }
    }
}
