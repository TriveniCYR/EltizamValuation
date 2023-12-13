using System;
using System.Collections.Generic;

namespace Eltizam.Data.DataAccess.Entity
{
    public partial class MasterPropertyAmenity
    {
        public int Id { get; set; }
        public int AmenityId { get; set; }
        public int PropertyId { get; set; }
        public bool? IsActive { get; set; }
        public DateTime? CreatedDate { get; set; }
        public int? CreatedBy { get; set; }
        public DateTime? ModifiedDate { get; set; }
        public int? ModifiedBy { get; set; }
        public int? PropertyTypeId { get; set; }
        public bool? IsDeleted { get; set; }

        public virtual MasterAmenity Amenity { get; set; } = null!;
        public virtual MasterProperty Property { get; set; } = null!;
    }
}
