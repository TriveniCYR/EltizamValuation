using Microsoft.Extensions.Configuration;

namespace Eltizam.Web.Helpers
{
    public static class APIURLHelper
    {
        public static IConfiguration Configuration;

        #region Account

        public static string LoginURL = "Account/Login";
        public static string ValidateToken = "Account/ValidateToken";
        public static string GetBusinessUnit = "Account/GetAllBusinessUnit";
        public static string GetRegion = "Account/GetAllRegion";
        public static string GetCurrency = "Account/GetAllCurrency"; 
        public static string ForgotPassword = "Account/ForgotPassword";
        public static string ResetPassword = "Account/ResetPassword";
        public static string Anonymous_CheckEmailAddressExists = "Account/CheckEmailAddressExists"; 
        public static string Anonymous_IsTokenValid = "Account/IsTokenValid";
        public static string ChangePassword = "Account/ChangePassword";

        #endregion

        #region MasterCommon

        public static string GetDepartmentList = "MasterDepartment/GetDepartmentList";
        public static string GetRoleList = "MasterUser/GetRoleList";
        public static string GetApproverList = "MasterUser/GetApproverList";
        public static string GetDesignationList = "MasterDesignation/GetDesignationList";
        public static string GetResourceTypeList = "MasterUser/GetResourceTypeList";
        public static string GetApproverLevelList = "MasterUser/GetApproverLevelList";
        public static string GetCountryList = "MasterCountry/GetCountryList";
        public static string GetStateList = "MasterState/GetStateList";
        public static string GetStateListByCountryId = "MasterState/GetStateListByCountryId";
        public static string GetCityList = "MasterCity/GetCityList";
        public static string GeCityListByStateId = "MasterCity/GetCityListByStateId";
        public static string GetClientTypeList = "MasterClientType/GetClientTypeList";
        public static string GetByPermisionRoleUsingRoleId = "MasterRole/GetByPermisionRoleUsingRoleId";

        #endregion MasterCommon 

        #region User

        public static string GetAll = "MasterUser/GetAll";
        public static string UpsertUser = "MasterUser/Upsert";
        public static string GetUserById = "MasterUser/GetById";
        public static string DeleteUserById = "MasterUser/Delete";
        public static string DeleteUserDocumentById = "MasterUser/DeleteDocument";
        public static string GetGlobalAuditFields = "MasterUser/GetGlobalAuditFields";
        public static string GetUserNameList = "MasterUser/GetAllUserList";
        public static string CheckEmailExist = "MasterUser/CheckEmailExist";
        #endregion User

        #region Designation
        public static string UpsertDesignation = "MasterDesignation/Upsert";
        public static string GetAllDesignation = "MasterDesignation/GetAll";
        public static string GetesignationById = "MasterDesignation/GetById";
        public static string DeleteDesignationById = "MasterDesignation/Delete";
        #endregion Designation
        
        #region Department
        public static string UpsertDepartment = "MasterDepartment/Upsert";
        public static string GetAllDepartment = "MasterDepartment/GetAll";
        public static string GetDepartmentById = "MasterDepartment/GetById";
        public static string DeleteDepartmentById = "MasterDepartment/Delete";

        #endregion Department

        #region Dashboard

        public static string DashboardDetails = "Dashboard/DashboardData";

        #endregion Dashboard

        #region MasterProperty
        public static string UpsertProperty = "MasterProperty/Upsert";
        public static string GetAllProperty = "MasterProperty/GetAll";
        public static string GetPropertyById = "MasterProperty/GetById";
        public static string DeletePropertyById = "MasterProperty/Delete";
        public static string GetPropertyByFilters = "MasterProperty/getPropertyByFilters";
        public static string GetPropertyAmenityList = "MasterProperty/GetPropertyAmenityList";

        #endregion MasterProperty

        #region MasterPropertyType
        public static string UpsertPropertyType = "MasterPropertyType/Upsert";
        public static string GetAllPropertyType = "MasterPropertyType/GetAll";
        public static string GetPropertyTypeById = "MasterPropertyType/GetById";
        public static string DeletePropertyTypeById = "MasterPropertyType/Delete";
        public static string GetPropertyTypeList = "MasterPropertyType/GetAllList";
        public static string CheckPropertyTypeExists = "MasterPropertyType/CheckPropertTypeExists";

        #endregion MasterPropertyType

