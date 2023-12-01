using Eltizam.Resource.Resources;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Eltizam.Business.Models
{
    public class ValuationRequestModel: GlobalAuditFields
    {
        public int Id { get; set; }
        public string? ReferenceNo { get; set; } = null!;
        [StringLength(250, MinimumLength = 0)]
        public string? OtherReferenceNo { get; set; }
        public int ValuationModeId { get; set; }
        [DisplayFormat(DataFormatString = "{0:dd-MM-yyyy}", ApplyFormatInEditMode = true)]
        public DateTime ValuationDate { get; set; }
        [StringLength(250, MinimumLength = 0)]
        public int? ValuationTimeFrame { get; set; }
        public int ClientId { get; set; }
        [Required(ErrorMessageResourceType = typeof(Validation), ErrorMessageResourceName = "Required")]
        [Range(1, int.MaxValue, ErrorMessage = "The 'ClientType' field is required.")]
        public int ClientTypeId { get; set; }
        [Required(ErrorMessageResourceType = typeof(Validation), ErrorMessageResourceName = "Required")]
        [Range(1, int.MaxValue, ErrorMessage = "The 'Property' field is required.")]
        public int PropertyId { get; set; }
        [Required(ErrorMessageResourceType = typeof(Validation), ErrorMessageResourceName = "Required")]
        [Range(1, int.MaxValue, ErrorMessage = "The 'Property Type' field is required.")]
        public int PropertyTypeId { get; set; }
        [Required(ErrorMessageResourceType = typeof(Validation), ErrorMessageResourceName = "Required")]
        [Range(1, int.MaxValue, ErrorMessage = "The 'Property Sub Type' field is required.")]
        public int PropertySubTypeId { get; set; }
        public string? PropertySubType { get; set; }
        public int? OwnershipTypeId { get; set; }
        public string? PropertyName { get; set; }
        public string? OwnershipType { get; set; }
        public string? UnitType { get; set; }
        public string? AdditionalUnits { get; set; }
        public int Furnished { get; set; }
        public string? ValuationPurpose { get; set; }
         public decimal? BuildUpAreaSqFt { get; set; }
        public decimal? BuildUpAreaSqMtr { get; set; }
        public int? AgeOfConstruction { get; set; }
        public string? Parking { get; set; }
        public string? ParkingBayNo { get; set; }
        public string? Description { get; set; }
        public string? PinCode { get; set; }
        public string? PropertyType { get; set; }
        [Required(ErrorMessageResourceType = typeof(Validation), ErrorMessageResourceName = "Required")]
        [Range(1, int.MaxValue, ErrorMessage = "The 'Status' field is required.")]
        public int StatusId { get; set; }
        public int? ApproverId { get; set; }
        [StringLength(250, MinimumLength = 0)]
        public string? ApproverComment { get; set; }
        public DateTime? ApproverUpdateDate { get; set; }
        //public int? CreatedBy { get; set; }
        public DateTime CreatedDate { get; set; }
        //public int? ModifiedBy { get; set; }
        public DateTime? ModifiedDate { get; set; }
        public int? ValuerId { get; set; }
        public string? ValuerComment { get; set; }
        public DateTime? ValuerUpdateDate { get; set; }
        [DisplayFormat(DataFormatString = "{0:dd-MMM-yyyy}", ApplyFormatInEditMode = true)]
        public DateTime? TrnexpiryDate { get; set; }
        public string? ClientName { get; set; }
        public string? ClientType { get; set; }
        public int? CityId { get; set; }
        public int? StateId { get; set; }
        public int? CountryId { get; set; }
        public string? Trnnumber { get; set; }
        public string? LicenseNumber { get; set; }
        public int? LocationCountryId { get; set; }
        public int? LocationStateId { get; set; }
        public int? LocationCityId { get; set; }
       
        public List<MasterAmenityListModel>? AmenityList { get; set; }
        public MasterPropertyDetailModel? PropertyDetail { get; set; }

        public ValuationAssesmentActionModel? ValuationAssesment { get; set; }

        //public SiteDescriptionModel? SiteDescription { get; set; }

        //public ComparableEvidenceModel? ComparableEvidence { get; set; }

        //public ValuationAssessementModel? ValuationAssessement { get; set; }

        public DocumentFilesModel? Document { get; set; }

        public List<MasterDocumentModel>? Documents { get; set; }

        //public Master_ClientTypeModel? master_ClientType { get; set; }
        //public MasterPropertyModel? masterPropertyModel { get; set; }
        //public Master_PropertySubTypeModel? master_PropertySub { get; set; }
        //public MasterOwnershipTypeEntity? masterOwnershipTypeEntity { get; set; }
        //public Master_PropertyTypeModel? master_PropertyType { get; set; }

        //public virtual MasterUser? Approver { get; set; }
        //public virtual MasterClient Client { get; set; } = null!;
        //public virtual MasterProperty Property { get; set; } = null!;
        //public virtual ValuationRequestStatus Status { get; set; } = null!;
        //public virtual ICollection<ValuationInvoice> ValuationInvoices { get; set; }
        //public virtual ICollection<ValuationQuotation> ValuationQuotations { get; set; }
    }
}
