using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Eltizam.Business.Models
{
    public static class ProcedureMetastore
    {
        // Master SP Call
        public static string usp_City_SearchAllList = "usp_City_SearchAllList";
        public static string usp_Department_SearchAllList = "usp_Department_SearchAllList";
        public static string usp_Designation_SearchAllList = "usp_Designation_SearchAllList";
        public static string usp_Location_SearchAllList = "usp_Location_SearchAllList";
        public static string usp_ClientType_SearchAllList = "usp_ClientType_SearchAllList";
        public static string usp_Client_SearchAllList = "usp_Client_SearchAllList";
        public static string usp_PropertyType_SearchAllList = "usp_PropertyType_SearchAllList";
        public static string usp_PropertyType_UpsertSubTypes = "usp_PropertyType_UpsertSubTypes";
        public static string usp_PropertySubType_SearchAllList = "usp_PropertySubType_SearchAllList";
        public static string usp_Vendor_SearchAllList = "usp_Vendor_SearchAllList";
        public static string usp_Client_Search_GetClientList = "usp_Client_Search_GetClientList";
        public static string usp_Property_Search_GetPropertyList = "usp_Property_Search_GetPropertyList";
        public static string usp_Property_Delete = "usp_Property_Delete";
        public static string usp_Client_Delete = "usp_Client_Delete";
        public static string usp_Amenity_GetAmenityByPropertyId = "usp_Amenity_GetAmenityByPropertyId";
        public static string usp_PropertyLocation_GetLocationByPropertyId = "usp_PropertyLocation_GetLocationByPropertyId";
       
        public static string usp_OwnershipType_SearchAllList = "usp_OwnershipType_SearchAllList";
        public static string usp_State_SearchAllList = "usp_State_SearchAllList";
        public static string usp_User_SearchAllList = "usp_User_SearchAllList";
        public static string usp_User_AllList = "usp_User_AllList";

        public static string usp_Country_SearchAllList = "usp_Country_SearchAllList";
        public static string usp_User_Search_GetUserList = "usp_User_Search_GetUserList";
        public static string usp_Dictionary_SearchAllList = "usp_Dictionary_SearchAllList";
        public static string usp_SubProperty_GetSubPropertyByPropertyIdList = "usp_SubProperty_GetSubPropertyByPropertyIdList";
        // Master Key Id
        public static string usp_Contact_GetContactByTableKeyId = "usp_Contact_GetContactByTableKeyId";
        public static string usp_Address_GetAddressByTableKeyId = "usp_Address_GetAddressByTableKeyId";
        public static string usp_Qualification_GetQualificationByTableKeyId = "usp_Qualification_GetQualificationByTableKeyId";
        public static string usp_Document_GetDocumentByTableKeyId = "usp_Document_GetDocumentByTableKeyId";
        public static string usp_Dictionary_GetById = "usp_Dictionary_GetById";
        public static string usp_MasterDictionary_UpsertDictionaryDetails = "usp_MasterDictionary_UpsertDictionaryDetails";
        

        // common master dropdown call
        public static string usp_ResourceType_AllList = "usp_ResourceType_AllList";
        public static string usp_Role_AllList = "usp_Role_AllList";
        public static string usp_Department_AllList = "usp_Department_AllList";
        public static string usp_Designation_AllList = "usp_Designation_AllList";
        public static string usp_Country_AllList = "usp_Country_AllList";
        public static string usp_City_AllList = "usp_City_AllList";
        public static string usp_Client_DeleteContactByClientId = "usp_Client_DeleteContactByClientId";
        public static string usp_State_AllList = "usp_State_AllList";
        public static string usp_PropertyType_GetAll = "usp_PropertyType_GetAll";
        public static string usp_ClientType_AllList = "usp_ClientType_AllList";
        public static string usp_Role_SearchAllList = "usp_Role_SearchAllList";
        public static string usp_Role_GetByRoleName = "usp_Role_GetByRoleName";
        public static string usp_Approver_AllList = "usp_Approver_AllList";
        public static string usp_ValuationRequest_GetNotificationData = "usp_ValuationRequest_GetNotificationData";
        public static string usp_InsertException = "usp_InsertException";
        public static string usp_GetPageFooterDetails = "usp_GetPageFooterDetails";
        
        //Vendor 
        public static string usp_Vendor_Search_GetVendorList = "usp_Vendor_Search_GetVendorList";

        //Valuation
        public static string usp_ValuationFees_SearchAllList = "usp_ValuationFees_SearchAllList";
        public static string usp_ValuationFeeType_SearchAllList = "usp_ValuationFeeType_SearchAllList";
        public static string usp_Valution_GetValuationList = "usp_ValuationRequest_SearchAllList";
        public static string usp_Master_ValuationStatus_List = "usp_Master_ValuationStatus_List";
        public static string usp_ValuationMethod_AllList = "usp_ValuationMethod_AllList";
        public static string usp_Quotation_GetQuotationByRequestId = "usp_Quotation_GetQuotationByRequestId";
        public static string usp_Invoice_GetInvoiceByRequestId = "usp_Invoice_GetInvoiceByRequestId";
        public static string usp_ValuationRequestStatusList = "usp_ValuationRequestStatusList";
        public static string usp_Site_GetSiteDescriptionByRequestId = "usp_Site_GetSiteDescriptionByRequestId";
        public static string usp_Master_Valuation_InvoiceStatus_List = "usp_Master_Valuation_InvoiceStatus_List";
        public static string usp_ValuationRequest_StatusHistory = "usp_ValuationRequest_StatusHistory";
        public static string usp_ValuationRequest_ApproverLevel = "usp_ValuationRequest_ApproverLevel";



        //AuditLog
        public static string usp_AuditLog_SearchAllList = "usp_AuditLog_SearchAllList";
        public static string usp_AuditLog_GetTable = "usp_AuditLog_GetTable";
        public static string usp_AuditLog_Add = "usp_AuditLog_Add";
        public static string usp_ValuationRequest_GetDependencies = "usp_ValuationRequest_GetDependencies";
        public static string usp_AuditLog_SearchDetailsByFilter = "usp_AuditLog_SearchDetailsByFilter";


        // Dahsboard
        public static string usp_ValuationRequest_GetWidgetRequest = "usp_ValuationRequest_GetWidgetRequest";
        public static string usp_ValuationRequest_GetLatestRequest = "usp_ValuationRequest_GetLatestRequest";
        public static string usp_ValuationRequest_GetLatestQuotation = "usp_ValuationRequest_GetLatestQuotation";
        public static string usp_ValuationRequest_GetTopValuation = "usp_ValuationRequest_GetTopValuation";
        public static string usp_ValuationRequest_GetTopQuotationDue = "usp_ValuationRequest_GetTopQuotationDue";

    }
}
