using System;
using System.Collections.Generic;

namespace Eltizam.Data.DataAccess.Entity
{
    public partial class MasterCurrency
    {
        public int Id { get; set; }
        public string CurrencyName { get; set; } = null!;
        public decimal? CurrencyValue { get; set; }
        public string? CurrencyCode { get; set; }
        public decimal? ExchangeRate { get; set; }
        public int? StateId { get; set; }
        public int? IsActive { get; set; }
        public DateTime? CreatedDate { get; set; }
        public int? CreatedBy { get; set; }
        public DateTime? ModifiedDate { get; set; }
        public int? ModifiedBy { get; set; }
    }
}
