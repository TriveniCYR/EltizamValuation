using Eltizam.Business.Models;
using Eltizam.Resource;
using Eltizam.Web.Helpers;
using Microsoft.AspNet.SignalR.Json;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Localization;
using Newtonsoft.Json;

namespace EltizamValuation.Web.Controllers
{
    public class NotificationController : Controller
    {

        #region Properties

        private readonly IConfiguration _cofiguration;
        private readonly IStringLocalizer<Shared> _stringLocalizerShared;
        private readonly IHelper _helper;

        #endregion Properties

        public NotificationController(IConfiguration configuration, IStringLocalizer<Shared> stringLocalizerShared, IHelper helper)
        {
            _cofiguration = configuration;
            _stringLocalizerShared = stringLocalizerShared;
            _helper = helper;
        }


        public IActionResult Notifications()
        {
            ModelState.Clear();
            try
            {
                return View();
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







