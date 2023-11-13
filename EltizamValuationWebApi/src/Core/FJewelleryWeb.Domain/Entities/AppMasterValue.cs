using System;
using System.Collections.Generic;

namespace ValuationWeb.Domain.Entities
{
    /// <summary>
    /// ss
    /// </summary>
    public partial class AppMasterValue
    {
        public int Id { get; set; }
        public string Type { get; set; } = null!;
        public string Description { get; set; } = null!;
        public string Code { get; set; } = null!;
        public bool? IsActive { get; set; }
        public int? CreatedBy { get; set; }
        public DateTime? CreatedDate { get; set; }
        public int? ModifiedBy { get; set; }
        public DateTime? ModifiedDate { get; set; }
    }
}
