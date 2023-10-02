using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Eltizam.Business.Models
{
    public class MasterUserContactModel
    {
        public int Id { get; set; }
        public int UserId { get; set; }
        public string Email { get; set; }
        public string ContactPersonName { get; set; }
        public string Department { get; set; }
        public string Designation { get; set; }
        public string Mobile { get; set; }
        public int Status { get; set; }
    }
}
