using Eltizam.Business.Models;
using Eltizam.Utility.Enums;
using Eltizam.Utility.Models;
using Eltizam.Utility.Utility;
using Eltizam.Web.Filters;
using Eltizam.Web.Helpers;
using Microsoft.AspNetCore.Mvc;
using Newtonsoft.Json;
using System;

namespace Eltizam.Web.Controllers
{
    [CustomAuthorizeAttribute]
    //[ExceptionsFilter]
    public class BaseController : Controller
    { 
        /// <summary>
        /// Added by YReddy on 11/07/2023 for getting footer data
        /// </summary>
        /// <param name="enumT"></param>
        /// <param name="_cofiguration"></param>
        /// <param name="id"></param>
        public void FooterInfo(TableNameEnum enumT, IConfiguration _cofiguration, int? id, bool? isView = false)
        {
            ViewBag.PageViewMode = isView == true ? 1 : 0;

            if (id == null || id == 0)
                return;

            HttpContext.Request.Cookies.TryGetValue(UserHelper.EltizamToken, out string token);
            APIRepository objapi = new(_cofiguration);

            //Get FooterInfo
            var url = string.Format("{0}/{1}/{2}", APIURLHelper.GetGlobalAuditFields, id, Enum.GetName(enumT));
            var footerRes = objapi.APICommunication(url, HttpMethod.Get, token).Result;
            if (footerRes.IsSuccessStatusCode)
            {
                string json = footerRes.Content.ReadAsStringAsync().Result;
                ViewBag.FooterInfo = JsonConvert.DeserializeObject<GlobalAuditFields>(json); 
            }
        }

        /// <summary>
        /// Added by YReddy on 11/07/2023 for Check Rolewise Access
        /// </summary>
        /// <param name="enumP"></param>
        /// <param name="perEnum"></param>
        /// <param name="roleId"></param>
        /// <returns></returns>
        public bool CheckRoleAccess(ModulePermissionEnum enumP, PermissionEnum perEnum, int roleId, SubModuleEnum enumSM = 0)
        {
            var hasAccess = false;
            bool view = perEnum == PermissionEnum.View;
            bool add = perEnum == PermissionEnum.Add;
            bool edit = perEnum == PermissionEnum.Edit;
            bool assign = perEnum == PermissionEnum.Approve;

            RolePermissionModel? objPermssion = UtilityHelper.GetCntrActionAccess((int)enumP, roleId, (int)enumSM);

            if (objPermssion != null)
            {
                if ((view == objPermssion.View) || (add == objPermssion.Add) || (edit == objPermssion.Edit) || (assign == objPermssion.Approve))
                {
                    hasAccess = true;
                }
            }

            ViewBag.Access = objPermssion;
            return hasAccess;
        }

        /// <summary>
        /// Added by YReddy on 11/07/2023 for Check Rolewise Access
        /// </summary>
        /// <param name="enumP"></param>
        /// <param name="perEnum"></param>
        /// <param name="roleId"></param>
        /// <returns></returns>
        public RolePermissionModel GetRoleAccessValuations(ModulePermissionEnum enumP, int roleId, SubModuleEnum enumSM = 0)
        {
            var objPermssion = UtilityHelper.GetCntrActionAccess((int)enumP, roleId, (int)enumSM);
            return objPermssion;
        }

        /// <summary>
        /// Added by YReddy on 11/07/2023 for Check Rolewise Access
        /// </summary>
        /// <param name="enumP"></param>
        /// <param name="perEnum"></param>
        /// <param name="roleId"></param>
        /// <returns></returns>
        public bool CheckRoleValuationRequestAccess(int roleId, int? valrefId)
        {
            var hasAccess = false;   
            return hasAccess;
        }
    }
}