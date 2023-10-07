using System;
using System.Collections.Generic;

namespace Eltizam.Data.DataAccess.Entity
{
    public partial class MasterClient
    {
        public MasterClient()
        {
            MasterClientContacts = new HashSet<MasterClientContact>();
        }

        public int Id { get; set; }
        public string? FirstName { get; set; }
        public string? MiddleName { get; set; }
        public string? LastName { get; set; }
        public int? ClientTypeId { get; set; }
        public string? Company { get; set; }
        public string? Address1 { get; set; }
        public string? Address2 { get; set; }
        public string? PinNo { get; set; }
        public int? CountryId { get; set; }
        public int? StateId { get; set; }
        public int? CityId { get; set; }
        public string? Trnnumber { get; set; }
        public DateTime? TrnexpiryDate { get; set; }
        public string? LicenseNumber { get; set; }
        public int? IsActive { get; set; }
        public string? Logo { get; set; }
        public DateTime? CreatedDate { get; set; }
        public int? CreatedBy { get; set; }
        public DateTime? ModifiedDate { get; set; }
        public int? ModidiedBy { get; set; }

        public virtual MasterCity? City { get; set; }
        public virtual MasterClientType? ClientType { get; set; }
        public virtual MasterCountry? Country { get; set; }
        public virtual MasterState? State { get; set; }
        public virtual ICollection<MasterClientContact> MasterClientContacts { get; set; }
    }
}
