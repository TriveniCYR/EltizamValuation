using System;
using System.Collections.Generic;

namespace Eltizam.Data.DataAccess.Entity
{
    public partial class ValuationPaymentInvoiceMap
    {
        public int Id { get; set; }
        public int InvoiceId { get; set; }
        public int PaymentInvoiceId { get; set; }
        public string? Note { get; set; }
        public int CreatedBy { get; set; }
        public DateTime CreatedDate { get; set; }
        public int? ModifiedBy { get; set; }
        public DateTime? ModifiedDate { get; set; }
        public bool? IsDeleted { get; set; }

        public virtual ValuationInvoice Invoice { get; set; } = null!;
        public virtual ValuationPaymentInvoice PaymentInvoice { get; set; } = null!;
    }
}
