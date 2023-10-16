﻿using Microsoft.AspNetCore.Authentication.Cookies;
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
            //APIRepository objapi = new APIRepository(_cofiguration);
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

                        return RedirectToAction("Resource", "Resource");
                    }
                    else
                    {
                        ViewBag.errormessage = _stringLocalizer["InvalidUser"].Value;
                        //loginViewModel.masterBusinessUnitEntities = BindListBusinessUnit();
                        return View(loginViewModel);
                    }
                }
                else
                {
                    ViewBag.errormessage = _stringLocalizer["InvalidUser"].Value;
                    //loginViewModel.masterBusinessUnitEntities = BindListBusinessUnit();
                    return View(loginViewModel);
                }
            }
            catch (Exception e)
            {
                _helper.LogExceptions(e);
                ViewBag.errormessage = Convert.ToString(e.StackTrace);
                //loginViewModel.masterBusinessUnitEntities = BindListBusinessUnit();
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


        public IActionResult ForGetPassword()
        {
            return View();
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
                    ViewBag.SuccessMessage = Customs.msgLinkToResetpasswordSentOnEmail;
                    return View("ForgetPassword");

                }
                else // if (responseMessage.StatusCode == HttpStatusCode.BadRequest)
                {
                    ViewBag.ErrorMessage = Customs.SomeErrorOccurred;
                }
            }
            else
            {
                ViewBag.ErrorMessage = Customs.msgEmailAddressNotExistIndatabase;
                return View("ForgetPassword");
            }
            return View(forgotPasswordViewModel);
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

        public IActionResult ProfileDetails()
        {
            return View();
        }

        public class Customs
        {
            public static string msgLinkToResetpasswordSentOnEmail = "We have send an email successfully to entered email address, please go to your mail box and follow further steps";

            public static string SomeErrorOccurred = "Some error occurred";

            public static string msgEmailAddressNotExistIndatabase = "Entered email address is not found";
        }
    }
}
