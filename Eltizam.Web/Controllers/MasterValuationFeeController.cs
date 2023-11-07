using Eltizam.Business.Models;
using Eltizam.Data.DataAccess.Entity;
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
    public class MasterValuationFeeController : BaseController
    {

        #region Properties

        private readonly IConfiguration _cofiguration;
        private readonly IStringLocalizer<Shared> _stringLocalizerShared;
        private readonly IHelper _helper;

        #endregion Properties

        public MasterValuationFeeController(IConfiguration configuration, IStringLocalizer<Shared> stringLocalizerShared, IHelper helper)
        {
            _cofiguration = configuration;
            _stringLocalizerShared = stringLocalizerShared;
            _helper = helper;
        }

        public IActionResult ValuationFees()
        {
            ModelState.Clear();
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
                ViewBag.errormessage = Convert.ToString(e.StackTrace);
                return View("Login");
            } 
        } 


        [HttpPost]
        [Route("MasterValuationFee/ValuationFeeManage")]
        public IActionResult MasterValuationFee(int id, MasterValuationFeesModel masterValuationFeesModel)
        {
            try
            {
                //Check permissions for Get
                var action = masterValuationFeesModel.Id == 0 ? PermissionEnum.Add : PermissionEnum.Edit;

                int roleId = _helper.GetLoggedInRoleId();
                if (!CheckRoleAccess(ModulePermissionEnum.UserMaster, action, roleId))
                    return RedirectToAction(AppConstants.AccessRestriction, AppConstants.Home);

                //Do fill audit fields
                if (masterValuationFeesModel.Id == 0)
                    masterValuationFeesModel.CreatedBy = _helper.GetLoggedInUserId();
                masterValuationFeesModel.ModifiedBy = _helper.GetLoggedInUserId();

                HttpContext.Request.Cookies.TryGetValue(UserHelper.EltizamToken, out string token);
                APIRepository objapi = new(_cofiguration); 
                HttpResponseMessage responseMessage = objapi.APICommunication(APIURLHelper.UpsertValuation, HttpMethod.Post, token, new StringContent(JsonConvert.SerializeObject(masterValuationFeesModel))).Result;

                if (responseMessage.IsSuccessStatusCode)
                {
                    TempData["StatusMessage"] = "Saved Successfully";
                    string jsonResponse = responseMessage.Content.ReadAsStringAsync().Result;
                    ModelState.Clear();
                    return RedirectToAction(nameof(ValuationFees));
                }
                else
                    TempData["StatusMessage"] = "Some Eror Occured";
            }
            catch (Exception e)
            {
                _helper.LogExceptions(e); 
                ModelState.Clear();
                return View(nameof(ValuationFees));
            }
            ModelState.Clear();
            return RedirectToAction(nameof(ValuationFees));
        }


        public IActionResult ValuationFeeManage(int? id, string view)
        {
            if (id != null)
            {
                ViewData["IsEdit"] = true;
            }

            if (view != null)
            {
                ViewData["IsView"] = true;
            }
            MasterValuationFeesModel masterValuationFeesModel;
            //Check permissions for Get
            var action = id == null ? PermissionEnum.Add : PermissionEnum.Edit;
            int roleId = _helper.GetLoggedInRoleId();

            if (!CheckRoleAccess(ModulePermissionEnum.UserMaster, action, roleId))
                return RedirectToAction(AppConstants.AccessRestriction, AppConstants.Home);
            if (id == null || id <= 0)
            {
				masterValuationFeesModel = new MasterValuationFeesModel();
                return View(masterValuationFeesModel);
            }
            else
            {
                HttpContext.Request.Cookies.TryGetValue(UserHelper.EltizamToken, out string token);
                APIRepository objapi = new(_cofiguration);
                HttpResponseMessage responseMessage = objapi.APICommunication(APIURLHelper.GetValuationById + "/" + id, HttpMethod.Get, token).Result;

                if (responseMessage.IsSuccessStatusCode)
                {
                    string jsonResponse = responseMessage.Content.ReadAsStringAsync().Result;
                    var data = JsonConvert.DeserializeObject<APIResponseEntity<MasterValuationFeesModel>>(jsonResponse);

                    //Get Footer info
                    FooterInfo(TableNameEnum.Master_ValuationFee, _cofiguration, id);

                    //var url = string.Format("{0}/{1}/{2}", APIURLHelper.GetGlobalAuditFields, id, Enum.GetName(TableNameEnum.Master_ValuationFee));
                    //var footerRes = objapi.APICommunication(url, HttpMethod.Get, token).Result;
                    //if (footerRes.IsSuccessStatusCode)
                    //{
                    //    string json = footerRes.Content.ReadAsStringAsync().Result;
                    //    ViewBag.FooterInfo = JsonConvert.DeserializeObject<GlobalAuditFields>(json);
                    //}


                    if (data._object is null)
                        return NotFound();

                    return View(data._object);
                }
                return NotFound();
            }
        }

		[HttpGet]
		[Route("MasterValuationFee/ValuationFeeDetail")]
		public IActionResult ValuationFeesDetail(int? id)
		{
			MasterValuationFeesModel masterValuationFeesModel;
            var action = id == null ? PermissionEnum.Edit : PermissionEnum.View;
            int roleId = _helper.GetLoggedInRoleId();

            if (!CheckRoleAccess(ModulePermissionEnum.UserMaster, action, roleId))
                return RedirectToAction(AppConstants.AccessRestriction, AppConstants.Home);

            if (id == null || id <= 0)
			{
				masterValuationFeesModel = new MasterValuationFeesModel();
				return RedirectToAction("MasterValuationFee");
			}
			else
			{
				HttpContext.Request.Cookies.TryGetValue(UserHelper.EltizamToken, out string token);
				APIRepository objapi = new(_cofiguration);
				HttpResponseMessage responseMessage = objapi.APICommunication(APIURLHelper.GetValuationById + "/" + id, HttpMethod.Get, token).Result;

				if (responseMessage.IsSuccessStatusCode)
				{
					string jsonResponse = responseMessage.Content.ReadAsStringAsync().Result;
					var data = JsonConvert.DeserializeObject<APIResponseEntity<MasterValuationFeesModel>>(jsonResponse);
					if (data._object is null)
						return NotFound();

					return View("ValuationFeeDetail",data._object);
				}
				return NotFound();
			}
		}


		//[HttpGet]
  //      [Route("ValuationFees/ValuationView")]
  //      public IActionResult ValuationView(int? id)
  //      {

  //          MasterValuationFeesModel masterValuationFeesModel;
  //          if (id == null || id <= 0)
  //          {
		//		masterValuationFeesModel = new MasterValuationFeesModel();
  //              return View(masterValuationFeesModel);
  //          }
  //          else
  //          {
  //              HttpContext.Request.Cookies.TryGetValue(UserHelper.EltizamToken, out string token);
  //              APIRepository objapi = new(_cofiguration);
  //              HttpResponseMessage responseMessage = objapi.APICommunication(APIURLHelper.GetValuationById + "/" + id, HttpMethod.Get, token).Result;

  //              if (responseMessage.IsSuccessStatusCode)
  //              {
  //                  string jsonResponse = responseMessage.Content.ReadAsStringAsync().Result;
  //                  var data = JsonConvert.DeserializeObject<APIResponseEntity<MasterValuationFeesModel>>(jsonResponse);
  //                  if (data._object is null)
  //                      return NotFound();

  //                  return View(data._object);
  //              }
  //              return NotFound();
  //          }
  //      }
    }
}







