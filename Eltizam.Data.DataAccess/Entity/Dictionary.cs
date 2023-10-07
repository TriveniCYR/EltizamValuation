using System;
using System.Collections.Generic;

namespace Eltizam.Data.DataAccess.Entity
{
    public partial class Dictionary
    {
        public int Id { get; set; }
        public string Type { get; set; } = null!;
        public string Name { get; set; } = null!;
        public int? SortOrder { get; set; }
        public int? IsActive { get; set; }
        public DateTime? CreatedDate { get; set; }
        public int? CreatedBy { get; set; }
    }
}
