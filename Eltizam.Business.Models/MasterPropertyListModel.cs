using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Eltizam.Business.Models
{
    public class MasterPropertyListModel
    {
        public int Id { get; set; }
        public string PropertyName { get; set; }
        public string PropertyType { get; set; }
        public string PropertySubType { get; set; }
        public string OwnershipType { get; set; }
        public string Location { get; set; }
        public bool IsActive { get; set; }
    }
}
