using Eltizam.Resource.Resources;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Eltizam.Business.Models
{
    public class MasterValuationRequestApproverLevelModel
    {
        public int Id { get; set; }
        public string Description { get; set; } = null!;
        public decimal FromAmount { get; set; }
        public decimal? ToAmount { get; set; }
    }
}
