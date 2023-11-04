using Eltizam.Utility.Models;
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

        public List<RolePermissionModel> GetMenusByRole(int loginRoleId)
        {
            IEnumerable<RolePermissionModel> objList = UtilityHelper.GetModuleRole<dynamic>(loginRoleId); 
            return objList.ToList();
        }
    }
}
