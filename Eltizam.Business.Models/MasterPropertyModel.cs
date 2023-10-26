using Eltizam.Resource.Resources;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Eltizam.Business.Models
{
    public class MasterPropertyModel
    {
        public int Id { get; set; }
        [Required(ErrorMessageResourceType = typeof(Validation), ErrorMessageResourceName = "Required")]
        public string PropertyName { get; set; }
        [Required(ErrorMessageResourceType = typeof(Validation), ErrorMessageResourceName = "Required")]
        [Range(1, int.MaxValue, ErrorMessage = "Selection is required.")]
        public int PropertyTypeId { get; set; }
        public int? PropertySubTypeId { get; set; }
        [Required(ErrorMessageResourceType = typeof(Validation), ErrorMessageResourceName = "Required")]
        [Range(1, int.MaxValue, ErrorMessage = "Selection is required.")]
        public int OwnershipTypeId { get; set; }
        [Required(ErrorMessageResourceType = typeof(Validation), ErrorMessageResourceName = "Required")]
        public string UnitType { get; set; }
        public string? AdditionalUnits { get; set; }
        [Required(ErrorMessageResourceType = typeof(Validation), ErrorMessageResourceName = "Required")]
        [Range(1, int.MaxValue, ErrorMessage = "Selection is required.")]
        public int Furnished { get; set; }
        public string? ValuationPurpose { get; set; }
        [Required(ErrorMessageResourceType = typeof(Validation), ErrorMessageResourceName = "Required")]
        public decimal? BuildUpAreaSqFt { get; set; }
        [Required(ErrorMessageResourceType = typeof(Validation), ErrorMessageResourceName = "Required")]
        public decimal? BuildUpAreaSqMtr { get; set; }
        public int? AgeOfConstruction { get; set; }
        public bool? IsActive { get; set; }
        public string? Parking { get; set; }
        public string? ParkingBayNo { get; set; }
        public string? Description { get; set; }
        public int? CreatedBy { get; set; }
        public string? Amenities { get; set; }
        public MasterPropertyDetailModel? PropertyDetail { get; set; }
        public List<MasterAmenityListModel>? AmenityList { get; set; }
    }
}
