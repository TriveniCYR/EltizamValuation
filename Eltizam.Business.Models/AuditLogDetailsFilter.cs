using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Eltizam.Business.Models
{
    public class AuditLogDetailsFilter
    {
        public string TableName { get; set; }
        public int? Id { get; set; }
        public int? TableKey { get; set; }
        public DateTime? DateFrom { get; set; }
        public DateTime? DateTo { get; set; }
       
    }
}
