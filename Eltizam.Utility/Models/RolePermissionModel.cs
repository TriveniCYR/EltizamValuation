namespace Eltizam.Utility.Models
{
    public class RolePermissionModel
    {
        public int RoleModuleId { get; set; }
        public int RoleId { get; set; }
        public int ModuleId { get; set; }
        public int? SubModuleId { get; set; } 
        public bool View { get; set; }
        public bool Add { get; set; }
        public bool Edit { get; set; }
        public bool Delete { get; set; }
        public bool Approve { get; set; } 
        public string? ModuleName { get; set; }
        public string? ControlName { get; set; } 
        public string? ViewName { get; set; } 
        public string? Icon { get; set; }
        public string? HoverIcon { get; set; } 
    }
}