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
    public class MasterVendorModel : GlobalAuditFields
    {
        public int Id { get; set; }
        [RegularExpression("^[a-zA-Z ]+$", ErrorMessage = "Only alphabetical characters and spaces are allowed.")]
        [StringLength(250, MinimumLength = 1)]
        [Required(ErrorMessageResourceType = typeof(Validation), ErrorMessageResourceName = "Required")]
        public string VendorName { get; set; }
        [Required(ErrorMessageResourceType = typeof(Validation), ErrorMessageResourceName = "Required")]
        [StringLength(250, MinimumLength = 1)]
        public string? CompanyName { get; set; }
        [Required(ErrorMessageResourceType = typeof(Validation), ErrorMessageResourceName = "Required")]
        [DisplayFormat(DataFormatString = "{0:dd-MM-yyyy}", ApplyFormatInEditMode = true)]
        public DateTime? EstimattionDate { get; set; }
        [Required(ErrorMessageResourceType = typeof(Validation), ErrorMessageResourceName = "Required")]
        [StringLength(250, MinimumLength = 1)]
        public string? BusinessType { get; set; }
        [StringLength(250, MinimumLength = 1)]
        public string? CompanyDescription { get; set; }
        public bool Status { get; set; }

        public int ProfileAttachmentId { get; set; }
        public string? ProfilePath { get; set; }

        public IFormFile? File { get; set; }
        public MasterAddressEntity? Address { get; set; }
        public MasterContactModel? Contact { get; set; }

        public List<MasterDocumentModel>? Documents { get; set; }
        public List<MasterDocumentModel>? uploadDocument { get; set; }
        public DocumentFilesModel? Document { get; set; }

        public MasterDocumentModel? uploadProfile { get; set; }
    }
}
