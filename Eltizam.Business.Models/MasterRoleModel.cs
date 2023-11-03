using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Eltizam.Business.Models
{
    public class MasterRoleModel
    {
        public int Id { get; set; }
        public string? RoleName { get; set; }
        public bool? IsActive { get; set; }
    }
}
