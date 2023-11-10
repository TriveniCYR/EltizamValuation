﻿using Eltizam.Utility.Models;
using Eltizam.Utility.Utility;
using Newtonsoft.Json;

namespace Eltizam.Web.Helpers
{
    public class Helper : IHelper
    {
        private readonly IHttpContextAccessor _httpContextAccessor;
        private readonly Microsoft.Extensions.Configuration.IConfiguration _cofiguration;
        //private readonly IHelper _helper;
        public Helper(IHttpContextAccessor httpContextAccessor, Microsoft.Extensions.Configuration.IConfiguration configuration)//, IHelper helper
        {
            _httpContextAccessor = httpContextAccessor;
            _cofiguration = configuration;
            //_helper = helper;
        }

        public int GetLoggedInUserId()
        {
            return Convert.ToInt32(_httpContextAccessor.HttpContext.Session.GetString(UserHelper.LogInUserId));
        }

        public int GetLoggedInRoleId()
        {
            try
            {
                return Convert.ToInt32(_httpContextAccessor.HttpContext.Session.GetInt32(UserHelper.LogInRoleId));
            }
            catch (Exception ex)
            {
                return 0;
            }
        }

        public string IsManagementUser()
        {
            return _httpContextAccessor.HttpContext.Session.GetString(UserHelper.IsManagement);
        }

        public string GetToken()
        {
            _httpContextAccessor.HttpContext.Request.Cookies.TryGetValue(UserHelper.EltizamToken, out string token);
            return token;
        }

        public void LogExceptions(Exception ex)
        {
            try
            {
                _httpContextAccessor.HttpContext.Request.Cookies.TryGetValue(UserHelper.EltizamToken, out string token);
                APIRepository objapi = new(_cofiguration);
                System.Net.Http.HttpResponseMessage responseMessage = objapi.APICommunication(APIURLHelper.LogException, HttpMethod.Post, token, new StringContent(JsonConvert.SerializeObject(ex))).Result;

            }
            catch (Exception e)
            {

            }

        }

        public class RolePermissionModelComparer : IEqualityComparer<RolePermissionModel>
        {
            public bool Equals(RolePermissionModel x, RolePermissionModel y)
            {
                // Implement your custom equality logic here
                // For example, compare relevant properties like x.Property == y.Property
                return x.ModuleId == y.ModuleId && x.ModuleName == y.ModuleName; // Adjust this based on your class properties
            }

            public int GetHashCode(RolePermissionModel obj)
            {
                // Implement your custom hash code calculation here
                // Combine hash codes of relevant properties
                return obj.ModuleId.GetHashCode() ^ obj.ModuleName.GetHashCode(); // Adjust this based on your class properties
            }
        }

        public List<RolePermissionModel> GetMenusByRole(int loginRoleId)
        {
            IEnumerable<RolePermissionModel> objList = UtilityHelper.GetModuleRole<dynamic>(loginRoleId);
            //return objList.Distinct().ToList();
            return objList.Distinct(new RolePermissionModelComparer()).ToList();
        }
    }
}
