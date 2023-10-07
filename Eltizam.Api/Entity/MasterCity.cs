using System;
using System.Collections.Generic;

namespace EltizamValuation.Api.Entity
{
    public partial class MasterCity
    {
        public MasterCity()
        {
            MasterAddresses = new HashSet<MasterAddress>();
            MasterLocations = new HashSet<MasterLocation>();
            MasterUserAddresses = new HashSet<MasterUserAddress>();
        }

        public int Id { get; set; }
        public int CountryId { get; set; }
        public int StateId { get; set; }
        public string? CityName { get; set; }
        public string? Stdcode { get; set; }
        public int? IsActive { get; set; }
        public DateTime? CreatedDate { get; set; }
        public int? CreatedBy { get; set; }
        public DateTime? ModifiedDate { get; set; }
        public int? ModifiedBy { get; set; }

        public virtual ICollection<MasterAddress> MasterAddresses { get; set; }
        public virtual ICollection<MasterLocation> MasterLocations { get; set; }
        public virtual ICollection<MasterUserAddress> MasterUserAddresses { get; set; }
    }
}
