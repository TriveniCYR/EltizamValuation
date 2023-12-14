using Eltizam.Resource.Resources;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Eltizam.Business.Models
{
    public class Master_QualificationModel
    {
        public int Id { get; set; }
        public int UserId { get; set; }
        [StringLength(250, MinimumLength = 1)]
        [Required(ErrorMessageResourceType = typeof(Validation), ErrorMessageResourceName = "Required")]
        public string? Qualification { get; set; }
        [StringLength(250, MinimumLength = 1)]
        [Required(ErrorMessageResourceType = typeof(Validation), ErrorMessageResourceName = "Required")]
        public string? Subject { get; set; }
        [StringLength(150, MinimumLength = 1)]
        [Required(ErrorMessageResourceType = typeof(Validation), ErrorMessageResourceName = "Required")]
        public string? Institute { get; set; }
        [StringLength(250, MinimumLength = 1)]
        [Required(ErrorMessageResourceType = typeof(Validation), ErrorMessageResourceName = "Required")]
        public string? Grade { get; set; }
        [StringLength(20, MinimumLength = 4)]
        [Required(ErrorMessageResourceType = typeof(Validation), ErrorMessageResourceName = "Required")]
        public string? YearOfInstitute { get; set; }
        public int IsActive { get; set; }
        public DateTime CreatedDate { get; set; }
        public int CreatedBy { get; set; }
        public DateTime ModifiedDate { get; set; }
        public int ModifiedBy { get; set; }
    }
}
