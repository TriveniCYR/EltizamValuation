﻿using System;
using System.Collections.Generic;

namespace Eltizam.Data.DataAccess.Entity
{
    public partial class MasterDictionary
    {
        public MasterDictionary()
        {
            MasterDictionaryDetails = new HashSet<MasterDictionaryDetail>();
        }

        public int Id { get; set; }
        public string Description { get; set; } = null!;
        public int? Sort { get; set; }
        public int? IsActive { get; set; }
        public int? CreatedBy { get; set; }
        public DateTime? CreatedDate { get; set; }
        public DateTime? ModifiedDate { get; set; }
        public int? ModifiedBy { get; set; }

        public virtual ICollection<MasterDictionaryDetail> MasterDictionaryDetails { get; set; }
    }
}
