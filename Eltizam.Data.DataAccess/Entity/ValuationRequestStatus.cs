using System;
using System.Collections.Generic;

namespace Eltizam.Data.DataAccess.Entity
{
    public partial class ValuationRequestStatus
    {
        public ValuationRequestStatus()
        {
            ValuationRequests = new HashSet<ValuationRequest>();
        }

        public int Id { get; set; }
        public string StatusName { get; set; } = null!;
        public bool? IsActive { get; set; }
        public int CreatedBy { get; set; }
        public DateTime CreatedDate { get; set; }
        public int? ModifyBy { get; set; }
        public DateTime? ModifyDate { get; set; }
        public string? ColorCode { get; set; }

        public virtual ICollection<ValuationRequest> ValuationRequests { get; set; }
    }
}
