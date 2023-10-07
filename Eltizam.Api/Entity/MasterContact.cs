using System;
using System.Collections.Generic;

namespace EltizamValuation.Api.Entity
{
    public partial class MasterContact
    {
        public int Id { get; set; }
        public int? TableKeyId { get; set; }
        public string? TableName { get; set; }
        public string? ContactPersonName { get; set; }
        public string? Department { get; set; }
        public string? Designation { get; set; }
        public string? Email { get; set; }
        public string? Mobile { get; set; }
        public int? Status { get; set; }
        public DateTime? CreatedDate { get; set; }
        public int? CreatedBy { get; set; }
        public DateTime? ModifiedDate { get; set; }
        public int? ModifiedBy { get; set; }
    }
}
