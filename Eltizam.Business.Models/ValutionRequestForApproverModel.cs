using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Eltizam.Business.Models
{
    public class ValutionRequestForApproverModel : GlobalAuditFields
    {
        public int Id { get; set; }
        public int StatusId { get; set; }
        public int CreatedBy { get; set; }
        public string ApproverComment { get; set; } 
    }
}
