using System;
using System.Collections.Generic;

namespace Eltizam.Data.DataAccess.Entity
{
    public partial class MasterPropertyDetail
    {
        public int Id { get; set; }
        public int PropertyId { get; set; }
        public int? CountryId { get; set; }
        public int? Stated { get; set; }
        public int? CityId { get; set; }
        public string? Zone { get; set; }
        public string? BuildingProject { get; set; }
        public string? Latitude { get; set; }
        public string? Longitude { get; set; }
        public string? Address1 { get; set; }
        public string? Address2 { get; set; }
        public string? Pincode { get; set; }
        public string? Landmark { get; set; }
        public DateTime? CreatedDate { get; set; }
        public int? CreatedBy { get; set; }
        public DateTime? ModifiedDate { get; set; }
        public int? ModifiedBy { get; set; }

        public virtual MasterProperty Property { get; set; } = null!;
    }
}
