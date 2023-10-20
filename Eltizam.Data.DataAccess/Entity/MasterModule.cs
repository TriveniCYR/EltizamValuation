using System;
using System.Collections.Generic;

namespace Eltizam.Data.DataAccess.Entity
{
    public partial class MasterModule
    {
        public int ModuleId { get; set; }
        public string? ModuleName { get; set; }
        public bool? IsActive { get; set; }
        public int? CreatedBy { get; set; }
        public DateTime? CreatedDate { get; set; }
        public int? ModifyBy { get; set; }
        public DateTime? ModifyDate { get; set; }
        public string? ControlName { get; set; }
        public int? SortOrder { get; set; }
        public string? Icon { get; set; }
        public string? ViewName { get; set; }
        public string? HoverIcon { get; set; }
    }
}
