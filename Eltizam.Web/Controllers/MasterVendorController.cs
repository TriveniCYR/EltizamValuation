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
                if (!CheckRoleAccess(ModulePermissionEnum.UserMaster, PermissionEnum.View, roleId))
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

            if (!CheckRoleAccess(ModulePermissionEnum.UserMaster, action, roleId))
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

                    //Get FooterInfo
                    var url = string.Format("{0}/{1}/{2}", APIURLHelper.GetGlobalAuditFields, id, Enum.GetName(TableNameEnum.Master_Vendor));
                    var footerRes = objapi.APICommunication(url, HttpMethod.Get, token).Result;
                    if (footerRes.IsSuccessStatusCode)
                    {
                        string json = footerRes.Content.ReadAsStringAsync().Result;
                        ViewBag.FooterInfo = JsonConvert.DeserializeObject<GlobalAuditFields>(json);
                    }


                    if (data._object is null)
                        return NotFound();

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
                if (!CheckRoleAccess(ModulePermissionEnum.UserMaster, action, roleId))
                    return RedirectToAction(AppConstants.AccessRestriction, AppConstants.Home);
                if (masterUser != null)
                {
                    masterUser.Address = (masterUser.Address == null) ? null : masterUser.Address;
                    masterUser.Contact = (masterUser.Contact == null) ? null : masterUser.Contact;
                }
                if (masterUser.Id == 0)
                masterUser.CreatedBy = _helper.GetLoggedInUserId();
                masterUser.ModifiedBy = _helper.GetLoggedInUserId();

                HttpContext.Request.Cookies.TryGetValue(UserHelper.EltizamToken, out string token);
                APIRepository objapi = new(_cofiguration);

                HttpResponseMessage responseMessage = objapi.APICommunication(APIURLHelper.UpsertVendor, HttpMethod.Post, token, new StringContent(JsonConvert.SerializeObject(masterUser))).Result;

                if (responseMessage.IsSuccessStatusCode)
                {
                    string jsonResponse = responseMessage.Content.ReadAsStringAsync().Result;
                    TempData[UserHelper.SuccessMessage] = Convert.ToString(_stringLocalizerShared["RecordInsertUpdate"]);

                    return RedirectToAction("Vendors");
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
            var action = id == null ? PermissionEnum.Edit :PermissionEnum.View;

            int roleId = _helper.GetLoggedInRoleId();
            if (!CheckRoleAccess(ModulePermissionEnum.UserMaster, action, roleId))
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
                    if (data._object is null)
                        return NotFound();

                    return View(data._object);
                }
                return NotFound();
            }
        }
        private List<MasterDocumentModel> FileUpload(DocumentFilesModel document)
        {
            List<MasterDocumentModel> uploadFils = new List<MasterDocumentModel>();
            if (document.Files == null || document.Files.Count == 0)
            {
                throw new ArgumentException("No files were uploaded.");
            }

            var savedFileNames = new List<string>();

            foreach (var file in document.Files)
            {
                if (file == null || file.Length == 0)
                {
                    continue;
                }

                // Check if the file type is allowed
                var allowedFileTypes = new List<string> { "image/jpeg", "image/png", "application/msword", "application/pdf" };
                if (!allowedFileTypes.Contains(file.ContentType))
                {
                    throw new ArgumentException($"File type '{file.ContentType}' is not allowed.");
                }

                var fileName = Guid.NewGuid().ToString() + Path.GetExtension(file.FileName);
                var filePath = Path.Combine("wwwroot/Uploads", fileName);


                using (var stream = new FileStream(filePath, FileMode.Create))
                {
                    file.CopyToAsync(stream);
                }

                // Save information about the uploaded file to the database
                var upload = new MasterDocumentModel
                {
                    FileName = fileName,
                    FilePath = filePath,
                    DocumentName = document.DocumentName,
                    IsActive = 1,
                    FileType = GetFileType(file.ContentType)
                };

                uploadFils.Add(upload);
            }
            return uploadFils;
        }

        private string GetFileType(string contentType)
        {
            switch (contentType)
            {
                case "image/jpeg":
                case "image/png":
                    return "Image";
                case "application/msword":
                    return "Word";
                case "application/pdf":
                    return "PDF";
                default:
                    return "Unknown";
            }
        }

    }
}
