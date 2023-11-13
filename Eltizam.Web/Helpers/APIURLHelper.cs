using Microsoft.Extensions.Configuration;

namespace Eltizam.Web.Helpers
{
    public static class APIURLHelper
    {
        public static IConfiguration Configuration;

        public static string LoginURL = "/api/v1/Account/Login";
        public static string ValidateToken = "/api/v1/Account/ValidateToken";
        public static string GetBusinessUnit = "/api/v1/Account/GetAllBusinessUnit";
        public static string GetRegion = "/api/v1/Account/GetAllRegion";
        public static string GetCurrency = "/api/v1/Account/GetAllCurrency"; 
        public static string ForgotPassword = "api/v1/Account/ForgotPassword";
        public static string ResetPassword = "api/v1/Account/ResetPassword";
        public static string Anonymous_CheckEmailAddressExists = "api/v1/Account/CheckEmailAddressExists"; 
        public static string Anonymous_IsTokenValid = "api/v1/Account/IsTokenValid";
        public static string ChangePassword = "api/v1/Account/ChangePassword"; 

        #region MasterCommon

        public static string GetDepartmentList = "api/v1/MasterDepartment/GetDepartmentList";
        public static string GetRoleList = "api/v1/MasterUser/GetRoleList";
        public static string GetApproverList = "api/v1/MasterUser/GetApproverList";
        public static string GetDesignationList = "api/v1/MasterDesignation/GetDesignationList";
        public static string GetResourceTypeList = "api/v1/MasterUser/GetResourceTypeList";
        public static string GetCountryList = "api/v1/MasterCountry/GetCountryList";
        public static string GetStateList = "api/v1/MasterState/GetStateList";
        public static string GetStateListByCountryId = "api/v1/MasterState/GetStateListByCountryId";
        public static string GetCityList = "api/v1/MasterCity/GetCityList";
        public static string GeCityListByStateId = "api/v1/MasterCity/GetCityListByStateId";
        public static string GetClientTypeList = "api/v1/MasterClientType/GetClientTypeList";
        public static string GetByPermisionRoleUsingRoleId = "api/v1/MasterRole/GetByPermisionRoleUsingRoleId";

        #endregion MasterCommon
         

        #region User

        public static string GetAll = "api/v1/MasterUser/GetAll";
        public static string UpsertUser = "api/v1/MasterUser/Upsert";
        public static string GetUserById = "api/v1/MasterUser/GetById";
        public static string DeleteUserById = "api/v1/MasterUser/Delete";
        public static string GetGlobalAuditFields = "api/v1/MasterUser/GetGlobalAuditFields";
        public static string GetUserNameList = "api/v1/MasterUser/GetAllUserList";

        #endregion User

        #region Designation
        public static string UpsertDesignation = "api/v1/MasterDesignation/Upsert";
        public static string GetAllDesignation = "api/v1/MasterDesignation/GetAll";
        public static string GetesignationById = "api/v1/MasterDesignation/GetById";
        public static string DeleteDesignationById = "api/v1/MasterDesignation/Delete";
        #endregion Designation

        #region Department
        public static string UpsertDepartment = "api/v1/MasterDepartment/Upsert";
        public static string GetAllDepartment = "api/v1/MasterDepartment/GetAll";
        public static string GetDepartmentById = "api/v1/MasterDepartment/GetById";
        public static string DeleteDepartmentById = "api/v1/MasterDepartment/Delete";

        #endregion Department

        #region MasterProperty
        public static string UpsertProperty = "api/v1/MasterProperty/Upsert";
        public static string GetAllProperty = "api/v1/MasterProperty/GetAll";
        public static string GetPropertyById = "api/v1/MasterProperty/GetById";
        public static string DeletePropertyById = "api/v1/MasterProperty/Delete";
        public static string GetPropertyByFilters = "api/v1/MasterProperty/getPropertyByFilters";
        public static string GetPropertyAmenityList = "api/v1/MasterProperty/GetPropertyAmenityList";

        #endregion MasterProperty

