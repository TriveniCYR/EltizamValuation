using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Eltizam.Business.Models
{
    public class MasterValuationFeesListModel
    {
        public int Id { get; set; }
        public int? PropertyTypeId { get; set; }
        public string? PropertyType { get; set; }
        public int? PropertySubTypeId { get; set; }
        public string? PropertySubType { get; set; }
        public int? OwnershipTypeId { get; set; }
        public string? OwnershipType { get; set; }
        public string? CarpetAreaInSqFt { get; set; }
        public string? CarpetAreaInSqMtr { get; set; }
        public string? ClientTypeName { get; set; }
        public int? ClientTypeId { get; set; }
        public int? ValuationType { get; set; }
        public int? ValuationFeeTypeId { get; set; }
        public string? ValuationFeeType { get; set; }
        public decimal? ValuationFees { get; set; }
        public decimal? Vat { get; set; }
        public decimal? OtherCharges { get; set; }
        public decimal? TotalValuationFees { get; set; }
        public int? CreatedBy { get; set; }
    }
}
