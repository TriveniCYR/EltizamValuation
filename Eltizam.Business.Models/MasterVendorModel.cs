using Eltizam.Resource.Resources;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Eltizam.Business.Models
{
    public class MasterVendorModel
    {
        public int Id { get; set; }

        [Required(ErrorMessageResourceType = typeof(Validation), ErrorMessageResourceName = "Required")]
        public string VendorName { get; set; }
        [Required(ErrorMessageResourceType = typeof(Validation), ErrorMessageResourceName = "Required")]
        public string? CompanyName { get; set; }
        [Required(ErrorMessageResourceType = typeof(Validation), ErrorMessageResourceName = "Required")]
        public DateTime? EstimattionDate { get; set; }
        [Required(ErrorMessageResourceType = typeof(Validation), ErrorMessageResourceName = "Required")]
        public string? BusinessType { get; set; }
        public string? CompanyDescription { get; set; }
        public int? Status { get; set; }
        public int? CreatedBy { get; set; }
        public int? ModifiedBy { get; set; }
        public MasterAddressEntity? Address { get; set; }
        public MasterContactModel? Contact { get; set; }
    }
}
