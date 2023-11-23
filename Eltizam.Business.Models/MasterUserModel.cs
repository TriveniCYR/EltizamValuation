﻿using Eltizam.Resource.Resources;
using Microsoft.AspNetCore.Http;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Eltizam.Business.Models
{
    public class MasterUserModel : GlobalAuditFields
    {
        public int Id { get; set; }
        public string? UserName { get; set; }
        [RegularExpression(@"^[a-zA-Z][\sa-zA-Z]*",
         ErrorMessage = "Enter upper case, lower case & special character only")]
        [Required(ErrorMessageResourceType = typeof(Validation), ErrorMessageResourceName = "Required")]
        public string? FirstName { get; set; }
        [RegularExpression(@"^[a-zA-Z][\sa-zA-Z]*",
         ErrorMessage = "Enter upper case, lower case & special character only")]
        public string? MiddleName { get; set; }
        [RegularExpression(@"^[a-zA-Z][\sa-zA-Z]*",
         ErrorMessage = "Enter upper case, lower case & special character only")]
        [Required(ErrorMessageResourceType = typeof(Validation), ErrorMessageResourceName = "Required")]
        public string? LastName { get; set; }
        [Required(ErrorMessageResourceType = typeof(Validation), ErrorMessageResourceName = "Required")]
        public string? Gender { get; set; }
        public IFormFile? File { get; set; }

        [Required(ErrorMessageResourceType = typeof(Validation), ErrorMessageResourceName = "Required")]
        [DisplayFormat(DataFormatString = "{0:dd-MM-yyyy}", ApplyFormatInEditMode = true)]
        public DateTime DateOfBirth { get; set; }

        [Required(ErrorMessageResourceType = typeof(Validation), ErrorMessageResourceName = "Required")]
        [Range(1, int.MaxValue, ErrorMessage = "The 'Designation' field is required.")]
        public int DesignationId { get; set; }

        [Required(ErrorMessageResourceType = typeof(Validation), ErrorMessageResourceName = "Required")]
        [Range(1, int.MaxValue, ErrorMessage = "The 'Department' field is required.")]
        public int DepartmentId { get; set; }
        [StringLength(50, MinimumLength = 10)]
        public string? LicenseNo { get; set; }
        [RegularExpression(@"^[a-zA-Z][\sa-zA-Z]*",
         ErrorMessage = "Enter upper case, lower case & special character only")]
        [Required(ErrorMessageResourceType = typeof(Validation), ErrorMessageResourceName = "Required")]
        public string? CompanyName { get; set; }

        public int CompanyId { get; set; }

        [Required(ErrorMessageResourceType = typeof(Validation), ErrorMessageResourceName = "Required")]
        [Range(1, int.MaxValue, ErrorMessage = "The 'ResourceI' field is required.")]
        public int ResourceId { get; set; }

        [Required(ErrorMessageResourceType = typeof(Validation), ErrorMessageResourceName = "Required")]
        [Range(1, int.MaxValue, ErrorMessage = "The 'RoleId' field is required.")]
        public int RoleId { get; set; }

        public bool IsActive { get; set; }

        [Display(Name = "Password")]
        [RegularExpression(@"^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,16}$",
         ErrorMessage = "Password should be atleast 8 characters with one number, upper case, lower case & special character e.g. @$!5%B*gr&")]
        [DataType(DataType.Password)]
        public string? Password { get; set; }

        [NotMapped]
        [CompareAttribute("Password", ErrorMessage = "Password and Confirm Password doesn't match.")]
        [DataType(DataType.Password)]
        public string? ConfirmPassowrd { get; set; }
        public string? Email { get; set; }
        public int ProfileAttachmentId { get; set; }
        public string? ProfilePath { get; set; }

        //public int CreatedBy { get; set; }
        public MasterDocumentModel? uploadProfile { get; set; }
        public MasterUserAddressModel? Address { get; set; } = null;
        public MasterUserAddressModel? UpsertAddress { get; set; } = null;
        public Master_QualificationModel? Qualification { get; set; } = null;
        public Master_QualificationModel? UpsertQualification { get; set; } = null;
        public List<MasterDocumentModel>? Documents { get; set; }
        public List<MasterDocumentModel>? uploadDocument { get; set; }
        public DocumentFilesModel? Document { get; set; }
    }
     
}
