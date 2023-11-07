using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Eltizam.Business.Models
{
    public class AuditLogModel
    {
        public int Id { get; set; }
        public int? TableKeyId { get; set; }
        public string TableName { get; set; }
        public int? ParentTableKeyId { get; set; }
        public string? ParentTableName { get; set; }
        public string ActionType { get; set; }
        public string? Log { get; set; }
        public int? CreatedBy { get; set; }
        public DateTime? CreatedDate { get; set; }

        public string? UserName { get; set; }
        
        public string? FromDate { get; set; }
        public string? ToDate { get; set; }
    }
    public class AuditLogModelResponse : AuditLogModel
    { 
        public string? CreatedByName { get; set; }
        public List<AuditLogs>? AuditLogListData { get; set; }
    }

    public class AuditLogs
    {
        public string? PropertyName { get; set; }
        public string? OldValue { get; set; }
        public string? NewValue { get; set; }
        public string? DisplayName { get; set; }
    }

    public class MasterAuditLogWrapperEntity<TLog>
    {
        public int Id { get; set; }
        public int? TableKeyId { get; set; }
        public string TableName { get; set; }
        public string ActionType { get; set; }
        public IEnumerable<TLog> Log { get; set; }
        public int? CreatedBy { get; set; }
        public DateTime? CreatedDate { get; set; }
    }
}
