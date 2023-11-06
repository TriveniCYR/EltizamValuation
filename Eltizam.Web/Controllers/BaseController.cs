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
            var hasAccess  = false;
            bool view = perEnum == PermissionEnum.View;
            bool add  = perEnum == PermissionEnum.Add;
            bool edit = perEnum == PermissionEnum.Edit;

            RolePermissionModel? objPermssion = UtilityHelper.GetCntrActionAccess((int)enumP, roleId);

            if (objPermssion != null && (view == objPermssion.View) || 
                                        (add  == objPermssion.Add)  ||
                                        (edit == objPermssion.Edit))
            {
                hasAccess = true;
            } 

            ViewBag.Access = objPermssion;
            return hasAccess;
        }
    }
}