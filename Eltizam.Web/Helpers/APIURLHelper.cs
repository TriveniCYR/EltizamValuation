using Microsoft.Extensions.Configuration;

namespace Eltizam.Web.Helpers
{
    public static class APIURLHelper
    {
        public static IConfiguration Configuration;

        public static string LoginURL = "/api/Account/Login";
        public static string ValidateToken = "/api/Account/ValidateToken";
        public static string GetBusinessUnit = "/api/Account/GetAllBusinessUnit";
        public static string GetRegion = "/api/Account/GetAllRegion";
        public static string GetCurrency = "/api/Account/GetAllCurrency"; 
        public static string ForgotPassword = "api/Account/ForgotPassword";
        public static string ResetPassword = "api/Account/ResetPassword";
        public static string Anonymous_CheckEmailAddressExists = "api/Account/CheckEmailAddressExists"; 
        public static string Anonymous_IsTokenValid = "api/Account/IsTokenValid";
        public static string ChangePassword = "api/Account/ChangePassword"; 

        #region MasterCommon

        public static string GetDepartmentList = "api/MasterDepartment/GetDepartmentList";
        public static string GetRoleList = "api/MasterUser/GetRoleList";
        public static string GetApproverList = "api/MasterUser/GetApproverList";
        public static string GetDesignationList = "api/MasterDesignation/GetDesignationList";
        public static string GetResourceTypeList = "api/MasterUser/GetResourceTypeList";
        public static string GetCountryList = "api/MasterCountry/GetCountryList";
        public static string GetStateList = "api/MasterState/GetStateList";
        public static string GetStateListByCountryId = "api/MasterState/GetStateListByCountryId";
        public static string GetCityList = "api/MasterCity/GetCityList";
        public static string GeCityListByStateId = "api/MasterCity/GetCityListByStateId";
        public static string GetClientTypeList = "api/MasterClientType/GetClientTypeList";
        public static string GetByPermisionRoleUsingRoleId = "api/MasterRole/GetByPermisionRoleUsingRoleId";

        #endregion MasterCommon
         

        #region User

        public static string GetAll = "api/MasterUser/GetAll";
        public static string UpsertUser = "api/MasterUser/Upsert";
        public static string GetUserById = "api/MasterUser/GetById";
        public static string DeleteUserById = "api/MasterUser/Delete";
        public static string GetGlobalAuditFields = "api/MasterUser/GetGlobalAuditFields";

        #endregion User

        #region Designation
        public static string UpsertDesignation = "api/MasterDesignation/Upsert";
        public static string GetAllDesignation = "api/MasterDesignation/GetAll";
        public static string GetesignationById = "api/MasterDesignation/GetById";
        public static string DeleteDesignationById = "api/MasterDesignation/Delete";
        #endregion Designation

        #region Department
        public static string UpsertDepartment = "api/MasterDepartment/Upsert";
        public static string GetAllDepartment = "api/MasterDepartment/GetAll";
        public static string GetDepartmentById = "api/MasterDepartment/GetById";
        public static string DeleteDepartmentById = "api/MasterDepartment/Delete";

        #endregion Department

        #region MasterProperty
        public static string UpsertProperty = "api/MasterProperty/Upsert";
        public static string GetAllProperty = "api/MasterProperty/GetAll";
        public static string GetPropertyById = "api/MasterProperty/GetById";
        public static string DeletePropertyById = "api/MasterProperty/Delete";
        public static string GetPropertyByFilters = "api/MasterProperty/getPropertyByFilters";
        public static string GetPropertyAmenityList = "api/MasterProperty/GetPropertyAmenityList";

        #endregion MasterProperty

        #region MasterPropertyType
        public static string UpsertPropertyType = "api/MasterPropertyType/Upsert";
        public static string GetAllPropertyType = "api/MasterPropertyType/GetAll";
        public static string GetPropertyTypeById = "api/MasterPropertyType/GetById";
        public static string DeletePropertyTypeById = "api/MasterPropertyType/Delete";
        public static string GetPropertyTypeList = "api/MasterPropertyType/GetAllList";
        public static string CheckPropertyTypeExists = "api/MasterPropertyType/CheckPropertTypeExists";

        #endregion MasterPropertyType

        #region MasterPropertySubType
        public static string UpsertPropertySubType = "api/MasterPropertySubType/Upsert";
        public static string GetAllPropertySubType = "api/MasterPropertySubType/GetAllProperty";
        public static string GetPropertyByIdSubType = "api/MasterPropertySubType/GetById";
        public static string GetPropertyByPropertyTypeId = "api/MasterPropertySubType/GetByPropertyTypeId";
        public static string DeletePropertytByIdSubType = "api/MasterPropertySubType/Delete";

        #endregion MasterPropertyType