        #region MasterPropertyType
        public static string UpsertPropertyType = "api/v1/MasterPropertyType/Upsert";
        public static string GetAllPropertyType = "api/v1/MasterPropertyType/GetAll";
        public static string GetPropertyTypeById = "api/v1/MasterPropertyType/GetById";
        public static string DeletePropertyTypeById = "api/v1/MasterPropertyType/Delete";
        public static string GetPropertyTypeList = "api/v1/MasterPropertyType/GetAllList";
        public static string CheckPropertyTypeExists = "api/v1/MasterPropertyType/CheckPropertTypeExists";

        #endregion MasterPropertyType

        #region MasterPropertySubType
        public static string UpsertPropertySubType = "api/v1/MasterPropertySubType/Upsert";
        public static string GetAllPropertySubType = "api/v1/MasterPropertySubType/GetAllProperty";
        public static string GetPropertyByIdSubType = "api/v1/MasterPropertySubType/GetById";
        public static string GetPropertyByPropertyTypeId = "api/v1/MasterPropertySubType/GetByPropertyTypeId";
        public static string DeletePropertytByIdSubType = "api/v1/MasterPropertySubType/Delete";

        #endregion MasterPropertyType

        #region MasterOwnershipType
        public static string UpsertOwnershipType = "api/v1/MasterOwnershipType/Upsert";
        public static string GetAllOwnershipType = "api/v1/MasterOwnershipType/GetAll";
        public static string GetOwnershipType = "api/v1/MasterOwnershipType/GetById";
        public static string DeleteOwnershipType = "api/v1/MasterOwnershipType/Delete";
        public static string OwnershipTypeList = "api/v1/MasterOwnershipType/GetAllOwnershipType";

        #endregion MasterOwnershipType

        #region Quotation
        public static string UpsertValuationQuatation = "api/v1/ValuationQuatation/Upsert";
        public static string ValuationQuatationById = "api/v1/ValuationQuatation/GetQuatationById";
        public static string DeleteQuotationById = "api/v1/ValuationQuatation/Delete";
        public static string UpsertValuationInvoice = "api/v1/ValuationInvoice/Upsert";
        public static string ValuationInvoiceById = "api/v1/ValuationInvoice/GetInvoiceById";
        public static string DeleteInvoiceById = "api/v1/ValuationInvoice/Delete";

        #endregion Quotation

        #region Valuation Fees
        public static string UpsertValuation = "api/v1/MasterValuationFees/Upsert";
        public static string GetAllValuation = "api/v1/MasterValuationFees/GetAll";
        public static string GetValuationById = "api/v1/MasterValuationFees/GetById";
        public static string DeleteValuationById = "api/v1/MasterValuationFees/Delete";

        #endregion Valuation Fees

        #region Valuation Fees Type
        public static string UpsertValuationFeeType = "api/v1/MasterValuationFeeType/Upsert";
        public static string GetAllValuationFeeType = "api/v1/MasterValuationFeeType/GetAll";
        public static string GetValuationFeeTypeById = "api/v1/MasterValuationFeeType/GetById";
        public static string DeleteValuationFeeTypeById = "api/v1/MasterValuationFeeType/Delete";
        public static string ValuationFeeTypeList = "api/v1/MasterValuationFeeType/GetAllValuationFeeType";

        #endregion Valuation Fees Type

        #region ClientType

        public static string GetSearchClientType = "api/v1/MasterClientType/GetAllClientType";
        public static string GetClientTypeById = "api/v1/MasterClientType/GetById";
        public static string UpsertClientType = "api/v1/MasterClientType/Upsert";
        public static string DeleteClientType = "api/v1/MasterClientType/DeleteClientType";

        #endregion ClientType

        #region Client

        public static string GetSearchClient = "api/v1/MasterClient/GetAllClient";
        public static string GetClientById = "api/v1/MasterClient/GetById";
        public static string UpsertClient = "api/v1/MasterClient/Upsert";
        public static string DeleteClient = "api/v1/MasterClient/DeleteClient";
        public static string GetClientByClientTypeId = "api/v1/MasterClient/getByClientTypeId";

        #endregion Client

        #region Role Management
        public static string GetAllRole = "api/v1/MasterRole/GetAll";
        public static string GetAllActiveRole = "api/v1/MasterRole/GetAllActiveRole";
        public static string GetRoleById = "api/v1/MasterRole/GetRoleById";
        public static string SaveRole = "api/v1/MasterRole/InsertUpdateRole";
        public static string DeleteRoleById = "api/v1/MasterRole/DeleteRole";
        #endregion Role Management

