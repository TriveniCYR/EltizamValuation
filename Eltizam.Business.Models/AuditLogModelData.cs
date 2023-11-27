using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Eltizam.Business.Models
{
    public class AuditLogModelData
    {
        public int Id { get; set; }
        public int? TableKeyId { get; set; }
        public string? TableName { get; set; }
        public int? ParentTableKeyId { get; set; }
        public string ParentTableName { get; set; }
        public string ActionType { get; set; }
        public string? Log { get; set; }
        public int? CreatedBy { get; set; }
        [DisplayFormat(DataFormatString = "{0:dd-MM-yyyy}", ApplyFormatInEditMode = true)]
        public DateTime? CreatedDate { get; set; }

        public string? UserName { get; set; }

        public string? FromDate { get; set; }
        public string? ToDate { get; set; }
        public string? CreatedDateFormatted { get; set; }
        public string? CreatedByName { get; set; }
        public string? AuditLogListData { get; set; }
        public string? PropertyName { get; set; }
        public string? OldValue { get; set; }
        public string? NewValue { get; set; }
        public string? DisplayName { get; set; }
        public List<AuditLogs>? AuditLogDetailListData { get; set; }

    }
}
