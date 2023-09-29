using System;
using System.Collections.Generic;

namespace Eltizam.Data.DataAccess.Entity
{
    public partial class MasterUserAddress
    {
        public int Id { get; set; }
        public int? UserId { get; set; }
        public string Address1 { get; set; } = null!;
        public string? Address2 { get; set; }
        public string? Address3 { get; set; }
        public string? PinNo { get; set; }
        public int CountryId { get; set; }
        public int StateId { get; set; }
        public int CityId { get; set; }
        public bool IsActive { get; set; }
        public DateTime? CreatedDate { get; set; }
        public int? CreatedBy { get; set; }
        public DateTime? ModifiedDate { get; set; }
        public int? ModifiedBy { get; set; }

        public virtual MasterCity City { get; set; } = null!;
        public virtual MasterCountry Country { get; set; } = null!;
        public virtual MasterState State { get; set; } = null!;
        public virtual MasterUser? User { get; set; }
    }
}
