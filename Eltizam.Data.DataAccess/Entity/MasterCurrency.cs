using System;
using System.Collections.Generic;

#nullable disable

namespace Eltizam.Data.DataAccess.Entity
{
    public partial class MasterCurrency
    {
        public MasterCurrency()
        {
            MasterCurrencyCountryMappings = new HashSet<MasterCurrencyCountryMapping>();
            
        }

        public int CurrencyId { get; set; }
        public string CurrencyName { get; set; }
        public string CurrencyCode { get; set; }
        public string CurrencySymbol { get; set; }
        public bool IsActive { get; set; }
        public int? CreatedBy { get; set; }
        public DateTime CreatedDate { get; set; }
        public int? ModifyBy { get; set; }
        public DateTime? ModifyDate { get; set; }

        public virtual ICollection<MasterCurrencyCountryMapping> MasterCurrencyCountryMappings { get; set; }
        
    }
}
