using Eltizam.Resource.Resources;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Eltizam.Business.Models
{
    public class MasterLocationEntity: GlobalAuditFields
    {
        public int Id { get; set; }
        public string? LocationName { get; set; }
        [Required(ErrorMessageResourceType = typeof(Validation), ErrorMessageResourceName = "Required")]
        [Range(1, int.MaxValue, ErrorMessage = "The 'Country' field is required.")]
        public int CountryId { get; set; }
        public string? CountryName { get; set; }
        [Required(ErrorMessageResourceType = typeof(Validation), ErrorMessageResourceName = "Required")]
        [Range(1, int.MaxValue, ErrorMessage = "The 'State' field is required.")]
        public int StateId { get; set; }
        public string? StateName { get; set; }
        [Required(ErrorMessageResourceType = typeof(Validation), ErrorMessageResourceName = "Required")]
        [Range(1, int.MaxValue, ErrorMessage = "The 'City' field is required.")]
        public int CityId { get; set; }
        public string? CityName { get; set; }
        [StringLength(250, MinimumLength = 1)]
        public string Sector { get; set; }
        public int Status { get; set; }
        [StringLength(250, MinimumLength = 1)]
        public string? Latitude { get; set; }
        [StringLength(250, MinimumLength = 1)]
        public string? Longitude { get; set; }
        public DateTime CreatedDate { get; set; }
        public DateTime? ModifiedDate { get; set; }
        [Required(ErrorMessageResourceType = typeof(Validation), ErrorMessageResourceName = "Required")]
        [Range(1, int.MaxValue, ErrorMessage = "The 'HomeCurrency' field is required.")]
        public int HomeCurrencyId { get; set; }
        [Required(ErrorMessageResourceType = typeof(Validation), ErrorMessageResourceName = "Required")]
        [Range(1, int.MaxValue, ErrorMessage = "The 'ForeignCurrency' field is required.")]
        public int ForeignCurrencyId { get; set; }
        public string? HomeCurrency { get; set; }
        public string? ForeignCurrency { get; set; }
        public string? CurrencyName { get; set; }
        //public string BuildingType { get; set; }
        public string? RegionName { get; set; }
        public string? StatesEmirates { get; set; }
        public string? Description { get; set; }
        public bool IsActive { get; set; }
    }
    public class MasterLocationList
    {
        public int draw { get; set; }
        public int recordsTotal { get; set; }
        public int recordsFiltered { get; set; }
        public List<MasterLocationEntity> data { get; set; }
    }
}
