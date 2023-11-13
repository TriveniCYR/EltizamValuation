using System;
using System.Collections.Generic;

namespace ValuationWeb.Domain.Entities
{
    public partial class Branch
    {
        public int Id { get; set; }
        public string Name { get; set; } = null!;
        public string JurName { get; set; } = null!;
        public string BankCode { get; set; } = null!;
        public string ManagerPost { get; set; } = null!;
        public string Manager { get; set; } = null!;
        public string AccountantPost { get; set; } = null!;
        public string Accountant { get; set; } = null!;
        public string? Address { get; set; }
        public string? Phone { get; set; }
        public DateTime? OpenDate { get; set; }
        public DateTime? CloseDate { get; set; }
        public int? DefaultCountryId { get; set; }
        public int? DefaultRegionId { get; set; }
        public int? DefaultAreaId { get; set; }
        public string User { get; set; } = null!;
        public DateTime Modified { get; set; }
        public string? Warrant { get; set; }
        public string? License { get; set; }
        public string? NameShort { get; set; }
        public bool? IsActive { get; set; }
    }
}
