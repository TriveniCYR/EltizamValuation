using System;
using System.Collections.Generic;

namespace Eltizam.Data.DataAccess.Entity
{
    public partial class EmailLogHistory
    {
        public int Id { get; set; }
        public string FromAddress { get; set; } = null!;
        public string Subject { get; set; } = null!;
        public string ToAddress { get; set; } = null!;
        public string? Ccaddress { get; set; }
        public string? BccAddress { get; set; }
        public string Body { get; set; } = null!;
        public bool? IsSent { get; set; }
        public string? EmailResponse { get; set; }
        public int? CreatedBy { get; set; }
        public DateTime? CreatedDate { get; set; }
        public int? ModifiedBy { get; set; }
        public DateTime? ModifiedDate { get; set; }
    }
}