        #region MasterPropertySubType
        public static string UpsertPropertySubType = "MasterPropertySubType/Upsert";
        public static string GetAllPropertySubType = "MasterPropertySubType/GetAllProperty";
        public static string GetPropertyByIdSubType = "MasterPropertySubType/GetById";
        public static string GetPropertyByPropertyTypeId = "MasterPropertySubType/GetByPropertyTypeId";
        public static string DeletePropertytByIdSubType = "MasterPropertySubType/Delete";

        #endregion MasterPropertyType

        #region MasterOwnershipType
        public static string UpsertOwnershipType = "MasterOwnershipType/Upsert";
        public static string GetAllOwnershipType = "MasterOwnershipType/GetAll";
        public static string GetOwnershipType = "MasterOwnershipType/GetById";
        public static string DeleteOwnershipType = "MasterOwnershipType/Delete";
        public static string OwnershipTypeList = "MasterOwnershipType/GetAllOwnershipType";

        #endregion MasterOwnershipType

        #region Quotation
        public static string UpsertValuationQuatation = "ValuationQuatation/Upsert";
        public static string ValuationQuatationById = "ValuationQuatation/GetQuatationById";
        public static string DeleteQuotationById = "ValuationQuatation/Delete";
        public static string UpsertValuationInvoice = "ValuationInvoice/Upsert";
        public static string ValuationInvoiceById = "ValuationInvoice/GetInvoiceById";
        public static string DeleteInvoiceById = "ValuationInvoice/Delete";
        public static string DeleteInvoiceDocument = "ValuationInvoice/DeleteDocument";
        public static string DeletePyamentInvoice = "ValuationInvoice/DeletePyamentInvoice";


        #endregion Quotation

        #region Valuation Fees
        public static string UpsertValuation = "MasterValuationFees/Upsert";
        public static string GetAllValuation = "MasterValuationFees/GetAll";
        public static string GetValuationById = "MasterValuationFees/GetById";
        public static string DeleteValuationById = "MasterValuationFees/Delete";

        #endregion Valuation Fees

        #region Valuation Fees Type
        public static string UpsertValuationFeeType = "MasterValuationFeeType/Upsert";
        public static string GetAllValuationFeeType = "MasterValuationFeeType/GetAll";
        public static string GetValuationFeeTypeById = "MasterValuationFeeType/GetById";
        public static string DeleteValuationFeeTypeById = "MasterValuationFeeType/Delete";
        public static string ValuationFeeTypeList = "MasterValuationFeeType/GetAllValuationFeeType";

        #endregion Valuation Fees Type

        #region ClientType

        public static string GetSearchClientType = "MasterClientType/GetAllClientType";
        public static string GetClientTypeById = "MasterClientType/GetById";
        public static string UpsertClientType = "MasterClientType/Upsert";
        public static string DeleteClientType = "MasterClientType/DeleteClientType";

        #endregion ClientType

        #region Client

        public static string GetSearchClient = "MasterClient/GetAllClient";
        public static string GetClientById = "MasterClient/GetById";
        public static string UpsertClient = "MasterClient/Upsert";
        public static string DeleteClient = "MasterClient/DeleteClient";
        public static string GetClientByClientTypeId = "MasterClient/getByClientTypeId";
        public static string DeleteClientDocumentById = "MasterClient/DeleteDocument";

        #endregion Client

        #region Role Management
        public static string GetAllRole = "MasterRole/GetAll";
        public static string GetAllActiveRole = "MasterRole/GetAllActiveRole";
        public static string GetRoleById = "MasterRole/GetRoleById";
        public static string SaveRole = "MasterRole/InsertUpdateRole";
        public static string DeleteRoleById = "MasterRole/DeleteRole";
        #endregion Role Management

        #region Location Management
        public static string GetAllLocations = "MasterLocation/GetAll";
        public static string UpsertLocation = "MasterLocation/Upsert";
        public static string GetLocationById = "MasterLocation/GetById";
        public static string DeleteLocationById = "MasterLocation/Delete";
        
        #endregion Location Management

        #region Dashboard

        public static string GetAllDashboard = "Dashboard/FillDropdown";
        public static string GetPIDFDashBoardData = "Dashboard/GetPIDFByYearAndBusinessUnit";

        #endregion Dashboard

        #region Notification

        public static string GetAllNotification = "Notification/GetAllNotification";
        public static string GetFilteredNotifications = "Notification/GetFilteredNotifications";
        public static string GetWebFilteredNotifications = "Notifications/GetFilteredNotifications";
        public static string NotificationsClickedByUser = "Notification/NotificationsClickedByUser";
        public static string NotificationsCountUser = "Notification/NotificationsCountUser";

