using System;
using System.Collections.Generic;

#nullable disable

namespace Eltizam.Data.DataAccess.Entity
{
    public partial class MasterBusinessUnit
    {
        public MasterBusinessUnit()
        {
            MasterBusinessUnitRegionMappings = new HashSet<MasterBusinessUnitRegionMapping>();
            MasterDepartmentBusinessUnitMappings = new HashSet<MasterDepartmentBusinessUnitMapping>();
           
        }

        public int BusinessUnitId { get; set; }
        public string BusinessUnitName { get; set; }
        public bool IsActive { get; set; }
        public int? CreatedBy { get; set; }
        public DateTime CreatedDate { get; set; }
        public int? ModifyBy { get; set; }
        public DateTime? ModifyDate { get; set; }
        public float? Latitude { get; set; }
        public float? Longitude { get; set; }
        public bool? IsDomestic { get; set; }

        public virtual ICollection<MasterBusinessUnitRegionMapping> MasterBusinessUnitRegionMappings { get; set; }
        public virtual ICollection<MasterDepartmentBusinessUnitMapping> MasterDepartmentBusinessUnitMappings { get; set; }
       
    }
}
