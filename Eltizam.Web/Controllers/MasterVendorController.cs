using Eltizam.Business.Models;
using Eltizam.Data.DataAccess.Entity;
using Eltizam.Data.DataAccess.Helper;
using Eltizam.Resource;
using Eltizam.Utility.Enums;
using Eltizam.Web.Controllers;
using Eltizam.Web.Helpers;
using Microsoft.AspNet.SignalR;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Localization;
using Newtonsoft.Json;

namespace EltizamValuation.Web.Controllers
{
    public class MasterVendorController : BaseController
    {
        #region Properties

        private readonly IConfiguration _cofiguration;
        private readonly IStringLocalizer<Shared> _stringLocalizerShared;
        private readonly IHelper _helper;

        #endregion Properties

        public MasterVendorController(IConfiguration configuration, IStringLocalizer<Shared> stringLocalizerShared, IHelper helper)
        {
            _cofiguration = configuration;
            _stringLocalizerShared = stringLocalizerShared;
            _helper = helper;
        }
        public IActionResult Vendors()
        {
            try
            {
                //Check permissions
                int roleId = _helper.GetLoggedInRoleId();
                if (!CheckRoleAccess(ModulePermissionEnum.VendorMaster, PermissionEnum.View, roleId))
                    return RedirectToAction(AppConstants.AccessRestriction, AppConstants.Home);
                return View();
            }
            catch (Exception e)
            {
                _helper.LogExceptions(e);
                return View("Login");
            }
        }

        public IActionResult VendorManage(int? id)
        {
            MasterVendorModel masterUser;
            //Check permissions for Get
            var action = id == null ? PermissionEnum.Add : PermissionEnum.Edit;
            int roleId = _helper.GetLoggedInRoleId();

            if (!CheckRoleAccess(ModulePermissionEnum.VendorMaster, action, roleId))
                return RedirectToAction(AppConstants.AccessRestriction, AppConstants.Home);

            if (id == null || id <= 0)
            {
                var viewModel = new MasterVendorModel
                {
                    Addresses = new List<MasterAddressEntity>(),
                    Contacts = new List<MasterContactModel>()
                };
                MasterAddressEntity addess = new MasterAddressEntity();
                MasterContactModel contact = new MasterContactModel();
                viewModel.Status = true;
                viewModel.Addresses.Add(addess);
                viewModel.Contacts.Add(contact);
                return View(viewModel);
            }
            else
            {
                HttpContext.Request.Cookies.TryGetValue(UserHelper.EltizamToken, out string token);
                APIRepository objapi = new(_cofiguration);
                HttpResponseMessage responseMessage = objapi.APICommunication(APIURLHelper.GetVendorById + "/" + id, HttpMethod.Get, token).Result;

                if (responseMessage.IsSuccessStatusCode)
                {
                    string jsonResponse = responseMessage.Content.ReadAsStringAsync().Result;
                    var data = JsonConvert.DeserializeObject<APIResponseEntity<MasterVendorModel>>(jsonResponse);

                    //Get Footer info
                    FooterInfo(TableNameEnum.Master_Vendor, _cofiguration, id);

                    //var url = string.Format("{0}/{1}/{2}", APIURLHelper.GetGlobalAuditFields, id, Enum.GetName(TableNameEnum.Master_Vendor));
                    //var footerRes = objapi.APICommunication(url, HttpMethod.Get, token).Result;
                    //if (footerRes.IsSuccessStatusCode)
                    //{
                    //    string json = footerRes.Content.ReadAsStringAsync().Result;
                    //    ViewBag.FooterInfo = JsonConvert.DeserializeObject<GlobalAuditFields>(json);
                    //}


                    if (data._object is null)
                        return NotFound();

                    if (data._object.Addresses.Count == 0)
                    {
                        MasterAddressEntity addess = new MasterAddressEntity();
                        data._object.Addresses.Add(addess);
                    }
                    if (data._object.Contacts.Count == 0)
                    {
                        MasterContactModel contact = new MasterContactModel();
                        data._object.Contacts.Add(contact);
                    }

                    return View(data._object);
                }
                return NotFound();
            }
        }


