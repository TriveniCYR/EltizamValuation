using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Eltizam.Business.Models
{
    public class ValutionRequestStatusChangeModel : GlobalAuditFields
    {
        public int Id { get; set; }
        public int StatusId { get; set; }  
        public string? ApproverComment { get; set; }
        public string? Comment { get; set; }
    }
}
