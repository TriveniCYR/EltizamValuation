using Eltizam.Resource;
using Eltizam.Web.Controllers;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Localization;
using Eltizam.Web.Helpers;
namespace EltizamValuation.Web.Controllers
{
    public class DashboardController : BaseController
    {
        private readonly IHelper _helper;

        public DashboardController(IHelper helper)
        {
            _helper = helper;
        }
        public IActionResult Dashboard()
        {
            return View();
        }
        [HttpGet]
        public IActionResult DashboardExt([FromQuery] string Module)
        {
            int roleId = _helper.GetLoggedInRoleId();
            ViewBag.ModuleName = Module;
            ViewBag.RoleId = roleId;
            return View();
        }               
    }
}
