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
    }

    public class DashboardPieChartModel
    {
        public double X { get; set; }
        public double Y { get; set; }
        public String Label { get; set; }

    }

    public class DashboardBarChartModel
    {
        public double X { get; set; }
        public double Y { get; set; }
        public String indexLabel { get; set; }

    }
}
