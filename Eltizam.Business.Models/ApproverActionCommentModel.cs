using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Eltizam.Business.Models
{
    public class ApproverActionCommentModel 
    {
        public int RequestId { get; set; }
        public int CreatedBy { get; set; }
        public string? Comment { get; set; }
        public string? StatusCode { get; set; }
    }
}
