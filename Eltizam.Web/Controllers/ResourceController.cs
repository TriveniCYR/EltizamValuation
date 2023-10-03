using Microsoft.AspNetCore.Mvc;

namespace EltizamValuation.Web.Controllers
{
    public class ResourceController : Controller
    {
        public IActionResult Resource()
        {
            return View();
        }

        public IActionResult AddResource()
        {
            return View();
        }

        public IActionResult Edit(int id)
        {
            // Perform your edit logic here
            // You can return a view or perform any other necessary actions.
            return View();
        }
    }
}
