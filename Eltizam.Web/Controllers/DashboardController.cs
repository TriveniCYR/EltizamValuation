using Eltizam.Web.Controllers;
using Microsoft.AspNetCore.Mvc;

namespace EltizamValuation.Web.Controllers
{
    public class DashboardController : BaseController
    {
        public IActionResult Dashboard()
        {
            return View();
        }
    }
}
