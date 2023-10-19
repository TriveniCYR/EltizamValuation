using System;
using System.Collections.Generic;

namespace Eltizam.Data.DataAccess.Entity
{
    public partial class MasterValuationFee
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
        public int? ValuationTypeId { get; set; }

        public virtual MasterClientType? ClientType { get; set; }
        public virtual MasterOwnershipType? OwnershipType { get; set; }
        public virtual MasterPropertySubType? PropertySubType { get; set; }
        public virtual MasterPropertyType? PropertyType { get; set; }
        public virtual MasterValuationFeeType? ValuationFeeType { get; set; }
        public virtual MasterValuationType? ValuationTypeNavigation { get; set; }
    }
}
