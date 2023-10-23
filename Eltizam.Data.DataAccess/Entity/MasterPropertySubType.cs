using System;
using System.Collections.Generic;

namespace Eltizam.Data.DataAccess.Entity
{
    public partial class MasterPropertySubType
    {
        public int Id { get; set; }
        public string PropertySubType { get; set; } = null!;
        public bool? IsActive { get; set; }
        public DateTime? CreatedDate { get; set; }
        public int? CreatedBy { get; set; }
        public DateTime? ModifiedDate { get; set; }
        public int? ModifiedBy { get; set; }
        public int? PropertyTypeId { get; set; }

        public virtual MasterPropertyType? PropertyType { get; set; }
    }
}
