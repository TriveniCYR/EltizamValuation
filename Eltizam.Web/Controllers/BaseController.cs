using Eltizam.Web.Helpers;
using Microsoft.AspNetCore.Mvc;
using Eltizam.Web.Filters;

namespace EmcureNPD.Web.Controllers
{
    [CustomAuthorizeAttribute]
    //[ExceptionsFilter]
    public class BaseController : Controller
    {
    }
}