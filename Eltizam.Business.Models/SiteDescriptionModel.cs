using Eltizam.Resource.Resources;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Eltizam.Business.Models
{
    public class SiteDescriptionModel
    {
        public int Id { get; set; }
        public int ValuationRequestId { get; set; }
        [StringLength(250, MinimumLength = 1)]
        [Required(ErrorMessageResourceType = typeof(Validation), ErrorMessageResourceName = "Required")]
        public string? Location { get; set; }
        [Required(ErrorMessageResourceType = typeof(Validation), ErrorMessageResourceName = "Required")]
        
        public decimal? InternalArea { get; set; }
        [Required(ErrorMessageResourceType = typeof(Validation), ErrorMessageResourceName = "Required")]
       
        public decimal? ExternalArea { get; set; }
        [Required(ErrorMessageResourceType = typeof(Validation), ErrorMessageResourceName = "Required")]
        
        public int? Floor { get; set; }
        
        [Required(ErrorMessageResourceType = typeof(Validation), ErrorMessageResourceName = "Required")]
        public int? Room { get; set; }
        
        public int? Bedrooms { get; set; }
        [StringLength(250, MinimumLength = 1)]
        public string? Storage { get; set; }
       
        public int? Quantity { get; set; }
        [StringLength(250, MinimumLength = 1)]
        public string? AdditionComment { get; set; }
        [StringLength(250, MinimumLength = 1)]
        [Required(ErrorMessageResourceType = typeof(Validation), ErrorMessageResourceName = "Required")]
        public string? PropertyCondition { get; set; }
        public string? AdditionalNotes { get; set; }
        [StringLength(250, MinimumLength = 1)]
        public string? Others { get; set; }
        public int? ModifiedBy { get; set; }
        public int? CreatedBy { get; set; }
        public List<MasterDocumentModel>? Documents { get; set; }
        public DocumentFilesModel? Document { get; set; }
        public List<MasterDocumentModel>? uploadDocument { get; set; }
    }
}
