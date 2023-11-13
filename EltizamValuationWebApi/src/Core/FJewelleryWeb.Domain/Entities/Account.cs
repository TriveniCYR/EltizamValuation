using System;
using System.Collections.Generic;

namespace ValuationWeb.Domain.Entities
{
    public partial class Account
    {
        public int Id { get; set; }
        public string AccountNumber { get; set; } = null!;
        public string TableName { get; set; } = null!;
        public int TableKey { get; set; }
        public int AccountType { get; set; }
        public byte? BranchId { get; set; }
        public string? Currency { get; set; }
        public bool? IsApproved { get; set; }
        public DateTime? EffectiveDate { get; set; }
        public DateTime? ExpireDate { get; set; }
        public int? CreatedBy { get; set; }
        public DateTime? CreatedDate { get; set; }
        public int? ModifiedBy { get; set; }
        public DateTime? ModifiedDate { get; set; }
    }
}
