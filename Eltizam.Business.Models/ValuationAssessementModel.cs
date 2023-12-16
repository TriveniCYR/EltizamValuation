using Eltizam.Resource.Resources;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Eltizam.Business.Models
{
    public class ValuationAssessementModel
    {
        public int Id { get; set; }
        public int? RequestId { get; set; }
        [Required(ErrorMessageResourceType = typeof(Validation), ErrorMessageResourceName = "Required")]
        
        public decimal? MarketValue { get; set; }
        [Required(ErrorMessageResourceType = typeof(Validation), ErrorMessageResourceName = "Required")]
      
        
        public decimal? MarketRate { get; set; }
        [Required(ErrorMessageResourceType = typeof(Validation), ErrorMessageResourceName = "Required")]
        
        public int? LifeOfBuilding { get; set; }
        [Required(ErrorMessageResourceType = typeof(Validation), ErrorMessageResourceName = "Required")]
       
        
        public decimal? AnnualMaintainceCost { get; set; }
        [Required(ErrorMessageResourceType = typeof(Validation), ErrorMessageResourceName = "Required")]
        public bool Insuarance { get; set; }
        public string? InsuranceDetails { get; set; }

        public int CreatedBy { get; set; }
        public int? ModifiedBy { get; set; }
        public DateTime? CreatedDate { get; set; }
        public DateTime? ModifiedDate { get; set; }
        public bool IsActive { get; set; }
        public bool? IsDeleted { get; set; }
        public List<MasterDocumentModel>? Documents { get; set; }
        public DocumentFilesModel? Document { get; set; }
        public List<MasterDocumentModel>? uploadDocument { get; set; }
    }
}

