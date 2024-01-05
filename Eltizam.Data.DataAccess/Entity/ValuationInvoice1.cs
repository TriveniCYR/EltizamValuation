using System;
using System.Collections.Generic;

namespace Eltizam.Data.DataAccess.Entity
{
    public partial class ValuationInvoice1
    {
        public ValuationInvoice1()
        {
            InverseValuationRequest = new HashSet<ValuationInvoice1>();
            ValuationInvoicesMaps = new HashSet<ValuationInvoicesMap>();
        }

        public int Id { get; set; }
        public int ValuationRequestId { get; set; }
        public string InvoiceNo { get; set; } = null!;
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

        public virtual ValuationInvoice1 ValuationRequest { get; set; } = null!;
        public virtual ICollection<ValuationInvoice1> InverseValuationRequest { get; set; }
        public virtual ICollection<ValuationInvoicesMap> ValuationInvoicesMaps { get; set; }
    }
}
