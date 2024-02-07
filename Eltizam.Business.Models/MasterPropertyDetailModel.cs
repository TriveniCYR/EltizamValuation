using Eltizam.Resource.Resources;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Eltizam.Business.Models
{
    public class MasterPropertyDetailModel
    {
        public int Id { get; set; }
        public int PropertyId { get; set; }
        [Required(ErrorMessageResourceType = typeof(Validation), ErrorMessageResourceName = "Required")]
        [Range(1, int.MaxValue, ErrorMessage = "The 'Country' field is required.")]
        public int? CountryId { get; set; }
        [Required(ErrorMessageResourceType = typeof(Validation), ErrorMessageResourceName = "Required")]
        [Range(1, int.MaxValue, ErrorMessage = "The 'State' field is required.")]
        public int? StateId { get; set; }
        [Required(ErrorMessageResourceType = typeof(Validation), ErrorMessageResourceName = "Required")]
        [Range(1, int.MaxValue, ErrorMessage = "The 'City' field is required.")]
        public int? CityId { get; set; }
        [StringLength(250, MinimumLength = 1)]
        [Required(ErrorMessageResourceType = typeof(Validation), ErrorMessageResourceName = "Required")]
        public string? Zone { get; set; }
        [StringLength(250, MinimumLength = 1)]
        //[Required(ErrorMessageResourceType = typeof(Validation), ErrorMessageResourceName = "Required")]
        public string? BuildingProject { get; set; }
        [StringLength(20, MinimumLength = 1)]
        public string? Latitude { get; set; }
        [StringLength(20, MinimumLength = 1)]
        public string? Longitude { get; set; }
        [StringLength(250, MinimumLength = 1)]
        [Required(ErrorMessageResourceType = typeof(Validation), ErrorMessageResourceName = "Required")]
        public string? Address1 { get; set; }
        [StringLength(250, MinimumLength = 1)]
        public string? Address2 { get; set; }
        [StringLength(10, MinimumLength = 5)]
        public string? Pincode { get; set; }
        [StringLength(250, MinimumLength = 1)]
        public string? Landmark { get; set; }
    }
}
