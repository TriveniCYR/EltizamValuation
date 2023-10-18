using System;
using System.Collections.Generic;

namespace Eltizam.Data.DataAccess.Entity
{
    public partial class MasterPropertySubType
    {
        public MasterPropertySubType()
        {
            MasterValuationFees = new HashSet<MasterValuationFee>();
        }

        public int Id { get; set; }
        public string PropertySubType { get; set; } = null!;
        public int? IsActive { get; set; }
        public DateTime? CreatedDate { get; set; }
        public int? CreatedBy { get; set; }
        public DateTime? ModifiedDate { get; set; }
        public int? ModifiedBy { get; set; }
        public int? PropertyTypeId { get; set; }

        public virtual MasterPropertyType? PropertyType { get; set; }
        public virtual ICollection<MasterValuationFee> MasterValuationFees { get; set; }
    }
}
