using System;
using System.Collections.Generic;

namespace Eltizam.Data.DataAccess.Entity
{
    public partial class ValuationRequest
    {
        public ValuationRequest()
        {
            ValuationInvoices = new HashSet<ValuationInvoice>();
            ValuationQuotations = new HashSet<ValuationQuotation>();
        }

        public int Id { get; set; }
        public string ReferenceNo { get; set; } = null!;
        public string? OtherReferenceNo { get; set; }
        public int ValuationModeId { get; set; }
        public DateTime? ValuationDate { get; set; }
        public int? ValuationTimeFrame { get; set; }
        public int ClientId { get; set; }
        public int PropertyId { get; set; }
        public int StatusId { get; set; }
        public int? ApproverId { get; set; }
        public string? ApproverComment { get; set; }
        public DateTime? ApproverUpdateDate { get; set; }
        public int CreatedBy { get; set; }
        public DateTime CreatedDate { get; set; }
        public int? ModifiedBy { get; set; }
        public DateTime? ModifiedDate { get; set; }
        public int? ValuerId { get; set; }
        public string? ValuerComment { get; set; }
        public DateTime? ValuerUpdateDate { get; set; }
        public string? AssignRemark { get; set; }

        public virtual MasterUser? Approver { get; set; }
        public virtual MasterClient Client { get; set; } = null!;
        public virtual MasterProperty Property { get; set; } = null!;
        public virtual ValuationRequestStatus Status { get; set; } = null!;
        public virtual ICollection<ValuationInvoice> ValuationInvoices { get; set; }
        public virtual ICollection<ValuationQuotation> ValuationQuotations { get; set; }
    }
}
