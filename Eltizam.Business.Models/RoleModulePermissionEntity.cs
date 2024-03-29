﻿using System;

namespace Eltizam.Business.Models
{
    public class RoleModulePermissionEntity
    {
        public int RoleModuleId { get; set; }
        public int RoleId { get; set; }
        public int ModuleId { get; set; }
        public int SubModuleId { get; set; }
        public int SortOrder { get; set; }

        public bool View { get; set; }
        public bool Add { get; set; }
        public bool Edit { get; set; }
        public bool Delete { get; set; }
        public bool Approve { get; set; }
        public DateTime CreatedDate { get; set; }
    }
}
