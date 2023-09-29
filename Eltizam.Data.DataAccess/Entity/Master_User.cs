using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Eltizam.Data.DataAccess.Entity
{
    public class Master_User
    {
        [Key]
        public int Id { get; set; }
        public string UserName { get; set; }
        public string FirstName { get; set; }
        public string MiddleName { get; set; }
        public string LastName { get; set; }
        public string DateOfBirth { get; set; }
        public int DesignationId { get; set; }
        public int DepartmentId { get; set; }

        public string LicenseNo { get; set; }

        public int CompanyId { get; set; }
        public int ResourceId { get; set; }
        public int RoleId { get; set; }
        public bool IsActive { get; set; }
        public string Password { get; set; }
        public string CreatedBy { get; set; }
        public DateTime CreatedOn { get; set; }
        public string ModifiedBy { get; set; }
        public DateTime ModifiedOn { get; set; }
    }
}
