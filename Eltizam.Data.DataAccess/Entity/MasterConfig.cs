using System;
using System.Collections.Generic;

namespace Eltizam.Data.DataAccess.Entity
{
    public partial class MasterConfig
    {
        public int Id { get; set; }
        public int? PageNumer { get; set; }
        public int? PageSize { get; set; }
        public int? OrderBy { get; set; }
        public int? ReverseOrder { get; set; }
        public DateTime? CreatedDate { get; set; }
        public int? CreatedBy { get; set; }
        public DateTime? ModifiedDate { get; set; }
        public int? ModifiedBy { get; set; }
    }
}
