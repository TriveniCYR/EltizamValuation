using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Eltizam.Business.Models
{
    public class ValutionRequestListModel
    {
        public int Id { get; set; }
       
        public string? ClientName { get; set; }
        public string? ClientType { get; set; }

        public string? Location { get; set; }

        public string? PropertyName { get; set; }

        public DateTime? ValuationDate { get; set; }
        public string? ValuationPurpose { get; set; }

        
    }
}
