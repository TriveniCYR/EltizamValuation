using Eltizam.Utility.Enums;
using Eltizam.Utility.Models;
using Eltizam.Utility.Utility;
using Eltizam.Web.Filters;
using Microsoft.AspNetCore.Mvc;

namespace Eltizam.Web.Controllers
{
    [CustomAuthorizeAttribute]
    //[ExceptionsFilter]
    public class BaseController : Controller
    { 
        public bool CheckRoleAccess(ModulePermissionEnum enumP, PermissionEnum perEnum, int roleId)
        {
            RolePermissionModel objPermssion = UtilityHelper.GetCntrActionAccess((int)ModulePermissionEnum.UserMaster, roleId);
            if (objPermssion == null || !(objPermssion.View || objPermssion.Add || objPermssion.Edit))
            {
               return false;
            }

            ViewBag.Access = objPermssion;
            return true;
        }
    }
}