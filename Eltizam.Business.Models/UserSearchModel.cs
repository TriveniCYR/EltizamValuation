using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Eltizam.Business.Models
{
    public class UserSearchModel
    {
        public string? UserName { get; set; }
        public int DepartmentId { get; set; }
        public int DesignationId { get; set; }
        public int RoleId { get; set; }
        public int ResourceId { get; set; }
    }
}
