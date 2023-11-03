using Eltizam.Business.Models;
using Eltizam.Resource;
using Eltizam.Web.Helpers;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Localization;
using Newtonsoft.Json;

namespace EltizamValuation.Web.Controllers
{
    public class ValuationRequestController : Controller
    {
        #region Properties

        private readonly IConfiguration _cofiguration;
        private readonly IStringLocalizer<Shared> _stringLocalizerShared;
        private readonly IHelper _helper;

        #endregion Properties

        public ValuationRequestController(IConfiguration configuration, IStringLocalizer<Shared> stringLocalizerShared, IHelper helper)
        {
            _cofiguration = configuration;
            _stringLocalizerShared = stringLocalizerShared;
            _helper = helper;
        }

        //public IActionResult Index()
        //{
        //    return View();
        //}
        [HttpGet]
        public IActionResult ValuationRequests()
        {
            ViewBag.CurrentUserId = _helper.GetLoggedInUserId();
            return View();
        }
        public IActionResult ValuationRequestManage(int? id, string view)
        {
            if (id != null)
            {
                ViewData["IsEdit"] = true;
            }

            if (view != null)
            {
                ViewData["IsView"] = true;
            }
            ValuationRequestModel valuationRequestModel;
            if (id == null || id <= 0)
            {

                valuationRequestModel = new ValuationRequestModel();
               // Master_PropertyTypeModel master_PropertyType = new Master_PropertyTypeModel();
                //valuationRequestModel.master_PropertyType = master_PropertyType;


                return View("ValuationRequestManage", valuationRequestModel);
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

    }
}
