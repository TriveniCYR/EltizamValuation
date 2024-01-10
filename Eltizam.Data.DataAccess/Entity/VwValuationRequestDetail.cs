using System;
using System.Collections.Generic;

namespace Eltizam.Data.DataAccess.Entity
{
    public partial class VwValuationRequestDetail
    {
        public int Id { get; set; }
        public string ReferenceNo { get; set; } = null!;
        public string? OtherReferenceNo { get; set; }
        public int ValuationModeId { get; set; }
        public DateTime? ValuationDate { get; set; }
        public int? ValuationTimeFrame { get; set; }
        public int ClientId { get; set; }
        public int PropertyId { get; set; }
        public int StatusId { get; set; }
        public int? ApproverId { get; set; }
        public string? ApproverComment { get; set; }
        public DateTime? ApproverUpdateDate { get; set; }
        public int CreatedBy { get; set; }
        public DateTime CreatedDate { get; set; }
        public int? ModifiedBy { get; set; }
        public DateTime? ModifiedDate { get; set; }
        public int? ValuerId { get; set; }
        public string? ValuerComment { get; set; }
        public DateTime? ValuerUpdateDate { get; set; }
        public string? AssignRemark { get; set; }
        public bool? IsDeleted { get; set; }
        public string? StatusComment { get; set; }
        public string? StatusName { get; set; }
        public string? StatusCode { get; set; }
        public int? Type { get; set; }
        public int? Group { get; set; }
        public string? ColorCode { get; set; }
        public string? BackGroundColor { get; set; }
        public string? ClientType { get; set; }
        public string? ClientName { get; set; }
        public string? PropertyType { get; set; }
        public string? PropertyName { get; set; }
        public string? ValuationPurpose { get; set; }
        public string? MethodOfValuation { get; set; }
        public string? Requestor { get; set; }
        public string? Valuer { get; set; }
        public string? Approver { get; set; }
        public int? PropertyTypeId { get; set; }
        public string? PropertySubType { get; set; }
        public int? PropertySubTypeId { get; set; }
    }
}
