using System;
using System.Collections.Generic;

namespace Eltizam.Data.DataAccess.Entity
{
    public partial class MasterProperty
    {
        public MasterProperty()
        {
            MasterPropertyAmenities = new HashSet<MasterPropertyAmenity>();
            MasterPropertyLocations = new HashSet<MasterPropertyLocation>();
            ValuationRequests = new HashSet<ValuationRequest>();
        }

        public int Id { get; set; }
        public string? PropertyName { get; set; }
        public int? PropertyTypeId { get; set; }
        public int? PropertySubTypeId { get; set; }
        public int? OwnershipTypeId { get; set; }
        public string? UnitType { get; set; }
        public string? AdditionalUnits { get; set; }
        public int? Furnished { get; set; }
        public string? ValuationPurpose { get; set; }
        public decimal? BuildUpAreaSqFt { get; set; }
        public decimal? BuildUpAreaSqMtr { get; set; }
        public int? AgeOfConstruction { get; set; }
        public bool? IsActive { get; set; }
        public string? Parking { get; set; }
        public string? ParkingBayNo { get; set; }
        public string? Description { get; set; }
        public string? Amenities { get; set; }
        public DateTime? CreatedDate { get; set; }
        public int? CreatedBy { get; set; }
        public DateTime? ModifiedDate { get; set; }
        public int? ModifiedBy { get; set; }
        public bool? IsDeleted { get; set; }
        public string? UnitNumber { get; set; }

        public virtual ICollection<MasterPropertyAmenity> MasterPropertyAmenities { get; set; }
        public virtual ICollection<MasterPropertyLocation> MasterPropertyLocations { get; set; }
        public virtual ICollection<ValuationRequest> ValuationRequests { get; set; }
    }
}
