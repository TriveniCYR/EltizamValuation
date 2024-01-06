using System;
using System.Collections.Generic;

namespace Eltizam.Data.DataAccess.Entity
{
    public partial class ValuationRequestApproverLevel
    {
        public int Id { get; set; }
        public int ValuationRequestId { get; set; }
        public int? ValuationQuotationId { get; set; }
        public int ApproverLevelId { get; set; }
        public int ApproverId { get; set; }
        public int CreatedBy { get; set; }
        public DateTime CreatedDate { get; set; }
        public int? ModifiedBy { get; set; }
        public DateTime? ModifiedDate { get; set; }
        public bool? IsDeleted { get; set; }
        public int? StatusId { get; set; }
        public string? ApproverComment { get; set; }

        public virtual ValuationRequest ValuationRequest { get; set; } = null!;
    }
}
