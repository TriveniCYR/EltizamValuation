using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Eltizam.Business.Models
{
    public class ValuationRequestModel
    {
        public int Id { get; set; }
        public string? ReferenceNo { get; set; } = null!;
        public string? OtherReferenceNo { get; set; }
        public int ValuationModeId { get; set; }
        public DateTime ValuationDate { get; set; }
        public int? ValuationTimeFrame { get; set; }
        public int ClientId { get; set; }
        public int ClientTypeId { get; set; }
        public int PropertyId { get; set; }
        public int PropertyTypeId { get; set; }
        public int PropertySubTypeId { get; set; }
        public int? OwnershipTypeId { get; set; }
        public string? PropertyName { get; set; }
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

        public int StatusId { get; set; }
        public int? ApproverId { get; set; }
        public string? ApproverComment { get; set; }
        public DateTime? ApproverUpdateDate { get; set; }
        public int CreatedBy { get; set; }
        public DateTime CreatedDate { get; set; }
        public int? ModifyBy { get; set; }
        public DateTime? ModifyDate { get; set; }
        public int? ValuerId { get; set; }
        public string? ValuerComment { get; set; }
        public DateTime? ValuerUpdateDate { get; set; }
        public DateTime? TrnexpiryDate { get; set; }
        public string? ClientName { get; set; }
        public int? CityId { get; set; }
        public int? StateId { get; set; }
        public int? CountryId { get; set; }
        public string? Trnnumber { get; set; }
        public string? LicenseNumber { get; set; }
        public List<MasterAmenityListModel>? AmenityList { get; set; }
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
