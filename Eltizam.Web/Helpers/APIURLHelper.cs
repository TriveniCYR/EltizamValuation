using Microsoft.Extensions.Configuration;

namespace Eltizam.Web.Helpers
{
    public static class APIURLHelper
    {
        public static string LoginURL = "/api/Account/Login";
        public static string ValidateToken = "/api/Account/ValidateToken";
        public static string GetBusinessUnit = "/api/Account/GetAllBusinessUnit";
        public static string GetRegion = "/api/Account/GetAllRegion";
        public static string GetCurrency = "/api/Account/GetAllCurrency";
        public static string GetByPermisionRoleUsingRoleId = "api/Role/GetByPermisionRoleUsingRoleId";
        public static string ForgotPassword = "api/Account/ForgotPassword";
        public static string ResetPassword = "api/Account/ResetPassword";

        public static IConfiguration Configuration;




        #region DIA

        public static string GetAllDIA = "api/Dashboard/GetAllDIA";
        public static string SaveDIA = "api/Dashboard/InsertUpdateDIA";
        public static string GetDIAById = "api/Dashboard/GetDIAById";
        public static string DeleteDIAById = "api/Dashboard/DeleteDIA";

        #endregion DIA

        #region User

        public static string GetAll = "api/User/GetAll";
        public static string SaveUser = "api/User/InsertUpdateUser";
        public static string SaveTblUser = "api/User/InsertUpdateTblUser";
        public static string GetUserById = "api/User/GetUserById";
        public static string GetTblUserById = "api/User/GetTblUserById";

        // Anonymous_Access API for Forgot Passsword
        public static string Anonymous_CheckEmailAddressExists = "api/Account/CheckEmailAddressExists";

        public static string Anonymous_IsTokenValid = "api/Account/IsTokenValid";

        #endregion User


        #region Dashboard

        public static string GetAllDashboard = "api/Dashboard/FillDropdown";
        public static string GetPIDFDashBoardData = "api/Dashboard/GetPIDFByYearAndBusinessUnit";

        #endregion Dashboard

        #region Notification

        public static string GetAllNotification = "api/Notification/GetAllNotification";
        public static string GetFilteredNotifications = "api/Notification/GetFilteredNotifications";
        public static string GetWebFilteredNotifications = "Notifications/GetFilteredNotifications";
        public static string NotificationsClickedByUser = "api/Notification/NotificationsClickedByUser";
        public static string NotificationsCountUser = "api/Notification/NotificationsCountUser";

        #endregion Notification




        #region LogExceptionMethod
        public static string LogException = "api/LogException/LogException";
        #endregion


    }
}