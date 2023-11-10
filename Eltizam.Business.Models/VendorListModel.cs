using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Eltizam.Business.Models
{
    public class VendorListModel
    {
        public int Id { get; set; }
        public string VendorName { get; set; } = null!;
        public string? CompanyName { get; set; }
        public DateTime? EstimattionDate { get; set; }
        public string? BusinessType { get; set; }
        public string? CompanyDescription { get; set; }
        public bool? Status { get; set; }
    }
}
