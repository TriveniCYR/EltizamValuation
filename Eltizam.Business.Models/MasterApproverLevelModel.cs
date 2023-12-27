using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Eltizam.Business.Models
{
    public class MasterApproverLevelModel
    {
        public int Id { get; set; }
        public string Description { get; set; }
        public decimal FromAmount { get; set; }
        public decimal ToAmount { get; set; }
        public int CreatedBy { get; set; }
        public DateTime CreatedDate { get; set; }
        public int ModifiedBy { get; set; }
        public DateTime ModifiedDate { get; set; }
        public bool IsDeleted { get; set; }=false;
        public bool IsActive { get; set; }
    }
}
