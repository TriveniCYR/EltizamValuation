using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Eltizam.Business.Models
{
    public class MasterAmenityListModel
    {
        public int Id { get; set; }
        public int PropertyId { get; set; }
        public int AmenityId { get; set; }
        public string? AmenityName { get; set; }
        public string? Icon { get; set; }
        public bool IsActive { get; set; }
    }
}
