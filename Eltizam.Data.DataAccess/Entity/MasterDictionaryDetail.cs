using System;
using System.Collections.Generic;

namespace Eltizam.Data.DataAccess.Entity
{
    public partial class MasterDictionaryDetail
    {
        public MasterDictionaryDetail()
        {
            MasterClients = new HashSet<MasterClient>();
            MasterPropertyFurnisheds = new HashSet<MasterProperty>();
            MasterPropertyOwnershipTypes = new HashSet<MasterProperty>();
            MasterPropertyUnitTypes = new HashSet<MasterProperty>();
            MasterUserDepartments = new HashSet<MasterUser>();
            MasterUserDesignations = new HashSet<MasterUser>();
        }

        public int Id { get; set; }
        public int DictionaryId { get; set; }
        public string Description { get; set; } = null!;
        public int? Sort { get; set; }
        public int? IsActive { get; set; }
        public int? CreatedBy { get; set; }
        public DateTime? CreatedDate { get; set; }
        public DateTime? ModifiedDate { get; set; }
        public int? ModifiedBy { get; set; }

        public virtual MasterDictionary Dictionary { get; set; } = null!;
        public virtual ICollection<MasterClient> MasterClients { get; set; }
        public virtual ICollection<MasterProperty> MasterPropertyFurnisheds { get; set; }
        public virtual ICollection<MasterProperty> MasterPropertyOwnershipTypes { get; set; }
        public virtual ICollection<MasterProperty> MasterPropertyUnitTypes { get; set; }
        public virtual ICollection<MasterUser> MasterUserDepartments { get; set; }
        public virtual ICollection<MasterUser> MasterUserDesignations { get; set; }
    }
}
