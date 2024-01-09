using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Eltizam.Business.Models
{
    public class DashboardChartModel
    {
        public List<DashboardPieChartModel> PieChartData { get; set; }
        public List<DashboardBarChartModel> BarChartData { get; set; }
        public List<ClientDetailsDashboardModel>? ClientDetailsDashboardData { get; set; }
        
    }

    public class DashboardPieChartModel
    {
        public double X { get; set; }
        public double Y { get; set; }
        public String PieLable { get; set; }

    }

    public class DashboardBarChartModel
    {
        public double X { get; set; }
        public double Y { get; set; }
        public String BarLable { get; set; }

    }

    public class ClientDetailsDashboardModel
    {
        public double Id { get; set; }
        public string ClientName { get; set; }
        public string ClientType { get; set; }
        public string TRNNumber { get; set; }
        public string TRNExpiryDate { get; set; }
        public string LicenseNumber { get; set; }
        public bool IsActive { get; set; }

    }
}