        #region Location Management
        public static string GetAllLocations = "api/v1/MasterLocation/GetAll";
        public static string UpsertLocation = "api/v1/MasterLocation/Upsert";
        public static string GetLocationById = "api/v1/MasterLocation/GetById";
        public static string DeleteLocationById = "api/v1/MasterLocation/Delete";
        
        #endregion Location Management

        #region Dashboard

        public static string GetAllDashboard = "api/v1/Dashboard/FillDropdown";
        public static string GetPIDFDashBoardData = "api/v1/Dashboard/GetPIDFByYearAndBusinessUnit";

        #endregion Dashboard

        #region Notification

        public static string GetAllNotification = "api/v1/Notification/GetAllNotification";
        public static string GetFilteredNotifications = "api/v1/Notification/GetFilteredNotifications";
        public static string GetWebFilteredNotifications = "Notifications/GetFilteredNotifications";
        public static string NotificationsClickedByUser = "api/v1/Notification/NotificationsClickedByUser";
        public static string NotificationsCountUser = "api/v1/Notification/NotificationsCountUser";

        #endregion Notification

        #region Vendor

        public static string GetSearchVendor = "api/v1/MasterVendor/GetAll";
        public static string GetVendorById = "api/v1/MasterVendor/GetById";
        public static string UpsertVendor = "api/v1/MasterVendor/Upsert";
        public static string DeleteVendor = "api/v1/MasterVendor/Delete";

        #endregion Vendor


        #region LogExceptionMethod
        public static string LogException = "api/v1/LogException/LogException";
        #endregion

        #region Module

        public static string GetAllModule = "api/v1/MasterModule/GetAllModule";

        #endregion Module

        #region Dictionary Management
        public static string GetAllDictionary = "api/v1/MasterDictionary/GetAll";
        public static string UpsertDictionary = "api/v1/MasterDictionary/Upsert";
        public static string GetDictionaryById = "api/v1/MasterDictionary/GetById";
        //public static string DeleteDictionary = "api/v1/MasterDictionary/Delete";
        public static string DeleteDictionaryById = "api/v1/MasterDictionary/Delete";
        public static string UpsertMasterDictionary = "api/v1/MasterDictionary/UpsertMasterDictionary";
        public static string GetDictionaryDetailsById = "api/v1/MasterDictionary/GetDictionaryDetailsById";
        public static string GetDictionaryDescriptionById = "api/v1/MasterDictionary/GetDictionaryDescriptionById";
        public static string GetDictionaryWithSubDetails = "api/v1/MasterDictionary/GetDictionaryWithSubDetails";

        #endregion Dictionary Management

        #region Valuation Request

        public static string GetAllValuationRequest = "api/v1/ValuationRequest/GetAllValuationRequest";
        public static string GetAllValuationRequestStatus = "api/v1/ValuationRequestStatus/GetAll";
        public static string AssignApprover = "api/v1/ValuationRequest/AssignApprover";
        public static string ValuationMethod = "api/v1/ValuationRequest/GetAllValuationMethod";
        public static string ValuationQuatationList = "api/v1/ValuationQuatation/GetQuatationList";
        public static string ValuationInvoiceList = "api/v1/ValuationInvoice/GetInvoiceList";
        public static string UpsertValuationRequest = "api/v1/ValuationRequest/Upsert";
        public static string ValuationRequestGetById = "api/v1/ValuationRequest/GetById";
        public static string ValuationRequestDeleteById = "api/v1/ValuationRequest/Delete";
        public static string ReviewRequestStatus = "api/v1/ValuationRequest/ReviewerRequestStatus";
        public static string GetRequestStatus = "api/v1/ValuationRequestStatus/GetAllStatus";
        

        #endregion Valuation Request


        #region AuditLog
        public static string GetAllAudit = "api/v1/AuditLog/GetAll";
        public static string GetDetailsAudit = "api/v1/AuditLog/GetLogDetailsByFilters";
        public static string GetAuditTableName = "api/v1/AuditLog/GetAllAuditLogTableName";

        #endregion AuditLog

    }
}