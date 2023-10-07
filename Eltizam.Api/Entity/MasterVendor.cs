using System;
using System.Collections.Generic;

namespace EltizamValuation.Api.Entity
{
    public partial class MasterVendor
    {
        public int Id { get; set; }
        public string VendorName { get; set; } = null!;
        public string? CompanyName { get; set; }
        public DateTime? EstimattionDate { get; set; }
        public int? BusinessTypeId { get; set; }
        public string? CompanyDescription { get; set; }
        public int? Status { get; set; }
        public DateTime? CreatedDate { get; set; }
        public int? CreatedBy { get; set; }
        public DateTime? ModifiedDate { get; set; }
        public int? ModifiedBy { get; set; }
    }
}
