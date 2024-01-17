using System.ComponentModel.DataAnnotations;

namespace Eltizam.Business.Models
{
    public class ValuationInvoiceListModel // ValuationRequestHeader
    {
        public int Id { get; set; }
        public int TransactionModeId { get; set; }
        public int ValuationRequestId { get; set; }
        public string? ReferenceNo { get; set; }
        public string? TransactionMode { get; set; }
        public int TransactionStatusId { get; set; }
        public int? CashTransactionStatusId { get; set; }
        public int? ChequeTransactionStatusId { get; set; }
        public int? CardTransactionStatusId { get; set; }
        public int? BankTransactionStatusId { get; set; }
        public string? TransactionStatusName { get; set; }
        public decimal Amount { get; set; }
        public decimal? CashAmount { get; set; }
        public decimal? ChequeAmount { get; set; }
        public decimal? CardAmount { get; set; }
        public decimal? BankAmount { get; set; }
        [StringLength(250, MinimumLength = 1)]
        public string? CheckNumer { get; set; }
        [StringLength(250, MinimumLength = 1)]
        public string? CheckBankName { get; set; }
        public DateTime? CheckDate { get; set; }
        public string? CardNumber { get; set; }
        [StringLength(250, MinimumLength = 1)]
        public string? CardBankName { get; set; }
        [StringLength(250, MinimumLength = 1)]
        public string? CardHolderName { get; set; }
        public DateTime? ExpireDate { get; set; }
        [StringLength(250, MinimumLength = 1)]
        public string? AccountBankName { get; set; }
        public string? AccountHolderName { get; set; }
        public DateTime? TransactionDate { get; set; }
        public DateTime? CashTransactionDate { get; set; }
        public DateTime? ChequeTransactionDate { get; set; }
        public DateTime? CardTransactionDate { get; set; }
        public DateTime? BankTransactionDate { get; set; }
        public string? TransactionId { get; set; }
        [StringLength(100, MinimumLength = 1)]
        public string? CardTransactionId { get; set; }
        [StringLength(100, MinimumLength = 1)]
        public string? BankTransactionId { get; set; }
        public DateTime? ChequeRecievedDate { get; set; }
        public string? Note { get; set; }
        public int? CreatedBy { get; set; }
        public int? ModifiedBy { get; set; }
        public string? UserName { get; set; }
        public string? RequestStatus { get; set; }
        public string? InvoiceIds { get; set; }
        public List<MasterDocumentModel>? Documents { get; set; }
        public List<MasterDocumentModel>? uploadDocument { get; set; }
        public DocumentFilesModel? Document { get; set; }
    }
}