        [HttpPost]
        public IActionResult VendorManage(int id, MasterVendorModel masterUser)
        {
            try
            {
                //Check permissions for Get
                var action = masterUser.Id == 0 ? PermissionEnum.Add : PermissionEnum.Edit;

                int roleId = _helper.GetLoggedInRoleId();
                if (!CheckRoleAccess(ModulePermissionEnum.VendorMaster, action, roleId))
                    return RedirectToAction(AppConstants.AccessRestriction, AppConstants.Home);
                 
                if (masterUser != null)
                {
                    masterUser.Address = null;
                    masterUser.Contact = null;
                }
               
                if (masterUser.File != null)
                {
                    MasterDocumentModel docs = ProfileUpload(masterUser.File);
                    masterUser.uploadProfile = docs;
                    masterUser.File = null;
                }

                //Do fill audit fields
                if (masterUser.Id == 0)
                    masterUser.CreatedBy = _helper.GetLoggedInUserId();
                masterUser.ModifiedBy = _helper.GetLoggedInUserId();

                HttpContext.Request.Cookies.TryGetValue(UserHelper.EltizamToken, out string token);
                APIRepository objapi = new(_cofiguration);

                HttpResponseMessage responseMessage = objapi.APICommunication(APIURLHelper.UpsertVendor, HttpMethod.Post, token, new StringContent(JsonConvert.SerializeObject(masterUser))).Result;
                if (responseMessage.IsSuccessStatusCode && masterUser.Id==0)
                {
                    string jsonResponse = responseMessage.Content.ReadAsStringAsync().Result;
                    TempData[UserHelper.SuccessMessage] = Convert.ToString(_stringLocalizerShared["RecordInsertUpdate"]);

                    return RedirectToAction("Vendors");
                }
                if (responseMessage.IsSuccessStatusCode)
                {
                    string jsonResponse = responseMessage.Content.ReadAsStringAsync().Result;
                    TempData[UserHelper.SuccessMessage] = Convert.ToString(_stringLocalizerShared["RecordInsertUpdate"]);

                    return Redirect($"/MasterVendor/VendorManage?id={masterUser.Id}");
                }
                else
                {
                    TempData[UserHelper.ErrorMessage] = Convert.ToString(responseMessage.Content.ReadAsStringAsync().Result);
                    return RedirectToAction("VendorManage", new { id = masterUser.Id });
                }
            }
            catch (Exception e)
            {
                _helper.LogExceptions(e);
                TempData[UserHelper.ErrorMessage] = Convert.ToString(e.StackTrace);
                return RedirectToAction("VendorManage", new { Id = masterUser.Id });
            }
        }

        [HttpGet]
        [Route("MasterVendor/VendorDetail")]
        public IActionResult VendorDetail(int? id)
        {
            MasterVendorModel masterUser;
            //Check permissions for Get
            var action = id == null ? PermissionEnum.Edit : PermissionEnum.View;

            int roleId = _helper.GetLoggedInRoleId();
            if (!CheckRoleAccess(ModulePermissionEnum.VendorMaster, action, roleId))
                return RedirectToAction(AppConstants.AccessRestriction, AppConstants.Home);
            if (id == null || id <= 0)
            {
                masterUser = new MasterVendorModel();
                return View(masterUser);
            }
            else
            {
                HttpContext.Request.Cookies.TryGetValue(UserHelper.EltizamToken, out string token);
                APIRepository objapi = new(_cofiguration);
                HttpResponseMessage responseMessage = objapi.APICommunication(APIURLHelper.GetVendorById + "/" + id, HttpMethod.Get, token).Result;

                if (responseMessage.IsSuccessStatusCode)
                {
                    string jsonResponse = responseMessage.Content.ReadAsStringAsync().Result;
                    var data = JsonConvert.DeserializeObject<APIResponseEntity<MasterVendorModel>>(jsonResponse);

                    FooterInfo(TableNameEnum.Master_Vendor, _cofiguration, id, true);
                    if (data._object is null)
                        return NotFound();

                    return View(data._object);
                }
                return NotFound();
            }
        }
       
        private MasterDocumentModel ProfileUpload(IFormFile pic)
        {
            MasterDocumentModel uploadFils = new MasterDocumentModel();
            if (pic == null)
            {
                throw new ArgumentException("No files were uploaded.");
            }
            var currentUser = _helper.GetLoggedInUserId();
            var savedFileNames = new List<string>();

            //Check if the file type is allowed
           var allowedFileTypes = new List<string> { "image/jpeg", "image/png", "image/jpg" };
            if (!allowedFileTypes.Contains(pic.ContentType))
            {
                throw new ArgumentException($"File type '{pic.ContentType}' is not allowed.");
            }

            var fileName = Guid.NewGuid().ToString() + Path.GetExtension(pic.FileName);
            //var docName = Path.GetFileNameWithoutExtension(pic.FileName);
            var docName = pic.FileName;
            var filePath = Path.Combine("wwwroot/Uploads", fileName);
            filePath = filePath.Replace("\\", "/");
            using (var stream = new FileStream(filePath, FileMode.Create))
            {
                pic.CopyToAsync(stream);
            }

            // Save information about the uploaded file to the database
            var upload = new MasterDocumentModel
            {
                FileName = fileName,
                FilePath = filePath.Replace("wwwroot", ".."),
                DocumentName = docName,
                IsActive = true,
                CreatedBy = currentUser,
                FileType = pic.ContentType,
                CreatedDate = null,
                CreatedName = ""
            };

            return upload;
        }

    }
}
