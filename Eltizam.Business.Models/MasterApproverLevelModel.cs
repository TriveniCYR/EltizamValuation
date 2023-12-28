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
    public class MasterApproverLevelModel : GlobalAuditFields
    {
        public int Id { get; set; }
        [Required(ErrorMessageResourceType = typeof(Validation), ErrorMessageResourceName = "Required")]
        [MaxLength(250, ErrorMessage = "The field {0} must be a string with a maximum length of {1}.")]

        [StringLength(250, MinimumLength = 1)]
        public string? Description { get; set; }
        [Required(ErrorMessageResourceType = typeof(Validation), ErrorMessageResourceName = "Required")]
        public decimal FromAmount { get; set; }
        [Required(ErrorMessageResourceType = typeof(Validation), ErrorMessageResourceName = "Required")]
        public decimal ToAmount { get; set; }
        public bool IsDeleted { get; set; }=false;
        public bool IsActive { get; set; }
        [NotMapped]
        public List<MasterUserModel>? UsersList { get; set; }

    }
}
