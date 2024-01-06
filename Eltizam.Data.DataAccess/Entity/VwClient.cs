using System;
using System.Collections.Generic;

namespace Eltizam.Data.DataAccess.Entity
{
    public partial class VwClient
    {
        public int Id { get; set; }
        public string? FirstName { get; set; }
        public string? MiddleName { get; set; }
        public string? LastName { get; set; }
        public string? ClientName { get; set; }
        public int? ClientTypeId { get; set; }
        public string? Company { get; set; }
        public string? Trnnumber { get; set; }
        public DateTime? TrnexpiryDate { get; set; }
        public string? LicenseNumber { get; set; }
        public bool? IsActive { get; set; }
        public string? Logo { get; set; }
        public DateTime? CreatedDate { get; set; }
        public int? CreatedBy { get; set; }
        public DateTime? ModifiedDate { get; set; }
        public int? ModifiedBy { get; set; }
        public int? ProfileAttachmentId { get; set; }
        public bool? IsDeleted { get; set; }
        public string? ClientType { get; set; }
        public string? DictionaryCode { get; set; }
        public int? DictionaryId { get; set; }
        public string? Dictionary { get; set; }
    }
}
