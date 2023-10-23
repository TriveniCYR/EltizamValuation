using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Eltizam.Business.Models
{
    public class Master_PropertyTypeModel
    {
        public int Id { get; set; }
        public string PropertyType { get; set; }
        public int IsActive { get; set; }
        public DateTime? CreatedDate { get; set; }
        public int? CreatedBy { get; set; }
        public DateTime? ModifiedDate { get; set; }
        public int? ModifiedBy { get; set; }
        public string? SubTypes { get; set; }

        public List<Master_PropertySubTypeModel> MasterPropertySubTypes { get; }
    }

	
}
