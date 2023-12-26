using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Eltizam.Business.Models
{
    public class ValuationRequestApproverLevelModel
    {
        public int ApproverLevelId { get; set; }
        public string ApproverLevel { get; set; }

        public int ApproverId { get; set; }

        public string ApproverName { get; set; }

    }
}
