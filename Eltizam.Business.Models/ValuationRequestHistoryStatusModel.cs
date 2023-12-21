using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Eltizam.Business.Models
{
    public class ValuationRequestHistoryStatusModel
    {
        public string ReferenceNO { get; set; }
        public int StatusId { get; set; }
        public string StatusCode { get; set; }
        public string Status { get; set; }
        public string ColorCode { get; set; }
        public string BackGroundColor { get; set; }
        public DateTime CreatedDate { get; set; }
        public int CreatedBy { get; set; }
        public string CreatedByName { get; set; }

    }
}
