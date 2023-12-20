using System;
using System.Collections.Generic;

namespace Eltizam.Data.DataAccess.Entity
{
    public partial class MasterValuationStatus
    {
        public MasterValuationStatus()
        {
            ValuationRequests = new HashSet<ValuationRequest>();
        }

        public int Id { get; set; }
        public string Status { get; set; } = null!;
        public string StatusCode { get; set; } = null!;
        public bool? IsActive { get; set; }
        public int? Sort { get; set; }
        public int? Group { get; set; }
        public int CreatedBy { get; set; }
        public DateTime CreatedDate { get; set; }
        public int? ModifyBy { get; set; }
        public DateTime? ModifyDate { get; set; }
        public string? ColorCode { get; set; }
        public string? BackGroundColor { get; set; }
        public int? Type { get; set; }

        public virtual ICollection<ValuationRequest> ValuationRequests { get; set; }
    }
}
