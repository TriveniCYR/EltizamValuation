using System;
using System.Collections.Generic;

namespace Eltizam.Data.DataAccess.Entity
{
    public partial class MasterPropertyType
    {
        public MasterPropertyType()
        {
            MasterPropertySubTypes = new HashSet<MasterPropertySubType>();
            MasterValuationFees = new HashSet<MasterValuationFee>();
        }

        public int Id { get; set; }
        public string PropertyType { get; set; } = null!;
        public int? IsActive { get; set; }
        public DateTime? CreatedDate { get; set; }
        public int? CreatedBy { get; set; }
        public DateTime? ModifiedDate { get; set; }
        public int? ModifiedBy { get; set; }

        public virtual ICollection<MasterPropertySubType> MasterPropertySubTypes { get; set; }
        public virtual ICollection<MasterValuationFee> MasterValuationFees { get; set; }
    }
}
