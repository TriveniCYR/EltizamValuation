using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Eltizam.Business.Models
{
    public class AssignApprovorRequestModel : GlobalAuditFields
    {
        public string? RequestIds { get; set; }
        public int ApprovorId { get; set; }
        public string Remarks { get; set; } 
    }
}
