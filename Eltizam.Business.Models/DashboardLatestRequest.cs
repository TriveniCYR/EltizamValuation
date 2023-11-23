using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Eltizam.Business.Models
{
    public class DashboardLatestRequest : CommonDashboardModel
    {
        public DateTime ValuationDate { get; set; }
        public string? Status { get; set; }
        public string? ColorCode { get; set; }
        public string? BackGroundColor { get; set; }
    }
}
