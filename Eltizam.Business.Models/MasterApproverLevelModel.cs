using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Eltizam.Business.Models
{
    public class MasterApproverLevelModel : GlobalAuditFields
    {
        public int Id { get; set; }
        public string? Description { get; set; }
        public decimal FromAmount { get; set; }
        public decimal ToAmount { get; set; }
        public bool IsDeleted { get; set; }=false;
        public bool IsActive { get; set; }
        public List<MasterUserModel>? UsersList { get; set; }

    }
}
