﻿using Microsoft.Extensions.Configuration;

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

        #region CasterCommon

        public static string GetDepartmentList = "api/Department/GetDepartmentList";
        public static string GetRoleList = "api/User/GetRoleList";
        public static string GetDesignationList = "api/Designation/GetDesignationList";
        public static string GetResourceTypeList = "api/User/GetResourceTypeList";
        public static string GetCountryList = "api/Country/GetCountryList";
        public static string GetStateList = "api/State/GetStateList";
        public static string GetCityList = "api/City/GetCityList";

        #endregion CasterCommon

        #region DIA

        public static string GetAllDIA = "api/Dashboard/GetAllDIA";
        public static string SaveDIA = "api/Dashboard/InsertUpdateDIA";
        public static string GetDIAById = "api/Dashboard/GetDIAById";
        public static string DeleteDIAById = "api/Dashboard/DeleteDIA";

        #endregion DIA

        #region User

        public static string GetAll = "api/User/GetAll";
        public static string UpsertUser = "api/User/Upsert";
        public static string SaveTblUser = "api/User/InsertUpdateTblUser";
        public static string GetUserById = "api/User/GetById";
        public static string GetTblUserById = "api/User/GetTblUserById";

        // Anonymous_Access API for Forgot Passsword
        public static string Anonymous_CheckEmailAddressExists = "api/Account/CheckEmailAddressExists";

        public static string Anonymous_IsTokenValid = "api/Account/IsTokenValid";

        #endregion User

        #region Designation
        public static string UpsertDesignation = "api/Designation/Upsert";
        public static string GetAllDesignation = "api/Designation/GetAll";
        public static string GetesignationById = "api/Designation/GetById";
        public static string DeleteesignationById = "api/Designation/Delete";
        #endregion Designation

        #region Department
        public static string UpsertDepartment = "api/Department/Upsert";
        public static string GetAllDepartment = "api/Department/GetAll";
        public static string GetDepartmentById = "api/Department/GetById";
        public static string DeleteDepartmentById = "api/Department/Delete";

        #endregion Department

        #region ClientType

        public static string GetSearchClientType = "api/MasterClientType/GetAllClientType";
        public static string GetClientTypeById = "api/MasterClientType/getById";
        public static string UpsertClientType = "api/MasterClientType/Upsert";

        #endregion ClientType

        #region Role Management
        public static string GetAllRole = "api/Role/GetAllRole";
        public static string GetAllActiveRole = "api/Role/GetAllActiveRole";
        public static string GetRoleById = "api/Role/GetRoleById";
        public static string SaveRole = "api/Role/InsertUpdateRole";
        public static string DeleteRoleById = "api/Role/DeleteRole";
        #endregion Role Management

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

        #region Module

        public static string GetAllModule = "api/Module/GetAllModule";

        #endregion Module


    }
}