using Eltizam.Resource.Resources;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Eltizam.Business.Models
{
    public class MasterValuationFeesModel: GlobalAuditFields
    {
        public int Id { get; set; }
        [Required(ErrorMessageResourceType = typeof(Validation), ErrorMessageResourceName = "Required")]
        [Range(1, int.MaxValue, ErrorMessage = "The 'PropertyType' field is required.")]
        public int? PropertyTypeId { get; set; }
        [Required(ErrorMessageResourceType = typeof(Validation), ErrorMessageResourceName = "Required")]
        [Range(1, int.MaxValue, ErrorMessage = "The 'PropertySubType' field is required.")]
        public int? PropertySubTypeId { get; set; }
        [Required(ErrorMessageResourceType = typeof(Validation), ErrorMessageResourceName = "Required")]
        [Range(1, int.MaxValue, ErrorMessage = "The 'OwnershipType' field is required.")]
        public int? OwnershipTypeId { get; set; }
        [Required(ErrorMessageResourceType = typeof(Validation), ErrorMessageResourceName = "Required")]
        public string? CarpetAreaInSqFt { get; set; }
        [Required(ErrorMessageResourceType = typeof(Validation), ErrorMessageResourceName = "Required")]
        public string? CarpetAreaInSqMtr { get; set; }
        [Required(ErrorMessageResourceType = typeof(Validation), ErrorMessageResourceName = "Required")]
        [Range(1, int.MaxValue, ErrorMessage = "The 'ClientType' field is required.")]
        public int? ClientTypeId { get; set; }
        public int? ValuationType { get; set; }
        [Required(ErrorMessageResourceType = typeof(Validation), ErrorMessageResourceName = "Required")]
        [Range(1, int.MaxValue, ErrorMessage = "The 'ValuationFeeType' field is required.")]
        public int? ValuationFeeTypeId { get; set; }
        //[Required(ErrorMessageResourceType = typeof(Validation), ErrorMessageResourceName = "Required")]
        public decimal? ValuationFees { get; set; }
        //[Required(ErrorMessageResourceType = typeof(Validation), ErrorMessageResourceName = "Required")]
        public decimal? Vat { get; set; }
       // [Required(ErrorMessageResourceType = typeof(Validation), ErrorMessageResourceName = "Required")]
        public decimal? OtherCharges { get; set; }
      //  [Required(ErrorMessageResourceType = typeof(Validation), ErrorMessageResourceName = "Required")]
        public decimal? TotalValuationFees { get; set; }
        public string? ValuationFeeType { get; set; }
        public string? PropertyType { get; set; }
        public string? ClientType { get; set; }
        public DateTime? CreatedDate { get; set; }
        public DateTime? ModifiedDate { get; set; }
        //[Required(ErrorMessageResourceType = typeof(Validation), ErrorMessageResourceName = "Required")]
        public decimal? FixedvaluationFees { get; set; }
        public bool IsActive { get; set; }
        public List<Master_PropertyTypeModel>? propertyTypeViewModels { get; set; }
        public List<Master_ClientTypeModel>? master_ClientTypeModels { get; set; }
        public List<MasterOwnershipTypeEntity>? masterOwnershipTypeEntities { get; set; }
        public List<MasterValuationFeeTypeModel>? masterValuationFeeTypeModels { get; set; }
    }
}
