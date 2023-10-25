using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Eltizam.Business.Models
{
    public class MasterPropertyModel
    {
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
        public int? CreatedBy { get; set; }
        public string? Amenities { get; set; }
        public MasterPropertyDetailModel? PropertyDetail { get; set; }
        public List<MasterAmenityListModel>? AmenityList { get; set; }
    }
}
