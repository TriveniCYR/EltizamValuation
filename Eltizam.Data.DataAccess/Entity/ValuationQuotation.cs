using System;
using System.Collections.Generic;

namespace Eltizam.Data.DataAccess.Entity
{
    public partial class ValuationQuotation
    {
        public int Id { get; set; }
        public string ReferenceNo { get; set; } = null!;
        public int ValuationRequestId { get; set; }
        public int StatusId { get; set; }
        public decimal ValuationFee { get; set; }
        public decimal Vat { get; set; }
        public decimal? OtherCharges { get; set; }
        public decimal? InstructorCharges { get; set; }
        public decimal? Discount { get; set; }
        public decimal? TotalFee { get; set; }
        public string? Note { get; set; }
        public int? CreatedBy { get; set; }
        public DateTime CreatedDate { get; set; }
        public int? ModifyBy { get; set; }
        public DateTime? ModifyDate { get; set; }

        public virtual ValuationQuotationStatus Status { get; set; } = null!;
        public virtual ValuationRequest ValuationRequest { get; set; } = null!;
    }
}
