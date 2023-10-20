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
        public static string usp_PropertySubType_SearchAllList = "usp_PropertySubType_SearchAllList";
        public static string usp_Vendor_SearchAllList = "usp_Vendor_SearchAllList";
        public static string usp_Client_Search_GetClientList = "usp_Client_Search_GetClientList";
       
        public static string usp_OwnershipType_SearchAllList = "usp_OwnershipType_SearchAllList";
        public static string usp_State_SearchAllList = "usp_State_SearchAllList";
        public static string usp_User_SearchAllList = "usp_User_SearchAllList";
        
        public static string usp_Country_SearchAllList = "usp_Country_SearchAllList";
        public static string usp_User_Search_GetUserList = "usp_User_Search_GetUserList";
        // Master Key Id
        public static string usp_Contact_GetContactByTableKeyId = "usp_Contact_GetContactByTableKeyId";
        public static string usp_Address_GetAddressByTableKeyId = "usp_Address_GetAddressByTableKeyId";
        public static string usp_Qualification_GetQualificationByTableKeyId = "usp_Qualification_GetQualificationByTableKeyId";
        public static string usp_Document_GetDocumentByTableKeyId = "usp_Document_GetDocumentByTableKeyId";

        // common master dropdown call
        public static string usp_ResourceType_AllList = "usp_ResourceType_AllList";
        public static string usp_Role_AllList = "usp_Role_AllList";
        public static string usp_Department_AllList = "usp_Department_AllList";
        public static string usp_Designation_AllList = "usp_Designation_AllList";
        public static string usp_Country_AllList = "usp_Country_AllList";
        public static string usp_City_AllList = "usp_City_AllList";
        public static string usp_Client_DeleteContactByClientId = "usp_Client_DeleteContactByClientId";
        public static string usp_State_AllList = "usp_State_AllList";
        public static string usp_ClientType_AllList = "usp_ClientType_AllList";
        public static string usp_Role_SearchAllList = "usp_Role_SearchAllList";
        public static string usp_Role_GetByRoleName = "usp_Role_GetByRoleName";

        public static string usp_InsertException = "usp_InsertException";
        public static string usp_PropertyType_GetAll = "usp_PropertyType_GetAll";

        //Vendor 
        public static string usp_Vendor_Search_GetVendorList = "usp_Vendor_Search_GetVendorList";

        //Valuation
        public static string usp_ValuationFees_SearchAllList = "usp_ValuationFees_SearchAllList";
        public static string usp_ValuationFeeType_SearchAllList = "usp_ValuationFeeType_SearchAllList";
    }
}
