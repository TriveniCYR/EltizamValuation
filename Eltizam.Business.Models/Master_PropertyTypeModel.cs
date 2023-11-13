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
        [Remote("CheckPropertTypeExists", "MasterPropertyType", ErrorMessage = "Email Address already exists in database.")]
        public string PropertyType { get; set; }
        public bool IsActive { get; set; } 
        public string? SubTypes { get; set; }
        [NotMapped]
        public List<Master_PropertySubTypeModel> MasterPropertySubTypes { get; set; }
    }

	
}
