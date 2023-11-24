using Eltizam.Resource.Resources;
using Microsoft.AspNetCore.Mvc;
using System.ComponentModel.DataAnnotations;
using AutoMapper;
using System.ComponentModel.DataAnnotations.Schema;

namespace Eltizam.Business.Models
{
    public class Master_PropertyTypeModel : GlobalAuditFields
    {
        public int Id { get; set; }
        [Required(ErrorMessageResourceType = typeof(Validation), ErrorMessageResourceName = "Required")]
        [MaxLength(250, ErrorMessage = "The field {0} must be a string with a maximum length of {1}.")]
        public string ? PropertyType { get; set; }
        public bool IsActive { get; set; } 
        public string? SubTypes { get; set; }
        [NotMapped]
        public List<Master_PropertySubTypeModel> MasterPropertySubTypes { get; set; }
    }

	
}
