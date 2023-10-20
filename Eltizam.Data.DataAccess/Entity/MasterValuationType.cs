﻿using System;
using System.Collections.Generic;

namespace Eltizam.Data.DataAccess.Entity
{
    public partial class MasterValuationType
    {
        public MasterValuationType()
        {
            MasterValuationFees = new HashSet<Master_ValuationFees>();
        }

        public int Id { get; set; }
        public string ValuationType { get; set; } = null!;
        public int IsActive { get; set; }
        public DateTime? CreatedDate { get; set; }
        public int? CreatedBy { get; set; }
        public DateTime? ModifiedDate { get; set; }
        public int? ModifiedBy { get; set; }

        public virtual ICollection<Master_ValuationFees> MasterValuationFees { get; set; }
    }
}
