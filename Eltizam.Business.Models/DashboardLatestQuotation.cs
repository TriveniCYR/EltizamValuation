using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Eltizam.Business.Models
{
    public class DashboardLatestQuotation : CommonDashboardModel
    {
        public int QuotationId { get; set; }
        public string QuotationNum { get; set; }
        public decimal QuotationFee { get; set; }
    }
}
