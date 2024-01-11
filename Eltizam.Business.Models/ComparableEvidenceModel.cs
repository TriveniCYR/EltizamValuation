using Eltizam.Resource.Resources;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Eltizam.Business.Models
{
    public class ComparableEvidenceModel
    {
        public int Id { get; set; }
        public int? RequestId { get; set; }
        [StringLength(250, MinimumLength = 1)]
        public string? Type { get; set; }
       
        public int? Size { get; set; }
        [StringLength(250, MinimumLength = 1)]
        public string? Remarks { get; set; }
      
        [Required(ErrorMessageResourceType = typeof(Validation), ErrorMessageResourceName = "Required")]
        public decimal? RateSqFt { get; set; }
        
        [Required(ErrorMessageResourceType = typeof(Validation), ErrorMessageResourceName = "Required")]
       
        public decimal? Price { get; set; }
        [StringLength(250, MinimumLength = 1)]
        public string? AddtionalComments { get; set; }
        public int CreatedBy { get; set; }
        public int? ModifiedBy { get; set; }
        public DateTime? CreatedDate { get; set; }
        public DateTime? ModifiedDate { get; set; }
        public bool IsActive { get; set; }
        public bool IsDeleted { get; set; }
        public List<MasterDocumentModel>? Documents { get; set; }
        public DocumentFilesModel? Document { get; set; }
        public List<MasterDocumentModel>? uploadDocument { get; set; }
    }
}