        #region MasterOwnershipType
        public static string UpsertOwnershipType = "api/MasterOwnershipType/Upsert";
        public static string GetAllOwnershipType = "api/MasterOwnershipType/GetAll";
        public static string GetOwnershipType = "api/MasterOwnershipType/GetById";
        public static string DeleteOwnershipType = "api/MasterOwnershipType/Delete";
        public static string OwnershipTypeList = "api/MasterOwnershipType/GetAllOwnershipType";

        #endregion MasterOwnershipType

        #region Valuation Fees
        public static string UpsertValuation = "api/MasterValuationFees/Upsert";
        public static string GetAllValuation = "api/MasterValuationFees/GetAll";
        public static string GetValuationById = "api/MasterValuationFees/GetById";
        public static string DeleteValuationById = "api/MasterValuationFees/Delete";

        #endregion Valuation Fees

        #region Valuation Fees Type
        public static string UpsertValuationFeeType = "api/MasterValuationFeeType/Upsert";
        public static string GetAllValuationFeeType = "api/MasterValuationFeeType/GetAll";
        public static string GetValuationFeeTypeById = "api/MasterValuationFeeType/GetById";
        public static string DeleteValuationFeeTypeById = "api/MasterValuationFeeType/Delete";
        public static string ValuationFeeTypeList = "api/MasterValuationFeeType/GetAllValuationFeeType";

        #endregion Valuation Fees Type

        #region ClientType

        public static string GetSearchClientType = "api/MasterClientType/GetAllClientType";
        public static string GetClientTypeById = "api/MasterClientType/GetById";
        public static string UpsertClientType = "api/MasterClientType/Upsert";
        public static string DeleteClientType = "api/MasterClientType/DeleteClientType";

        #endregion ClientType

        #region Client

        public static string GetSearchClient = "api/MasterClient/GetAllClient";
        public static string GetClientById = "api/MasterClient/GetById";
        public static string UpsertClient = "api/MasterClient/Upsert";
        public static string DeleteClient = "api/MasterClient/DeleteClient";
        public static string GetClientByClientTypeId = "api/MasterClient/getByClientTypeId";

        #endregion Client

        #region Role Management
        public static string GetAllRole = "api/MasterRole/GetAll";
        public static string GetAllActiveRole = "api/MasterRole/GetAllActiveRole";
        public static string GetRoleById = "api/MasterRole/GetRoleById";
        public static string SaveRole = "api/MasterRole/InsertUpdateRole";
        public static string DeleteRoleById = "api/MasterRole/DeleteRole";
        #endregion Role Management

        #region Location Management
        public static string GetAllLocations = "api/MasterLocation/GetAll";
        public static string UpsertLocation = "api/MasterLocation/Upsert";
        public static string GetLocationById = "api/MasterLocation/GetById";
        public static string DeleteLocationById = "api/MasterLocation/Delete";
        
        #endregion Location Management

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

        #region Vendor

        public static string GetSearchVendor = "api/MasterVendor/GetAll";
        public static string GetVendorById = "api/MasterVendor/GetById";
        public static string UpsertVendor = "api/MasterVendor/Upsert";
        public static string DeleteVendor = "api/MasterVendor/Delete";

        #endregion Vendor


        #region LogExceptionMethod
        public static string LogException = "api/LogException/LogException";
        #endregion

        #region Module

        public static string GetAllModule = "api/MasterModule/GetAllModule";

        #endregion Module

        #region Dictionary Management
        public static string GetAllDictionary = "api/MasterDictionary/GetAll";
        public static string UpsertDictionary = "api/MasterDictionary/Upsert";
        public static string GetDictionaryById = "api/MasterDictionary/GetById";
        //public static string DeleteDictionary = "api/MasterDictionary/Delete";
        public static string DeleteDictionaryById = "api/MasterDictionary/Delete";
        public static string UpsertMasterDictionary = "api/MasterDictionary/UpsertMasterDictionary";
        public static string GetDictionaryDetailsById = "api/MasterDictionary/GetDictionaryDetailsById";
        public static string GetDictionaryWithSubDetails = "api/MasterDictionary/GetDictionaryWithSubDetails";

        #endregion Dictionary Management

        #region Valuation Request

        public static string GetAllValuationRequest = "api/ValuationRequest/GetAllValuationRequest";
        public static string GetAllValuationRequestStatus = "api/ValuationRequestStatus/GetAll";
        public static string AssignApprover = "api/ValuationRequest/AssignApprover";
        public static string ValuationMethod = "api/ValuationRequest/GetAllValuationMethod";
        public static string UpsertValuationRequest = "api/ValuationRequest/Upsert";

        #endregion Valuation Request


        #region AuditLog
        public static string GetAllAudit = "api/AuditLog/GetAll";
        public static string GetDetailsAudit = "api/AuditLog/GetLogDetailsByFilters";
        public static string GetAuditTableName = "api/AuditLog/GetAllAuditLogTableName";

        #endregion AuditLog

    }
}