using Microsoft.AspNetCore.Mvc;

namespace Eltizam.Web.Controllers
{
    public class HomeController : Controller
    {
        public IActionResult Index()
        {
            return View();
        }
    }
}
