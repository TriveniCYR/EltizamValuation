using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Eltizam.Business.Models
{
    public class ValuationRequestDependencies
    {
        public int Id { get; set; }
        public string? ReferenceNo { get; set; }
        public int ClientId { get; set; }
        public string? ClientName { get; set; }
        public int ClientTypeId { get; set; }
        public string? ClientType { get; set; }
        public int PropertyTypeId { get; set; }
        public string? PropertyType { get; set; }
        public int? OwnershipTypeId { get; set; }
        public string? OwnershipType { get; set; }
        public int PropertySubTypeId { get; set; }
        public string? PropertySubType { get; set; } 
        public int PropertyId { get; set; }
        public string? PropertyName { get; set; }
        public int? UnitTypeId { get; set; }
        public int? FurnishedId { get; set; }
        public string? UnitType { get; set; }
        public string? Furnished { get; set; }
        public int? LocationCountryId { get; set; }
        public int? LocationStateId { get; set; }
        public int? LocationCityId { get; set; }

        public string? StatusName { get; set; }
        public string? ColorCode { get; set; }
        public string? BackGroundColor { get; set; } 
    }
}
