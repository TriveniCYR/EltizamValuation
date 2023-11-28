using Eltizam.Resource.Resources;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Eltizam.Business.Models
{
    public class MasterDictionaryEntity : GlobalAuditFields
    {
        public int Id { get; set; }
        public int Type { get; set; }
        [Required(ErrorMessageResourceType = typeof(Validation), ErrorMessageResourceName = "Required")]
        [StringLength(250, MinimumLength = 1)]
        public string? Description { get; set; }
        public string? Values { get; set; }
        public bool IsActive { get; set; } 
        public List<MasterDictionaryDetailById> MasterDicitonaryDetails { get; set; }

    }
    public class MasterDictionaryList
    {
        public int draw { get; set; }
        public int recordsTotal { get; set; }
        public int recordsFiltered { get; set; }
        public List<MasterDictionaryEntity> data { get; set; }
    }
}
