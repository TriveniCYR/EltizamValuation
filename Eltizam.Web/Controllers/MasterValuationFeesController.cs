using Eltizam.Business.Models;
using Eltizam.Resource;
using Eltizam.Utility.Enums;
using Eltizam.Utility.Models;
using Eltizam.Utility.Utility;
using Eltizam.Web.Helpers;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Localization;
using Newtonsoft.Json;
using System.Data;

namespace EltizamValuation.Web.Controllers
{
    public class MasterValuationFeesController : Controller
    {

        #region Properties

        private readonly IConfiguration _cofiguration;
        private readonly IStringLocalizer<Shared> _stringLocalizerShared;
        private readonly IHelper _helper;

        #endregion Properties

        public MasterValuationFeesController(IConfiguration configuration, IStringLocalizer<Shared> stringLocalizerShared, IHelper helper)
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
                //int rolId = _helper.GetLoggedInRoleId();
                //RolePermissionModel objPermssion = UtilityHelper.GetCntrActionAccess((int)ModulePermissionEnum.RoleMaster, rolId);
                //ViewBag._objPermission = objPermssion;
                //HttpContext.Request.Cookies.TryGetValue(UserHelper.EltizamToken, out string token);
                //APIRepository objapi = new APIRepository(_cofiguration);
                //List<MasterValuationFeesModel> oRoleList = new List<MasterValuationFeesModel>();
                //HttpResponseMessage responseMessage = objapi.APICommunication(APIURLHelper.GetAllValuation, HttpMethod.Post, token).Result;
                //if (responseMessage.IsSuccessStatusCode)
                //{
                //    string jsonResponse = responseMessage.Content.ReadAsStringAsync().Result;
                //    var data = JsonConvert.DeserializeObject<APIResponseEntity<List<MasterValuationFeesModel>>>(jsonResponse);
                //    oRoleList = data._object;

                //    return View(oRoleList);
                //}
                return View();
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
        [Route("ValuationFees/ValuationFeesManage")]
        public IActionResult ValuationFeesManage(int id, MasterValuationFeesModel masterValuationFeesModel)
        {
            try
            {
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
                ViewBag.errormessage = Convert.ToString(e.StackTrace);
                ModelState.Clear();
                return View(nameof(ValuationFees));
            }
            ModelState.Clear();
            return RedirectToAction(nameof(ValuationFees));
        }


        public IActionResult ValuationFeesManage(int? id, string view)
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
                    if (data._object is null)
                        return NotFound();

                    return View(data._object);
                }
                return NotFound();
            }
        }

		[HttpGet]
		[Route("ValuationFees/ValuationFeesDetail")]
		public IActionResult ValuationFeesDetail(int? id)
		{
			MasterValuationFeesModel masterValuationFeesModel;
			if (id == null || id <= 0)
			{
				masterValuationFeesModel = new MasterValuationFeesModel();
				return RedirectToAction("ValuationFees");
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

					return View(data._object);
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







