using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Eltizam.Business.Models
{
    public class DashboardDataModel
    {
        //public int TotalClients { get; set; }
        //public int TotalProjects { get; set; }
        //public decimal TotalRevenue { get; set; }
        //public decimal TotalDue { get; set; }
        //public int CompletedPerc { get; set; }
        //public int PendingPerc { get; set; }

        public List<DashboardLatestRequest> LatestRequests { get; set; }
        public DashboardWidgetsRequest DashboardWidgets { get; set; }
        public List<DashboardLatestQuotation> LatestQuotations { get; set; }
        public List<TopValuationModel> TopValuations { get; set; }
        public List<TopQuotationDueModel> TopQuotationDues { get; set; }
    }

    public class DashboardWidgetsRequest : CommonDashboardModel
    {
        public int TotalClients { get; set; }
        public int TotalProjects { get; set; }
        public int AssignedProjects { get; set; }
        public decimal TotalRevenue { get; set; }
        public decimal TotalDue { get; set; }
        public decimal CompletedPerc { get; set; }
        public decimal PendingPerc { get; set; } 
    }
}
