using System;
using System.Collections.Generic;

namespace Eltizam.Data.DataAccess.Entity
{
    public partial class MasterDepartment
    {
        public MasterDepartment()
        {
            MasterUsers = new HashSet<MasterUser>();
        }

        public int Id { get; set; }
        public string Department { get; set; } = null!;
        public int? IsActive { get; set; }
        public DateTime? CreatedDate { get; set; }
        public int? CreatedBy { get; set; }
        public DateTime? ModifiedDate { get; set; }
        public int? ModifiedBy { get; set; }

        public virtual ICollection<MasterUser> MasterUsers { get; set; }
    }
}
