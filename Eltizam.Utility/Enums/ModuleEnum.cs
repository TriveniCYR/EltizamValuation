using System.ComponentModel;

namespace Eltizam.Utility.Enums
{  
    public enum ModulePermissionEnum
    {
        [Description("Resourc Master")]
        ResourceMaster = 1,
		[Description("RoleMaster")]
        RoleMaster = 2,
        ClientType = 3,
        [Description("Designation Master")]
        DesignationMaster = 4,
        DepartmentMaster = 5,
        LocationMaster = 6,
        PropertyTypeMaster = 7,
        ClientTypeManagement = 8,
        PropertyMaster = 9,
        ClientMaster = 13,       
        ValutionFeesMaster = 14,
        VendorMaster = 15, 
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
}