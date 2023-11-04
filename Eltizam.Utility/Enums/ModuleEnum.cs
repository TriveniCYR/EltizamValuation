using System.ComponentModel;

namespace Eltizam.Utility.Enums
{
    public enum ModuleEnum
    {
        MasterUser = 1,
        //RoleManagement = 2,
        //Dashboard = 3,
        //MasterManagement = 4,
        //PIDF = 5,
        //PBF = 6,
        //IPD = 7,
        //Finance = 8,
        //Medical = 9,
        //APIListManagement = 10,
        //Formulation = 11,
        //ManagementHOD = 12,
        //CommercialManagement = 15,
        //APIManagement =13
    }

    public enum ModulePermissionEnum
    { 
        ResourceMaster = 1, 
        RoleMaster = 2,
        ClientType = 3, 
        DesignationMaster = 4,
        DepartmentMaster = 5,
        LocationMaster = 6,
        PropertyTypeMaster = 7,
        ClientTypeManagement = 8,
        PropertyMaster = 9,
        ClientMaster = 13,       
        ValutionFeesMaster = 14,
        VendorMaster = 15, 
        ValuationRequest = 16
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