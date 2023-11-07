using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Eltizam.Business.Models
{
    public class ValuationQuatationListModel
    {
        public int Id { get; set; }
        public string ReferenceNo { get; set; } = null!;
        public int ValuationRequestId { get; set; }
        public int StatusId { get; set; }
        public decimal ValuationFee { get; set; }
        public decimal Vat { get; set; }
        public decimal? OtherCharges { get; set; }
        public decimal? InstructorCharges { get; set; }
        public decimal? Discount { get; set; }
        public decimal? TotalFee { get; set; }
        public string? Note { get; set; }
        public int CreatedBy { get; set; }
    }
}
