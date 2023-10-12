using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Eltizam.Business.Models
{
    public class Master_ClientTypeModel
    {
        public int Id { get; set; }
        public string ClientType { get; set; }
        public bool IsActive { get; set; }
        public int CreatedBy { get; set; }


    }
}
