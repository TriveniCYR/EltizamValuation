using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ValuationWeb.Domain.ViewModel
{
    public class UserViewModel
    {
        public DateTime? OpenDate { get; set; }
        public int Id { get; set; }
        public string UserName { get; set; } = null!;
        public string? FirstName { get; set; }
        public string LastName { get; set; } = null!;
        public string Mobile { get; set; } = null!;
        public string Mobile2 { get; set; } = null!;
        public string Email { get; set; } = null!;
        public int RoleId { get; set; }
        public string RoleName { get; set; } = null!;
        public byte? BranchId { get; set; }
        public string BranchName { get; set; } = null!;
        public string? EmployeeNum { get; set; } = null!;
        public string Gender { get; set; } = null!;
        public bool Status { get; set; } 
        public string CashAccountNum { get; set; } = null!;
        public string Password { get; set; } = null!;
        public string Address { get; set; } = null!;

        public bool? IsActive { get; set; }
    }
}
