using System;
using System.Collections.Generic;

namespace Eltizam.Data.DataAccess.Entity
{
    public partial class MasterNotification
    {
        public long Id { get; set; }
        public long? ValuationRequestId { get; set; }
        public int? StatusId { get; set; }
        public string? Subject { get; set; }
        public string ToEmails { get; set; } = null!;
        public string? Body { get; set; }
        public DateTime? SentDatetime { get; set; }
        public bool IsEmailSent { get; set; }
        public int CreatedBy { get; set; }
        public DateTime CreatedDate { get; set; }
    }
}
