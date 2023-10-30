using System;
using System.Collections.Generic;

namespace Eltizam.Data.DataAccess.Entity
{
    public partial class ValuationQuotationStatus
    {
        public ValuationQuotationStatus()
        {
            ValuationQuotations = new HashSet<ValuationQuotation>();
        }

        public int Id { get; set; }
        public string StatusName { get; set; } = null!;
        public bool? IsActive { get; set; }
        public int CreatedBy { get; set; }
        public DateTime CreatedDate { get; set; }
        public int? ModifyBy { get; set; }
        public DateTime? ModifyDate { get; set; }

        public virtual ICollection<ValuationQuotation> ValuationQuotations { get; set; }
    }
}
