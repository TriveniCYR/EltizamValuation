using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Eltizam.Business.Models
{
    public class ApprovorStatusRequestModel : GlobalAuditFields
    {
        public int ValuationRequestId { get; set; }
        public int ApprovorId { get; set; }
        public string ApprovorComment { get; set; }
        public int StatusId { get; set; }
    }
}
