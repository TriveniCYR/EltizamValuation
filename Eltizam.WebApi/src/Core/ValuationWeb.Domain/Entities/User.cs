using System;
using System.Collections.Generic;

namespace ValuationWeb.Domain.Entities
{
    public partial class User
    {
        public User()
        {
            RefreshTokens = new HashSet<RefreshToken>();
        }

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
        public bool? IsActive { get; set; }
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
        public int? CreatedBy { get; set; }
        public DateTime? CreatedDate { get; set; }
        public int? ModifiedBy { get; set; }
        public DateTime? ModifiedDate { get; set; }

        public virtual ICollection<RefreshToken> RefreshTokens { get; set; }
    }
}
