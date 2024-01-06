using Eltizam.Resource.Resources;
using Microsoft.AspNetCore.Http;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Eltizam.Business.Models
{
    public class MasterUserModel : GlobalAuditFields
    {
        public int Id { get; set; }
        public string? UserName { get; set; }
        [StringLength(250, MinimumLength = 1)]
        [RegularExpression(@"^[a-zA-Z][\sa-zA-Z]*",
         ErrorMessage = "Only alphabetical characters are allowed.")]
        [Required(ErrorMessageResourceType = typeof(Validation), ErrorMessageResourceName = "Required")]
        public string? FirstName { get; set; }
        [StringLength(250, MinimumLength = 1)]
        [RegularExpression(@"^[a-zA-Z][\sa-zA-Z]*",
         ErrorMessage = "Only alphabetical characters are allowed.")]
        public string? MiddleName { get; set; }
        [StringLength(250, MinimumLength = 1)]
        [RegularExpression(@"^[a-zA-Z][\sa-zA-Z]*",
         ErrorMessage = "Only alphabetical characters are allowed.")]
        [Required(ErrorMessageResourceType = typeof(Validation), ErrorMessageResourceName = "Required")]
        public string? LastName { get; set; }        
        public string? Gender { get; set; }
        [Required(ErrorMessageResourceType = typeof(Validation), ErrorMessageResourceName = "Required")]
        [Range(1, int.MaxValue, ErrorMessage = "The 'Gender' field is required.")]
        public int? GenderId { get; set; }
        public IFormFile? File { get; set; }

        [Required(ErrorMessageResourceType = typeof(Validation), ErrorMessageResourceName = "Required")]
        [DisplayFormat(DataFormatString = "{0:dd-MM-yyyy}", ApplyFormatInEditMode = true)]
        public DateTime DateOfBirth { get; set; }
        public int DesignationId { get; set; }
        public int DepartmentId { get; set; }

        [StringLength(50, MinimumLength = 8)]
        public string? LicenseNo { get; set; }

        [StringLength(250, MinimumLength = 1)]
        [RegularExpression(@"^[a-zA-Z][\sa-zA-Z]*",
         ErrorMessage = "Enter upper case, lower case & special character only")]
        [Required(ErrorMessageResourceType = typeof(Validation), ErrorMessageResourceName = "Required")]
        public string? CompanyName { get; set; }

        public int CompanyId { get; set; }

        [Required(ErrorMessageResourceType = typeof(Validation), ErrorMessageResourceName = "Required")]
        [Range(1, int.MaxValue, ErrorMessage = "The 'Resource' field is required.")]
        public int ResourceId { get; set; }

        [Required(ErrorMessageResourceType = typeof(Validation), ErrorMessageResourceName = "Required")]
        [Range(1, int.MaxValue, ErrorMessage = "The 'Role' field is required.")]
        public int RoleId { get; set; }        
        public int ApproverLevelId { get; set; }
        public bool IsActive { get; set; }
        public bool? IsDeleted { get; set; }

        [Display(Name = "Password")]
        [RegularExpression(@"^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,16}$",
         ErrorMessage = "Password should be atleast 8 and maximum 16 characters with one number, upper case, lower case & special character e.g. @$!5%B*gr&")]
        [DataType(DataType.Password)]
        public string? Password { get; set; }

        [NotMapped]
        [CompareAttribute("Password", ErrorMessage = "Password and Confirm Password doesn't match.")]
        [DataType(DataType.Password)]
        public string? ConfirmPassowrd { get; set; }

        [Required(ErrorMessageResourceType = typeof(Validation), ErrorMessageResourceName = "Required")]
        [DataType(DataType.EmailAddress)]
        [MaxLength(50)]
        [RegularExpression(@"[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}", ErrorMessage = "Please enter correct email")]
        public string? Email { get; set; }
        public int ProfileAttachmentId { get; set; }
        public string? ProfilePath { get; set; }

        //public int CreatedBy { get; set; }
        public MasterDocumentModel? uploadProfile { get; set; }
        public MasterUserAddressModel? Address { get; set; } = null;
        public List<MasterUserAddressModel> Addresses { get; set; } = null;
        public Master_QualificationModel? Qualification { get; set; } = null;
        public List<Master_QualificationModel> Qualifications { get; set; } = null;
        public List<MasterDocumentModel>? Documents { get; set; }
        public List<MasterDocumentModel>? uploadDocument { get; set; }
        public DocumentFilesModel? Document { get; set; }
    }

}
