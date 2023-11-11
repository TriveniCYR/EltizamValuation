using System;
using System.Collections.Generic;

namespace Eltizam.Data.DataAccess.Entity
{
    public partial class MasterContact
    {
        public int Id { get; set; }
        public int? TableKeyId { get; set; }
        public string? TableName { get; set; }
        public string? ContactPersonName { get; set; }
        public int? DepartmentId { get; set; }
        public int? DesignationId { get; set; }
        public string? Email { get; set; }
        public string? Mobile { get; set; }
        public int? Status { get; set; }
        public DateTime? CreatedDate { get; set; }
        public int? CreatedBy { get; set; }
        public DateTime? ModifiedDate { get; set; }
        public int? ModifiedBy { get; set; }
        public int? MobileExt { get; set; }
    }
}
