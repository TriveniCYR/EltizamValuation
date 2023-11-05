using System;
using System.Collections.Generic;

#nullable disable

namespace Eltizam.Data.DataAccess.Entity
{
    public partial class MasterAuditLog
    {
        public int Id { get; set; }
        public int? TableKeyId { get; set; }
        public string TableName { get; set; }
        public int? ParentTableKeyId { get; set; }
        public string? ParentTableName { get; set; }
        public string ActionType { get; set; }
        public string Log { get; set; }
        public int? CreatedBy { get; set; }
        public DateTime? CreatedDate { get; set; }
    }
}
