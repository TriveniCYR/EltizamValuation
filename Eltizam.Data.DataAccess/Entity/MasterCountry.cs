using System;
using System.Collections.Generic;

namespace Eltizam.Data.DataAccess.Entity
{
    public partial class MasterCountry
    {
        public MasterCountry()
        {
            MasterAddresses = new HashSet<MasterAddress>();
            MasterClients = new HashSet<MasterClient>();
            MasterLocations = new HashSet<MasterLocation>();
            MasterStates = new HashSet<MasterState>();
        }

        public int Id { get; set; }
        public string CountryName { get; set; } = null!;
        public string? CountryCode { get; set; }
        public string? IsdcountryCode { get; set; }
        public int? IsActive { get; set; }
        public DateTime? CreatedDate { get; set; }
        public int? CreatedBy { get; set; }
        public DateTime? ModifiedDate { get; set; }
        public int? ModifiedBy { get; set; }

        public virtual ICollection<MasterAddress> MasterAddresses { get; set; }
        public virtual ICollection<MasterClient> MasterClients { get; set; }
        public virtual ICollection<MasterLocation> MasterLocations { get; set; }
        public virtual ICollection<MasterState> MasterStates { get; set; }
    }
}
