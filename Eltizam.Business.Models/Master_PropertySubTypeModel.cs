using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Eltizam.Business.Models
{
    public class Master_PropertySubTypeModel
    {
        public int Id { get; set; }
        //public string PropertySubType { get; set; }
        public List<string> PropertySubType { get; set; } = new List<string>();
        public int IsActive { get; set; }
        public DateTime CreatedDate { get; set; }
        public int CreatedBy { get; set; }
        public DateTime ModifiedDate { get; set; }
        public int ModifiedBy { get; set; }
        public int PropertyTypeId { get; set; }
    }
}
