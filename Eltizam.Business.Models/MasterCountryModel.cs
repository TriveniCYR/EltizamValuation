using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Eltizam.Business.Models
{
    public class MasterCountryModel
    {
        public int Id { get; set; }
        public string CountryName { get; set; }
        public string CountryCode { get; set; }
        public string ISDCountryCode { get; set; }
        public int IsActive { get; set; }
        public int CreatedBy { get; set; }
    }
}
