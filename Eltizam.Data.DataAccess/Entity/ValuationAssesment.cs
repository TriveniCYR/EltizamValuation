using System;
using System.Collections.Generic;

namespace Eltizam.Data.DataAccess.Entity
{
    public partial class ValuationAssesment
    {
        public int Id { get; set; }
        public int? RequestId { get; set; }
        public decimal? MarketValue { get; set; }
        public decimal? MarketRate { get; set; }
        public int? LifeOfBuilding { get; set; }
        public decimal? AnnualMaintainceCost { get; set; }
        public bool? Insuarance { get; set; }
        public int? CreatedBy { get; set; }
        public int? ModifiedBy { get; set; }
        public DateTime? CreatedDate { get; set; }
        public DateTime? ModifiedDate { get; set; }
        public bool? IsActive { get; set; }
        public string? InsuranceDetails { get; set; }

        public virtual ValuationRequest? Request { get; set; }
    }
}
