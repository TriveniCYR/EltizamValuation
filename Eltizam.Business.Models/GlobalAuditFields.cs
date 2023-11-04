using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Eltizam.Business.Models
{
    public class GlobalAuditFields
    { 
        public int? CreatedBy { get; set; } = 1; 
        public int? ModifiedBy { get; set; } = 1;
        public DateTime? CreatedDate { get; set; }
        public DateTime? ModifiedDate { get; set; }
    }
}
