using System;
using System.Collections.Generic;

namespace EltizamValuation.Api.Entity
{
    public partial class MasterUserContact
    {
        public int Id { get; set; }
        public int? UserId { get; set; }
        public string? Email { get; set; }
        public string? Mobile { get; set; }
        public int? Status { get; set; }
        public DateTime? CreatedDate { get; set; }
        public int? CreatedBy { get; set; }
        public DateTime? ModifiedDate { get; set; }
        public int? ModifiedBy { get; set; }

        public virtual MasterUser? User { get; set; }
    }
}
