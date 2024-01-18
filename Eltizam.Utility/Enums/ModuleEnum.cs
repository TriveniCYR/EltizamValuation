using System.ComponentModel;

namespace Eltizam.Utility.Enums
{
    /// <summary>
    /// Added by YReddy for storing all project enum details
    /// </summary>
    public enum ModulePermissionEnum
    {
        Dashboard = 1,
        RoleMaster = 2,
        ResourceMaster = 3,
        LocationMaster = 4,
        DesignationMaster = 5,
        DepartmentMaster = 6,
        PropertyTypeMaster = 7,
        PropertyMaster = 8,
        ClientMaster = 9,
        ValuationFeeMaster = 10,
        VendorMaster = 11,
        DictionaryMaster = 12,
        ValuationRequest = 13,
        AuditLog = 14,
        ApproverMaster=16
    }

    public enum SubModuleEnum
    {
        ValuationRequest = 1,
        ValuationQuotation = 2,
        ValuationInvoice = 3,
        SiteDescription= 4,
        ComparableEvidences= 5,
        ValuationAssessement= 6,
    }

    public enum RoleEnum
    {
        Requestor = 1,
        Approver = 2,
        Valuer = 3,
        Admin = 4
    }

    public enum StatusTypeEnum
    {
        Valuation = 1,
        Quotation = 2,
        Invoice = 3 
    }


    public enum PermissionEnum
    {
        Any = 0,
        View = 1,
        Add = 2,
        Edit = 3,
        Delete = 4,
        Approve = 5
    }

    public enum AuditActionTypeEnum
    {
        Create = 1,
        Update = 2,
        Delete = 3
    }

    public enum ObjectState
    {
        Detached = 0,
        Unchanged = 1,
        Deleted = 2,
        Modified = 3,
        Added = 4,
        Processed = 5
    }

    /// <summary>
    /// Enums for tables
    /// To Read ID   -->  (int)(TableNameEnum.Master_User); 
    /// To Read Name -->  Enum.GetName(TableNameEnum.Master_User);
    /// To Read Desc -->  EnumHelper.GetDescription(TableNameEnum.Master_User);
    /// </summary>
    public enum TableNameEnum
    {
        [Description("Address Details")]
        Master_Address = 1,
        [Description("Contact Details")]
        Master_Contact = 2,
        [Description("Client Master")]
        Master_Client = 3,
        [Description("Clien Type Master")]
        Master_ClientType = 4,
        [Description("Dictionary Master")]
        Master_Dictionary = 5,
        [Description("Location Master")]
        Master_Location = 6,
        [Description("Property Master")]
        Master_Property = 7,
        [Description("Property Type Master")]
        Master_PropertyType = 8,
        [Description("Role Master")]
        Master_Role = 9,
        [Description("Valuation Fee Master")]
        Master_ValuationFee = 10,
        [Description("Vendor Master")]
        Master_Vendor = 11,
        [Description("Resource Master")]
        Master_User = 12,
        [Description("Document")]
        Document = 13,

        [Description("Valuation Request")]
        ValuationRequest = 25,

        [Description("Comparable Evidence")]
        Comparable_Evidence = 14,


        [Description("Valuation Assessement")]
        Valuation_Assessement = 15,

        [Description("Site Description")]
        SiteDescription = 16,

        [Description("Valuation Quotation")]
        ValuationQuotation = 17,

        [Description("Valuation Invoice")]
        ValuationInvoice = 18,

        [Description("Approver Master")]
        MasterApproverLevel = 19,

        [Description("Valuation Request Approver Level")]
        ValuationRequestApproverLevel = 20, 
    }

    public enum ValuationStatusEnum
    {
        [Description("Completed")]
        Completed = 11,
        [Description("Valuation Created")]
        ValuationCreated = 10
    }

    /// <summary>
    /// Enum helper class to get details
    /// </summary>
    public static class EnumHelper
    {
        public static string GetDescription<T>(this T enumValue)
            where T : struct, IConvertible
        {
            if (!typeof(T).IsEnum)
                return null;

            var description = enumValue.ToString();
            var fieldInfo = enumValue.GetType().GetField(enumValue.ToString());

            if (fieldInfo != null)
            {
                var attrs = fieldInfo.GetCustomAttributes(typeof(DescriptionAttribute), true);
                if (attrs != null && attrs.Length > 0)
                {
                    description = ((DescriptionAttribute)attrs[0]).Description;
                }
            }

            return description;
        }
    }
}