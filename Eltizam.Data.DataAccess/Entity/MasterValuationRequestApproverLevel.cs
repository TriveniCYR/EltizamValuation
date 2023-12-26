using System;
using System.Collections.Generic;

namespace Eltizam.Data.DataAccess.Entity
{
    public partial class MasterValuationRequestApproverLevel
    {
        public int Id { get; set; }
        public string Description { get; set; } = null!;
        public decimal FromAmount { get; set; }
        public decimal? ToAmount { get; set; }
        public int CreatedBy { get; set; }
        public DateTime CreatedDate { get; set; }
        public int? ModifiedBy { get; set; }
        public DateTime? ModifiedDate { get; set; }
        public bool? IsDeleted { get; set; }
    }
}
