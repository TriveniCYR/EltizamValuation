using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Eltizam.Business.Models
{
    public class MasterDictionaryDetailById
    {
        //public int ChildId { get; set; }
        //public int Id { get; set; }
        //public int Type { get; set; }
        ////  public string Dictionary { get; set; }
        //public string Description { get; set; }
        //public string ChildDescription { get; set; }
        //public int? Sort { get; set; }
        //public int? IsActive { get; set; }
        //public int? CreatedBy { get; set; }
        //public DateTime? CreatedDate { get; set; }
        //public DateTime? ModifiedDate { get; set; }
        //public int? ModifiedBy { get; set; }
        public int Id { get; set; }
        [NotMapped]
        public int? Type { get; set; }
        public int? DictionaryId { get; set; }
        public int ChildId { get; set; }
        // public int Type { get; set; }
        public string? Description { get; set; }
        public string? ChildDescription { get; set; }
        public int? Sort { get; set; }
        public int? IsActive { get; set; }
        public int? CreatedBy { get; set; }
        public DateTime? CreatedDate { get; set; }
        public DateTime? ModifiedDate { get; set; }
        public int? ModifiedBy { get; set; }

    }
}
