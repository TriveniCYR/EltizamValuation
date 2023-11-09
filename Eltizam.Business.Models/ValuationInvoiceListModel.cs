using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Eltizam.Business.Models
{
    public class ValuationInvoiceListModel
    {
        public int Id { get; set; }
        public string ReferenceNo { get; set; } = null!;
        public int ValuationRequestId { get; set; }
        public int TransactionModeId { get; set; }
        public int TransactionStatusId { get; set; }
        public decimal Amount { get; set; }
        public string? CheckNumer { get; set; }
        public string? CheckBankName { get; set; }
        public DateTime? CheckDate { get; set; }
        public string? CardNumber { get; set; }
        public string? CardBankName { get; set; }
        public string? CardHolderName { get; set; }
        public DateTime? ExpireDate { get; set; }
        public string? AccountBankName { get; set; }
        public string? AccountHolderName { get; set; }
        public string? TransactionDate { get; set; }
        public string? Note { get; set; }
        public int? CreatedBy { get; set; }
        public int? ModifiedBy { get; set; }
    }
}
