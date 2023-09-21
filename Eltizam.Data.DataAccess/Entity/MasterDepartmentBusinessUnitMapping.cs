﻿using System;
using System.Collections.Generic;

#nullable disable

namespace Eltizam.Data.DataAccess.Entity
{
    public partial class MasterDepartmentBusinessUnitMapping
    {
        public int DepartmentBusinessUnitMappingId { get; set; }
        public int DepartmentId { get; set; }
        public int BusinessUnitId { get; set; }
        public DateTime CreatedDate { get; set; }

        public virtual MasterBusinessUnit BusinessUnit { get; set; }
    }
}
