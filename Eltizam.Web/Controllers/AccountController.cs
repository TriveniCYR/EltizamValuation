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
using Eltizam.Data.DataAccess.Helper;
using Eltizam.Data.DataAccess.Entity;
using Microsoft.CodeAnalysis;
using Microsoft.AspNetCore.Http;

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
                        HttpContext.Session.SetInt32(UserHelper.LogInRoleId, oUserDetail._object.RoleId);

                       
                        var roles = UtilityHelper.GetModuleRole<dynamic>(oUserDetail._object.RoleId);
                        if (roles == null)
                        {
                            HttpContext.Request.Cookies.TryGetValue(UserHelper.EltizamToken, out string token);
                            HttpResponseMessage resRoles = objapi.APICommunication(APIURLHelper.GetByPermisionRoleUsingRoleId + "/" + oUserDetail._object.RoleId, HttpMethod.Get, oUserDetail._object.UserToken).Result;
                            if (resRoles.IsSuccessStatusCode)
                            {
                                string rolJson = resRoles.Content.ReadAsStringAsync().Result;
                                var data = JsonConvert.DeserializeObject<APIResponseEntity<IEnumerable<RolePermissionModel>>>(rolJson);
                                UtilityHelper.AddModuleRole(oUserDetail._object.RoleId, data._object);
                                roles = data._object;
                            }
                        }

                        return RedirectToAction("Users", "MasterUser");
                    }
                    else
                    {
                        ViewBag.ErrorMessage = _stringLocalizer["InvalidUser"].Value; 
                        return View(loginViewModel);
                    }
                }
                else
                {
                    ViewBag.ErrorMessage = _stringLocalizer["InvalidUser"].Value; 
                    return View(loginViewModel);
                }
            }
            catch (Exception e)
            {
                _helper.LogExceptions(e);
                ViewBag.ErrorMessage = Convert.ToString(e.StackTrace);
                 
                return View(loginViewModel);
            }
        }

        private void SetUserClaim(UserSessionEntity oUserDetail)
        {
            HttpContext.Response.Cookies.Append(UserHelper.EltizamToken, oUserDetail.UserToken, new CookieOptions { Expires = oUserDetail.VallidTo });

            var claims = new List<Claim>
            {
                new Claim("UserName", oUserDetail.UserName),
                new Claim("Email", oUserDetail.Email),
			    new Claim("RoleId", Convert.ToString(oUserDetail.RoleId)),
				new Claim("Id", Convert.ToString(oUserDetail.UserId)),
            };

            //var claimsIdentity = new ClaimsIdentity(claims, CookieAuthenticationDefaults.AuthenticationScheme); 
            var identity       = new ClaimsIdentity(claims, CookieAuthenticationDefaults.AuthenticationScheme);

            var principal = new ClaimsPrincipal(identity);

            var props = new AuthenticationProperties();
            props.IsPersistent = true;
            props.ExpiresUtc = oUserDetail.VallidTo;

            HttpContext.SignInAsync(CookieAuthenticationDefaults.AuthenticationScheme, principal, props);
            
            //Set Session
            HttpContext.Session.SetString(UserHelper.LogInUserId, Convert.ToString(oUserDetail.UserId));
            HttpContext.Session.SetString(UserHelper.LogInRoleId, Convert.ToString(oUserDetail.RoleId));
            HttpContext.Session.SetString(UserHelper.LogInUserName, oUserDetail.UserName);
        }


        public IActionResult ForGetPassword()
        { 
            return View();
        }

        [HttpPost]
        public async Task<IActionResult> Logout()
        {
            await HttpContext.SignOutAsync(CookieAuthenticationDefaults.AuthenticationScheme);
            HttpContext.Session.Clear();

            HttpContext.Response.Cookies.Delete(UserHelper.EltizamToken); 
            return RedirectToAction("Login", "Account");
        }

        [HttpPost]
        public IActionResult ForgotPassword(ForgotPasswordViewModel forgotPasswordViewModel)
        {
            if (CheckEmailAddressExists(forgotPasswordViewModel.Email))
            {
                forgotPasswordViewModel.WebApplicationUrl = HttpContext.Request.Scheme + "://" + HttpContext.Request.Host.Value;
                APIRepository objapi = new APIRepository(_cofiguration);
                HttpResponseMessage responseMessage = objapi.APICommunication(APIURLHelper.ForgotPassword, HttpMethod.Post, string.Empty, new StringContent(JsonConvert.SerializeObject(forgotPasswordViewModel))).Result;
                if (responseMessage.IsSuccessStatusCode)
                {
                    ViewBag.SuccessMessage = AppConstants.msgLinkToResetpasswordSentOnEmail;
                    return View("ForgetPassword");

                }
                else //if (responseMessage.StatusCode == HttpStatusCode.BadRequest)
                {
                    ViewBag.ErrorMessage = AppConstants.SomeErrorOccurred; 
                }
            }
            else
            {
                ViewBag.ErrorMessage = AppConstants.msgEmailAddressNotExistIndatabase;
                return View("ForgetPassword");
            }
            return View("ForgetPassword");
        }

        // if CheckEmailAddressExists() is false then Email Id Exist in Db
        [NonAction]
        public bool CheckEmailAddressExists(string EmailAddress)
        {
            bool EmailExist = true;
            try
            {
                APIRepository objapi = new(_cofiguration);
                HttpResponseMessage responseMessage = objapi.APICommunication(APIURLHelper.Anonymous_CheckEmailAddressExists + "/" + EmailAddress, HttpMethod.Get, string.Empty).Result;
                if (responseMessage.IsSuccessStatusCode)
                {
                    string jsonResponse = responseMessage.Content.ReadAsStringAsync().Result;
                    EmailExist = JsonConvert.DeserializeObject<bool>(jsonResponse);

                    return EmailExist;
                }
                return EmailExist;
            }
            catch (Exception e)
            {
                _helper.LogExceptions(e);
                throw e;
            }
        }

        public IActionResult ResetPassword()
        {
            return View();
        }

        // if CheckEmailAddressExists() is false then Email Id Exist in Db
        [NonAction]
        public bool CheckResetPasswordTokenExists(string token)
        {
            bool TokenExist = false;
            try
            {
                APIRepository objapi = new(_cofiguration);
                HttpResponseMessage responseMessage = objapi.APICommunication(APIURLHelper.Anonymous_IsTokenValid + "/" + token, HttpMethod.Get, string.Empty).Result;
                if (responseMessage.IsSuccessStatusCode)
                {
                    string jsonResponse = responseMessage.Content.ReadAsStringAsync().Result;
                    TokenExist = JsonConvert.DeserializeObject<bool>(jsonResponse);

                    return TokenExist;
                }
                return TokenExist;
            }
            catch (Exception e)
            {
                _helper.LogExceptions(e);
                throw e;
            }
        }

        [HttpGet]
        public IActionResult ResetPassword([FromQuery] string userToken)
        {
            MasterUserResetPasswordEntity resetPasswordEntity = new MasterUserResetPasswordEntity();
            try
            {
                if (CheckResetPasswordTokenExists(userToken))
                {
                    string strValue = HttpContext.Request.Query["userToken"].ToString();
                    resetPasswordEntity.ForgotPasswordToken = strValue;
                    return View("ResetPassword", resetPasswordEntity);
                }
                else
                {
                    return RedirectToAction("Login");
                }
            }
            catch (Exception e)
            {
                _helper.LogExceptions(e);
                ViewBag.Message = Convert.ToString(e.StackTrace);
                return View();
            }
        }

        [HttpPost]
        public IActionResult ResetPassword(MasterUserResetPasswordEntity masterUserresetpassword)
        {
            try
            {
                APIRepository objapi = new APIRepository(_cofiguration);
                HttpResponseMessage responseMessage = objapi.APICommunication(APIURLHelper.ResetPassword, HttpMethod.Post, string.Empty, new StringContent(JsonConvert.SerializeObject(masterUserresetpassword))).Result;
                string jsonResponse = responseMessage.Content.ReadAsStringAsync().Result;
                var data = JsonConvert.DeserializeObject<APIResponseEntity<string>>(jsonResponse);
                if (data._object == "ResetSuccessfully")
                {
                    ViewBag.SuccessMessage = AppConstants.msgPasswordResetSuccessfully;//_stringLocalizer["msgPasswordResetSuccessfully"].Value;
                    return View("ResetPassword", masterUserresetpassword);
                }
                else if (data._object == "TokenExpired")
                {
                    ViewBag.ErrorMessage = AppConstants.msgResetPasswordTokenExpired;//_stringLocalizer["msgResetPasswordTokenExpired"].Value;
                    return View("ResetPassword", masterUserresetpassword);
                }
                else
                {
                    ViewBag.ErrorMessage = AppConstants.msgInvalidLink; //_stringLocalizer["msgInvalidLink"].Value;
                    
                }
                return View("ResetPassword", masterUserresetpassword);
            }
            catch (Exception e)
            {
                _helper.LogExceptions(e);
                ViewBag.Message = Convert.ToString(e.StackTrace);
                return View("ResetPassword", masterUserresetpassword);
            }
        }

        public IActionResult ProfileDetails()
        {
            return View();
        }
        [HttpGet]
        public IActionResult ChangePassword()
        {
           
            return View();
        }


        [HttpPost]
        public IActionResult ChangePassword(ChangePasswordModel passwordModel)
        {
            int rolId = _helper.GetLoggedInRoleId();
            passwordModel.UserId = rolId;
            try
            {
                HttpContext.Request.Cookies.TryGetValue(UserHelper.EltizamToken, out string token);
                APIRepository objapi = new(_cofiguration);

                HttpResponseMessage responseMessage = objapi.APICommunication(APIURLHelper.ChangePassword, HttpMethod.Post, token, new StringContent(JsonConvert.SerializeObject(passwordModel))).Result;

                if (responseMessage.IsSuccessStatusCode)
                {
                    string jsonResponse = responseMessage.Content.ReadAsStringAsync().Result;
                    

                    return RedirectToAction(nameof(Login));
                }
                else
                {
                    TempData[UserHelper.ErrorMessage] = Convert.ToString(responseMessage.Content.ReadAsStringAsync().Result); 
                }
            }
            catch (Exception e)
            {
                _helper.LogExceptions(e);
                TempData[UserHelper.ErrorMessage] = Convert.ToString(e.StackTrace); 
            }
            return View();
        }
    }
}
