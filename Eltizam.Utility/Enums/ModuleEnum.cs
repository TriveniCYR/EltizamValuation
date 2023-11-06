using System.ComponentModel;

namespace Eltizam.Utility.Enums
{
    /// <summary>
    /// Added by YReddy for storing all project enum details
    /// </summary>
    public enum ModulePermissionEnum
    { 
        UserMaster = 1, 
        RoleMaster = 2,
        ClientTypeMaster = 3,
        ClientMaster = 4,
        LocationMaster = 5,
        PropertyTypeMaster = 6,  
        PropertyMaster = 7, 
        ValutionFeesMaster = 8,
        VendorMaster = 9,
        AuditLog = 10,
        ValuationRequest = 11,
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