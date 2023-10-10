using Eltizam.Web.Helpers;
using Microsoft.AspNetCore.Mvc;
using Eltizam.Web.Filters;

namespace Eltizam.Web.Controllers
{
    [CustomAuthorizeAttribute]
    //[ExceptionsFilter]
    public class BaseController : Controller
    {
    }
}