        #endregion Notification

        #region Vendor

        public static string GetSearchVendor = "MasterVendor/GetAll";
        public static string GetVendorById = "MasterVendor/GetById";
        public static string UpsertVendor = "MasterVendor/Upsert";
        public static string DeleteVendor = "MasterVendor/Delete";

        #endregion Vendor 

        #region LogExceptionMethod
        public static string LogException = "LogException/LogException";
        #endregion

        #region Module

        public static string GetAllModule = "MasterModule/GetAllModule";

        #endregion Module

        #region Dictionary Management
        public static string GetAllDictionary = "MasterDictionary/GetAll";
        public static string UpsertDictionary = "MasterDictionary/Upsert";
        public static string GetDictionaryById = "MasterDictionary/GetById";
        //public static string DeleteDictionary = "MasterDictionary/Delete";
        public static string DeleteDictionaryById = "MasterDictionary/Delete";
        public static string UpsertMasterDictionary = "MasterDictionary/UpsertMasterDictionary";
        public static string GetDictionaryDetailsById = "MasterDictionary/GetDictionaryDetailsById";
        public static string GetDictionaryDescriptionById = "MasterDictionary/GetDictionaryDescriptionById";
        public static string GetDictionaryWithSubDetails = "MasterDictionary/GetDictionaryWithSubDetails";
        public static string GetInvoiceTransactionStatus = "ValuationRequestStatus/GetInvoiceTransactionStatus";

        #endregion Dictionary Management

        #region Valuation Request

        public static string GetAllValuationRequest = "ValuationRequest/GetAllValuationRequest";
        public static string GetAllValuationRequestStatus = "ValuationRequestStatus/GetAll";
        public static string AssignApprover = "ValuationRequest/AssignApprover";
        public static string ValuationMethod = "ValuationRequest/GetAllValuationMethod";
        public static string ValuationQuatationList = "ValuationQuatation/GetQuatationList";
        public static string ValuationInvoiceList = "ValuationInvoice/GetInvoiceList";
        public static string UpsertValuationRequest = "ValuationRequest/Upsert";
        public static string ValuationRequestGetById = "ValuationRequest/GetById";
        public static string ValuationRequestGetHeaderInfoById = "ValuationRequest/GetHeaderInfoById";
        public static string ValuationRequestDeleteById = "ValuationRequest/Delete";
        public static string ReviewRequestStatus = "ValuationRequest/ReviewerRequestStatus";
        public static string GetRequestStatus = "ValuationRequestStatus/GetAllStatus";
        public static string ValuationAssesment = "ValuationAssessment/ValuationAssesmentUpsert";
        public static string GetSiteDescriptionList = "ValuationAssessment/GetSiteDescriptionList";        
        public static string GetValuationPDFData = "ValuationQuatation/GetValuationPDFData";
        public static string GetApproverLevel = "ValuationQuatation/GetApproverLevel";
        
        public static string DeleteDocument = "ValuationAssessment/DeleteDocument";
        public static string GetNotificationList = "Notification/GetNotificationList";
        public static string GetNotificationCount = "Notification/GetNotificationCount";
        public static string UpdateNotification = "Notification/UpdateNotificationReadBy";
        public static string GetAllStatusHistory = "ValuationRequestStatus/GetAllStatusHistory";
        public static string UpsertInvoice = "ValuationInvoice/UpsertInvoice";
        public static string GetPaymentInvoiceById = "ValuationInvoice/GetPaymentInvoiceById";
        public static string PaymentInvoiceById = "ValuationInvoice/PaymentInvoiceById";
        #endregion Valuation Request 

        #region AuditLog
        public static string GetAllAudit = "AuditLog/GetAll";
        public static string GetAuditDetails = "AuditLog/GetAllDetailsLog";
        public static string GetDetailsAudit = "AuditLog/GetLogDetailsByFilters";
        public static string GetAuditTableName = "AuditLog/GetAllAuditLogTableName";

        #endregion AuditLog

        #region MasterApproverLevel
        public static string UpsertMasterApproverLevel = "MasterApproverLevel/Upsert";
        public static string GetMasterApproverLevelById = "MasterApproverLevel/GetById";
        public static string GetMasterApproverLevelsList = "MasterApproverLevel/GetAll";

        #endregion MasterApproverLevel

    }
}