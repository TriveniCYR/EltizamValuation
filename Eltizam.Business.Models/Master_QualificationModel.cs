using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Eltizam.Business.Models
{
    public class Master_QualificationModel
    {
        public int Id { get; set; }
        public int UserId { get; set; }
        public string? Qualification { get; set; }
        public string? Subject { get; set; }
        public string? Institute { get; set; }
        public string? Grade { get; set; }
        public string? YearOfInstitute { get; set; }
        public int IsActive { get; set; }
        public DateTime CreatedDate { get; set; }
        public int CreatedBy { get; set; }
        public DateTime ModifiedDate { get; set; }
        public int ModifiedBy { get; set; }
    }
}
