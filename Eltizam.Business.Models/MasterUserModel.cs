using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Security.AccessControl;
using System.Text;
using System.Threading.Tasks;
using System.Xml.Linq;

namespace Eltizam.Business.Models
{
    public class MasterUserModel
    {
        public int Id { get; set; }
        public string UserName { get; set; }
        public string FirstName { get; set; }
        public string MiddleName { get; set; }
        public string LastName { get; set; }
        public string Gender { get; set; }
        public DateTime DateOfBirth { get; set; }
        public int DesignationId { get; set; }
        public int DepartmentId { get; set; }

        public string LicenseNo { get; set; }

        public int CompanyId { get; set; }
        public int ResourceId { get; set; }
        public int RoleId { get; set; }
        public bool IsActive { get; set; }


        [Display(Name = "Password")]
        [RegularExpression(@"^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,16}$", ErrorMessage = "A password must have Minimum 8, " +
            "Maximum 16 characters,at least one number,at least one upper case,at least one lower case," +
            "at least one special character e.g. @$!%*?&")]
        [DataType(DataType.Password)]
        public string Password { get; set; }
        [NotMapped]
        //[Required(ErrorMessage = "Confirm Password required")]
        [CompareAttribute("Password", ErrorMessage = "Password and Confirm Password doesn't match.")]
        [DataType(DataType.Password)]
        public string ConfirmPassowrd { get; set; }

        public int CreatedBy { get; set; }

        public List<MasterUserModel> Users { get; set; }

        public MasterUserAddressModel Address { get; set; }
        public MasterUserContactModel Contact { get; set; }
    }
}
