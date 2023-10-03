using Eltizam.Resource.Resources;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Eltizam.Business.Models
{
    public class TblUserModel
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public string Mobile { get; set; }

        [Display(Name = "Password", ResourceType = typeof(Master))]
        [RegularExpression(@"^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,16}$", ErrorMessage = "A password must have Minimum 8, " +
            "Maximum 16 characters,at least one number,at least one upper case,at least one lower case," +
            "at least one special character e.g. @$!%*?&")]
        public string Password { get; set; }
        [NotMapped]
        public string ConfirmPassowrd { get; set; }
        public int LoggedUserId { get; set; }
        public string Email { get; set; }
        public DateTime CreatedOn { get; set; }
        public Boolean IsActive { get; set; }
        public string WebApplicationUrl { get; set; }
    }
}
