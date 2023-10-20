using System.ComponentModel;

namespace Eltizam.Utility.Enums
{
    public enum ModuleEnum
    {
        UserManagement = 1,
        RoleManagement = 2,
        Dashboard = 3,
        MasterManagement = 4,
        PIDF = 5,
        PBF = 6,
        IPD = 7,
        Finance = 8,
        Medical = 9,
        APIListManagement = 10,
        Formulation = 11,
        ManagementHOD = 12,
        CommercialManagement = 15,
        APIManagement =13
    }

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
        //      Commercial = 15,
        //      ManagementHOD = 16,
        //      Project = 17,
        //    [Description("Wish List")] 
    }

	public enum SubModulePermissionEnum
    {
        RnD = 1,
        Clinical = 2,
        Analytical = 3,
        APIRnD = 4,
        APIIPD = 12,
        APICharter = 13,
        APICharterSummary = 14,
        RA = 15
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
    public enum IPDPatenDetailsType
    {
        PatenDetailsForFormulation = 1,
        PatientDetailsForAPI = 2,
    }
}