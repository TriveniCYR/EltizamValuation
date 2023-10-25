using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Eltizam.Business.Models
{
    public class MasterPropertyDetailModel
    {
        public int Id { get; set; }
        public int PropertyId { get; set; }
        public int? CountryId { get; set; }
        public int? StateId { get; set; }
        public int? CityId { get; set; }
        public string? Zone { get; set; }
        public string? BuildingProject { get; set; }
        public string? Latitude { get; set; }
        public string? Longitude { get; set; }
        public string? Address1 { get; set; }
        public string? Address2 { get; set; }
        public string? Pincode { get; set; }
        public string? Landmark { get; set; }
    }
}
