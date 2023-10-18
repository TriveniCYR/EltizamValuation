using Eltizam.Web.Models;
using Microsoft.AspNetCore.Mvc;
using System.Diagnostics;

namespace Eltizam.Web.Controllers
{
    public class HomeController : Controller
    {
        public IActionResult Index()
        {
            return View();
        }

        [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
        public IActionResult Error()
        {
            return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
        }

        public IActionResult AccessRestriction()
        {
            return View();
        }
        public IActionResult InternalServerError()
        {
            return View();
        }
    }
}
