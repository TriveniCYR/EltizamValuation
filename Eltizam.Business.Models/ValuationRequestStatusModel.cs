using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Eltizam.Business.Models
{
    public class ValuationRequestStatusModel
    {
        public int Id { get; set; }
        public string StatusName { get; set; } = null!;
        public bool? IsActive { get; set; }
        public int CreatedBy { get; set; }
        public DateTime CreatedDate { get; set; }
        public int? ModifyBy { get; set; }
        public DateTime? ModifyDate { get; set; }
        public string? ColorCode { get; set; }
    }
}
