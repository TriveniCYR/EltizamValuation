using System;
using System.Collections.Generic;

namespace Eltizam.Data.DataAccess.Entity
{
    public partial class ValuationPaymentInvoice
    {
        public ValuationPaymentInvoice()
        {
            InverseValuationRequest = new HashSet<ValuationPaymentInvoice>();
            ValuationPaymentInvoiceMaps = new HashSet<ValuationPaymentInvoiceMap>();
        }

        public int Id { get; set; }
        public int ValuationRequestId { get; set; }
        public string InvoiceNo { get; set; } = null!;
        public string ReferenceNO { get; set; } = null!;
        public int TransactionModeId { get; set; }
        public DateTime? TransactionDate { get; set; }
        public decimal Amount { get; set; }
        public decimal? Balance { get; set; }
        public string? Note { get; set; }
        public int CreatedBy { get; set; }
        public DateTime CreatedDate { get; set; }
        public int? ModifiedBy { get; set; }
        public DateTime? ModifiedDate { get; set; }
        public bool? IsDeleted { get; set; }
        public string? ReferenceNo { get; set; }

        public virtual ValuationPaymentInvoice ValuationRequest { get; set; } = null!;
        public virtual ICollection<ValuationPaymentInvoice> InverseValuationRequest { get; set; }
        public virtual ICollection<ValuationPaymentInvoiceMap> ValuationPaymentInvoiceMaps { get; set; }
    }
}
