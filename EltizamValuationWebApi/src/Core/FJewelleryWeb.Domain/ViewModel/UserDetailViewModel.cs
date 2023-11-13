using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ValuationWeb.Domain.ViewModel
{
    public class UserDetailViewModel
    {
        public int Id { get; set; }
        public string UserName { get; set; } = null!;
        public string? Password { get; set; }
        public string Name { get; set; } = null!;
        public string Description { get; set; } = null!;
        public int GroupId { get; set; }
        public DateTime OpenDate { get; set; }
        public DateTime? CloseDate { get; set; }
        public byte State { get; set; }
        public byte MaxConnection { get; set; }
        public DateTime? PasswordExpirationDate { get; set; }
        public int? DepartmentId { get; set; }
        public byte? BranchId { get; set; }
        public string? Prefix { get; set; }
        public byte? DefaultPayType { get; set; }
        public DateTime? LastLoginDate { get; set; }
        public string? LastLoginIp { get; set; }
        public string? LastLoginMachine { get; set; }
        public byte AllowTemplateTesting { get; set; }
        public string? EmployeeNum { get; set; }
        public string? Email { get; set; }
        public string? FirstName { get; set; }
        public string? LastName { get; set; }
        public string? ForgotPasswordToken { get; set; }
        public DateTime? ForgotPasswordExpirationDate { get; set; }
        public int? RoleId { get; set; }
        public string? Gender { get; set; }
        public string? Address { get; set; }
        public string? Mobile { get; set; }
        public string? Mobile2 { get; set; } 
        public bool? IsActive { get; set; }
        public string? RoleName { get; set; }
        public string? BranchName { get; set; }
    }
}
