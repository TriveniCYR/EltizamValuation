using Eltizam.Resource.Resources;
using System.ComponentModel.DataAnnotations;

namespace Eltizam.Business.Models
{
    public class ValuationQuatationListModel : ValuationRequestHeader
    {
        public int Id { get; set; }  
        [Required(ErrorMessageResourceType = typeof(Validation), ErrorMessageResourceName = "Required")]
        public decimal? ValuationFee { get; set; }
        [Required(ErrorMessageResourceType = typeof(Validation), ErrorMessageResourceName = "Required")]
        public decimal? Vat { get; set; }
        [Required(ErrorMessageResourceType = typeof(Validation), ErrorMessageResourceName = "Required")]
        public decimal? OtherCharges { get; set; }
        public decimal? InstructorCharges { get; set; }
        public decimal? Discount { get; set; }
        [Required(ErrorMessageResourceType = typeof(Validation), ErrorMessageResourceName = "Required")]
        public decimal? TotalFee { get; set; }
        public string? Note { get; set; }
        public int? CreatedBy { get; set; }
        public int? ModifiedBy { get; set; }
        public DateTime CreatedDate { get; set; }
        public string ? UserName { get; set; }
        public string? RequestStatus { get; set; }
        public List<MasterDocumentModel>? Documents { get; set; }
        public List<MasterDocumentModel>? uploadDocument { get; set; }
        public DocumentFilesModel? Document { get; set; }
        public string? ApproverIds { get; set; }
        public int? ApproverId2 { get; set; }
        public int? ApproverId3 { get; set; }
        public int? ApproverId4 { get; set; }
        public int? ApproverId5 { get; set; }
    }

    public class ValuationRequestHeader
    {
        public string ReferenceNo { get; set; } = null!;
        public int ValuationRequestId { get; set; }
        public int StatusId { get; set; }
        public string? StatusName { get; set; }
        public string? ColorCode { get; set; }
        public string? BackGroundColor { get; set; }
        public string? PropertyName { get; set; }
        public string? ClientName { get; set; } 
    }
}
