using System;
using System.Collections.Generic;

namespace EltizamValuation.Api.Entity
{
    public partial class MasterOwnershipType
    {
        public MasterOwnershipType()
        {
            MasterValuationFees = new HashSet<MasterValuationFee>();
        }

        public int Id { get; set; }
        public string OwnershipType { get; set; } = null!;
        public int? IsActive { get; set; }
        public DateTime? CreatedDate { get; set; }
        public int? CreatedBy { get; set; }
        public DateTime? ModifiedDate { get; set; }
        public int? ModifiedBy { get; set; }

        public virtual ICollection<MasterValuationFee> MasterValuationFees { get; set; }
    }
}
