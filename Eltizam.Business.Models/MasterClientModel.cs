using Eltizam.Resource.Resources;
using Microsoft.AspNetCore.Http;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Eltizam.Business.Models
{
    public class MasterClientModel : GlobalAuditFields
    {
        public int Id { get; set; }

        [Required(ErrorMessageResourceType = typeof(Validation), ErrorMessageResourceName = "Required")]
        [RegularExpression("^[a-zA-Z ]+$", ErrorMessage = "Only alphabetical characters are allowed.")]
        [StringLength(250, MinimumLength = 1)]
        public string? FirstName { get; set; }

        [RegularExpression("^[a-zA-Z ]+$", ErrorMessage = "Only alphabetical characters are allowed.")]
        [StringLength(250, MinimumLength = 1)]
        public string? MiddleName { get; set; }

        [Required(ErrorMessageResourceType = typeof(Validation), ErrorMessageResourceName = "Required")]
        [RegularExpression("^[a-zA-Z ]+$", ErrorMessage = "Only alphabetical characters are allowed.")]
        [StringLength(250, MinimumLength = 1)]
        public string? LastName { get; set; }

        [StringLength(250, MinimumLength = 1)]
        public string? ClientName { get; set; }

        [Required(ErrorMessageResourceType = typeof(Validation), ErrorMessageResourceName = "Required")]
        [Range(1, int.MaxValue, ErrorMessage = "The 'ClientType' field is required.")]
        public int ClientTypeId { get; set; }

        [Required(ErrorMessageResourceType = typeof(Validation), ErrorMessageResourceName = "Required")]
        [StringLength(250, MinimumLength = 1)]
        public string? LicenseNumber { get; set; }

        [Required(ErrorMessageResourceType = typeof(Validation), ErrorMessageResourceName = "Required")]
        [StringLength(250, MinimumLength = 1)]
        public string? Trnnumber { get; set; }

        [Required(ErrorMessageResourceType = typeof(Validation), ErrorMessageResourceName = "Required")]
        [DisplayFormat(DataFormatString = "{0:dd-MM-yyyy}", ApplyFormatInEditMode = true)]
        public DateTime TrnexpiryDate { get; set; }
        public int CreatedBy { get; set; }
        public bool IsActive { get; set; }
        public bool IsDeleted { get; set; }
        public string? Logo { get; set; }

        public int ProfileAttachmentId { get; set; }
        public string? ProfilePath { get; set; }

        public IFormFile? File { get; set; }

        public MasterAddressEntity? Address { get; set; }
        public List<MasterAddressEntity> Addresses { get; set; }
        public MasterContactModel? Contact { get; set; }
        public List<MasterContactModel> Contacts { get; set; }
        public List<MasterDocumentModel>? Documents { get; set; }
        public List<MasterDocumentModel>? uploadDocument { get; set; }
        public DocumentFilesModel? Document { get; set; }
        public MasterDocumentModel? uploadProfile { get; set; }
    }
}
