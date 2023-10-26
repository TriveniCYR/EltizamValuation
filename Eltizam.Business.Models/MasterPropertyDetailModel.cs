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
        [Range(1, int.MaxValue, ErrorMessage = "Selection is required.")]
        public int? CountryId { get; set; }
        [Required(ErrorMessageResourceType = typeof(Validation), ErrorMessageResourceName = "Required")]
        [Range(1, int.MaxValue, ErrorMessage = "Selection is required.")]
        public int? StateId { get; set; }
        [Required(ErrorMessageResourceType = typeof(Validation), ErrorMessageResourceName = "Required")]
        [Range(1, int.MaxValue, ErrorMessage = "Selection is required.")]
        public int? CityId { get; set; }
        [Required(ErrorMessageResourceType = typeof(Validation), ErrorMessageResourceName = "Required")]
        public string? Zone { get; set; }
        public string? BuildingProject { get; set; }
        public string? Latitude { get; set; }
        public string? Longitude { get; set; }
        [Required(ErrorMessageResourceType = typeof(Validation), ErrorMessageResourceName = "Required")]
        public string? Address1 { get; set; }
        public string? Address2 { get; set; }
        public string? Pincode { get; set; }
        public string? Landmark { get; set; }
    }
}
