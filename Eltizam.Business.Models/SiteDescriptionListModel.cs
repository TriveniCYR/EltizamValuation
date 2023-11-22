using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Eltizam.Business.Models
{
    public class SiteDescriptionListModel
    {
        public int Id { get; set; }
        public int ValuationRequestId { get; set; }
        public string? Location { get; set; }
        public decimal? InternalArea { get; set; }
        public decimal? ExternalArea { get; set; }
        public int? Floor { get; set; }
        public int? Room { get; set; }
        public int? Bedrooms { get; set; }
        public string? Storage { get; set; }
        public int? Quantity { get; set; }
        public string? AdditionComment { get; set; }
        public string? PropertyCondition { get; set; }
        public string? AdditionalNotes { get; set; }
        public string? Others { get; set; }
        public int? ModifiedBy { get; set; }
        public int? CreatedBy { get; set; }
        public List<MasterDocumentModel>? Documents { get; set; }
        public List<MasterDocumentModel>? uploadDocument { get; set; }
    }
}
