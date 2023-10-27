using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Eltizam.Business.Models
{
    public class MasterLocationEntity
    {
        public int Id { get; set; }
        public string? LocationName { get; set; } 
        public int CountryId { get; set; }
        public string? CountryName { get; set; }
        public int StateId { get; set; }
        public string? StateName { get; set; }
        public int CityId { get; set; }
        public string? CityName { get; set; }
        public string Sector { get; set; }
        public int Status { get; set; }
        public string? Latitude { get; set; }
        public string? Longitude { get; set; }
        public DateTime CreatedDate { get; set; }
        public int? CreatedBy { get; set; }
        public DateTime? ModifiedDate { get; set; }
        public int? ModifiedBy { get; set; }
        public int HomeCurrencyId { get; set; }
        public int ForeignCurrencyId { get; set; }
        public string? HomeCurrency { get; set; }
        public string? ForeignCurrency { get; set; }
        public string? CurrencyName { get; set; }
        //public string BuildingType { get; set; }
        public string? RegionName { get; set; }
        public string? StatesEmirates { get; set; }
    }
    public class MasterLocationList
    {
        public int draw { get; set; }
        public int recordsTotal { get; set; }
        public int recordsFiltered { get; set; }
        public List<MasterLocationEntity> data { get; set; }
    }
}
