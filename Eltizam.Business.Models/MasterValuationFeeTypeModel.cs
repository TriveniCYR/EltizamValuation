using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Eltizam.Business.Models
{
    public class MasterValuationFeeTypeModel
    {
        public int Id { get; set; }
        public string? ValuationFeeType { get; set; }
        public int? IsActive { get; set; }
        public int? CreatedBy { get; set; }
    }
}
