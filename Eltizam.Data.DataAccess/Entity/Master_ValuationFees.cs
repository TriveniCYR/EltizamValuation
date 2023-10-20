using Eltizam.Business.Models;
using System;
using System.Collections.Generic;

namespace Eltizam.Data.DataAccess.Entity
{
    public partial class Master_ValuationFees
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
        public DateTime? CreatedDate { get; set; }
        public int? CreatedBy { get; set; }
        public DateTime? ModifiedDate { get; set; }
        public int? ModifiedBy { get; set; }
        public virtual List<MasterPropertyTypeViewModel>? propertyTypeViewModels { get; set; }
        public virtual List<Master_ClientTypeModel>? master_ClientTypeModels { get; set; }
        public virtual List<MasterOwnershipTypeEntity>? masterOwnershipTypeEntities { get; set; }
        public virtual List<MasterValuationFeeTypeModel>? masterValuationFeeTypeModels { get; set; }
    }
}
