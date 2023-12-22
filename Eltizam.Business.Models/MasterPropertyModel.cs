using Eltizam.Resource.Resources;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Eltizam.Business.Models
{
    public class MasterPropertyModel:GlobalAuditFields
    {
        public int Id { get; set; }
        [StringLength(250, MinimumLength = 1)]
        [Required(ErrorMessageResourceType = typeof(Validation), ErrorMessageResourceName = "Required")]
        public string PropertyName { get; set; }
        [Required(ErrorMessageResourceType = typeof(Validation), ErrorMessageResourceName = "Required")]
        [Range(1, int.MaxValue, ErrorMessage = "The 'PropertyType' field is required.")]
        public int PropertyTypeId { get; set; }
        public int? PropertySubTypeId { get; set; }
        [Required(ErrorMessageResourceType = typeof(Validation), ErrorMessageResourceName = "Required")]
        [Range(1, int.MaxValue, ErrorMessage = "The 'OwnershipType' field is required.")]
        public int OwnershipTypeId { get; set; }
        [Required(ErrorMessageResourceType = typeof(Validation), ErrorMessageResourceName = "Required")]
        public string UnitType { get; set; }
        [StringLength(250, MinimumLength = 1)]
        public string? AdditionalUnits { get; set; }
        //[Required(ErrorMessageResourceType = typeof(Validation), ErrorMessageResourceName = "Required")]
        //[Range(1, int.MaxValue, ErrorMessage = "The 'Furnished' field is required.")]
        public int Furnished { get; set; }
        [StringLength(250, MinimumLength = 1)]
        public string? ValuationPurpose { get; set; }
        //[StringLength(25, MinimumLength = 1)]
        [Required(ErrorMessageResourceType = typeof(Validation), ErrorMessageResourceName = "Required")]
        public decimal? BuildUpAreaSqFt { get; set; }
        //[StringLength(25, MinimumLength = 1)]
        [Required(ErrorMessageResourceType = typeof(Validation), ErrorMessageResourceName = "Required")]
        public decimal? BuildUpAreaSqMtr { get; set; }
        //[StringLength(25, MinimumLength = 1)]
        public int? AgeOfConstruction { get; set; }
        public bool IsActive { get; set; }
        [StringLength(250, MinimumLength = 1)]
        public string? Parking { get; set; }
        [StringLength(25, MinimumLength = 1)]
        public string? ParkingBayNo { get; set; }
        [StringLength(250, MinimumLength = 1)]
        public string? Description { get; set; }
      
        public string? Amenities { get; set; }
        public bool? IsDeleted { get; set; }
        public MasterPropertyDetailModel PropertyDetail { get; set; }
        public List<MasterAmenityListModel>? AmenityList { get; set; }
    }
}
