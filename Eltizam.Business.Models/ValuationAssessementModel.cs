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
         [Range(1, double.MaxValue)]
        public decimal? MarketValue { get; set; }
        [Required(ErrorMessageResourceType = typeof(Validation), ErrorMessageResourceName = "Required")]
        [StringLength(250, MinimumLength = 1)]
        [Range(1, double.MaxValue)]
        public decimal? MarketRate { get; set; }
        [Required(ErrorMessageResourceType = typeof(Validation), ErrorMessageResourceName = "Required")]
        [StringLength(10, MinimumLength = 1)]
        public int? LifeOfBuilding { get; set; }
        [Required(ErrorMessageResourceType = typeof(Validation), ErrorMessageResourceName = "Required")]
       
        [StringLength(250, MinimumLength = 1)]
        public int? AnnualMaintainceCost { get; set; }
        [Required(ErrorMessageResourceType = typeof(Validation), ErrorMessageResourceName = "Required")]
        public bool Insuarance { get; set; }
        public string? InsuranceDetails { get; set; }

        public int? CreatedBy { get; set; }
        public int? ModifiedBy { get; set; }
        public DateTime? CreatedDate { get; set; }
        public DateTime? ModifiedDate { get; set; }
        public bool IsActive { get; set; }
        public List<MasterDocumentModel>? Documents { get; set; }
        public DocumentFilesModel? Document { get; set; }
        public List<MasterDocumentModel>? uploadDocument { get; set; }
    }
}

