using System;
using System.Collections.Generic;

namespace Eltizam.Data.DataAccess.Entity
{
    public partial class MasterQualification
    {
        public int Id { get; set; }
        public int TableKeyId { get; set; }
        public string TableName { get; set; } = null!;
        public string Qualification { get; set; } = null!;
        public string? Subject { get; set; }
        public string? Institute { get; set; }
        public string? Grade { get; set; }
        public string? YearOfInstitute { get; set; }
        public int? IsActive { get; set; }
        public DateTime? CreatedDate { get; set; }
        public int? CreatedBy { get; set; }
        public DateTime? ModifiedDate { get; set; }
        public int? ModifiedBy { get; set; }
        public bool? IsDeleted { get; set; }
    }
}
