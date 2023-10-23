using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Eltizam.Business.Models
{
    public class MasterValuationFeesModel
    {
        public int Id { get; set; }
        public int? PropertyTypeId { get; set; }
        public int? PropertySubTypeId { get; set; }
        public int? OwnershipTypeId { get; set; }
        public string? CarpetAreaInSqFt { get; set; }
        public string? CarpetAreaInSqMtr { get; set; }
        public int? ClientTypeId { get; set; }
        public int? ValuationType { get; set; }
        public int? ValuationFeeTypeId { get; set; }
        public decimal? ValuationFees { get; set; }
        public decimal? Vat { get; set; }
        public decimal? OtherCharges { get; set; }
        public decimal? TotalValuationFees { get; set; }
        public string? ValuationFeeType { get; set; }
        public string? PropertyType { get; set; }
        public string? ClientType { get; set; }
        public int? CreatedBy { get; set; }
        public DateTime? CreatedDate { get; set; }
        public DateTime? ModifiedDate { get; set; }
        public int? ModifiedBy { get; set; }
        public decimal? FixedvaluationFees { get; set; }
        public List<MasterPropertyTypeModel>? propertyTypeViewModels { get; set; }
        public List<Master_ClientTypeModel>? master_ClientTypeModels { get; set; }
        public List<MasterOwnershipTypeEntity>? masterOwnershipTypeEntities { get; set; }
        public List<MasterValuationFeeTypeModel>? masterValuationFeeTypeModels { get; set; }
    }
}
