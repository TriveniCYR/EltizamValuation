using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Eltizam.Business.Models
{
    public class Master_PropertySubTypeModel: GlobalAuditFields
    {
        public int Id { get; set; }

        [StringLength(250, MinimumLength = 1)]
        public string PropertySubType { get; set; }
        public bool? IsActive { get; set; }
        public DateTime? CreatedDate { get; set; }
        public DateTime? ModifiedDate { get; set; }
        public int PropertyTypeId { get; set; }
    }
}
