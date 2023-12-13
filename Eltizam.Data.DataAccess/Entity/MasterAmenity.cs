using System;
using System.Collections.Generic;

namespace Eltizam.Data.DataAccess.Entity
{
    public partial class MasterAmenity
    {
        public MasterAmenity()
        {
            MasterPropertyAmenities = new HashSet<MasterPropertyAmenity>();
        }

        public int Id { get; set; }
        public string AmenityName { get; set; } = null!;
        public bool? IsActive { get; set; }
        public DateTime? CreatedDate { get; set; }
        public int? CreatedBy { get; set; }
        public DateTime? ModifiedDate { get; set; }
        public int? ModifiedBy { get; set; }
        public string? Icon { get; set; }
        public bool? IsDeleted { get; set; }

        public virtual ICollection<MasterPropertyAmenity> MasterPropertyAmenities { get; set; }
    }
}
