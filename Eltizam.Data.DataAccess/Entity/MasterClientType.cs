﻿using System;
using System.Collections.Generic;

namespace Eltizam.Data.DataAccess.Entity
{
    public partial class MasterClientType
    {
        public MasterClientType()
        {
            MasterClients = new HashSet<MasterClient>();
            MasterValuationFees = new HashSet<MasterValuationFee>();
        }

        public int Id { get; set; }
        public string ClientType { get; set; } = null!;
        public bool IsActive { get; set; }
        public DateTime? CreatedDate { get; set; }
        public int? CreatedBy { get; set; }
        public DateTime? ModifiedDate { get; set; }
        public int? ModifiedBy { get; set; }

        public virtual ICollection<MasterClient> MasterClients { get; set; }
        public virtual ICollection<MasterValuationFee> MasterValuationFees { get; set; }
    }
}
