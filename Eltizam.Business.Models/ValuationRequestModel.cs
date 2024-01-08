﻿using Eltizam.Resource.Resources;
using System.ComponentModel.DataAnnotations;

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
        public int? UnitTypeId { get; set; }
        public string? AdditionalUnits { get; set; }
        public int? FurnishedId { get; set; }
        public string? ValuationPurpose { get; set; }
        public decimal? BuildUpAreaSqFt { get; set; }
        public decimal? BuildUpAreaSqMtr { get; set; }
        public int? AgeOfConstruction { get; set; }
        public string? Parking { get; set; }
        public string? ParkingBayNo { get; set; }
        public string? Description { get; set; }
        public string? UnitNumber { get; set; }
        public string? PinCode { get; set; }
        public string? PropertyType { get; set; }
        [Required(ErrorMessageResourceType = typeof(Validation), ErrorMessageResourceName = "Required")]
        [Range(1, int.MaxValue, ErrorMessage = "The 'Status' field is required.")]
        public int StatusId { get; set; }
        public int? ApproverId { get; set; }
        public string? ApproverName { get; set; }
        public string? ValuerName { get; set; }
        public string? ValuationRequestStatus { get; set; }
        public string? ReviewComment { get; set; }

        public string? MethodofValuation { get; set; }

        

        [StringLength(250, MinimumLength = 0)]
        public string? ApproverComment { get; set; }
        public DateTime? ApproverUpdateDate { get; set; }  
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
        public bool? IsDeleted { get; set; }   
        public string? ValuationApprovalValues { get; set; }
        public string? StatusName { get; set; }
        public string? ColorCode { get; set; }
        public string? BackGroundColor { get; set; }


        public List<MasterAmenityListModel>? AmenityList { get; set; }
        public MasterPropertyDetailModel? PropertyDetail { get; set; } 
        public ValuationAssesmentActionModel? ValuationAssesment { get; set; }
        public List<ValuationRequestApproverLevelModel>? ValuationRequestApproverLevel { get; set; } 
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

    public class ValuationRequestFilters
    { 
        public string? userName { get; set; }
        public string? clientName { get; set; }
        public string? propertyName { get; set; }
        public int? requestStatusId { get; set; } 
        public int? resourceId { get; set; }
        public int? propertyTypeId { get; set; }
        public int? countryId { get; set; }
        public int? stateId { get; set; } 
        public int? cityId { get; set; }
        public string? fromDate { get; set; }
        public string? toDate { get; set; }
        public string? valRef { get; set; }
        public int? logInUserId { get; set; }
    }
}
