using Eltizam.Resource.Resources;
using System.ComponentModel.DataAnnotations;

namespace Eltizam.Business.Models
{
    public class MasterUserAddressModel
    {
        public int Id { get; set; }
        public int UserId { get; set; }
        
        [StringLength(250, MinimumLength = 1)]
        [Required(ErrorMessageResourceType = typeof(Validation), ErrorMessageResourceName = "Required")]
        public string? Address1 { get; set; }
       
        [StringLength(250, MinimumLength = 1)]
        public string? Address2 { get; set; }
       
        [StringLength(250, MinimumLength = 1)]
        public string? Address3 { get; set; }
       
        [StringLength(10, MinimumLength = 5)]
        public string? PinNo { get; set; }
        
        [Required(ErrorMessageResourceType = typeof(Validation), ErrorMessageResourceName = "Required")]
        [Range(1, int.MaxValue, ErrorMessage = "The 'Country' field is required.")]
        public int CountryId { get; set; }
        
        [Required(ErrorMessageResourceType = typeof(Validation), ErrorMessageResourceName = "Required")]
        [Range(1, int.MaxValue, ErrorMessage = "The 'State' field is required.")]
        public int StateId { get; set; }
        
        [Required(ErrorMessageResourceType = typeof(Validation), ErrorMessageResourceName = "Required")]
        [Range(1, int.MaxValue, ErrorMessage = "The 'City' field is required.")]
        public int CityId { get; set; }
    
        [DataType(DataType.EmailAddress)]
        [MaxLength(50)]
        [RegularExpression(@"[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}", ErrorMessage = "Please enter correct email")]
        public string? Email { get; set; }
        
        [DataType(DataType.EmailAddress)]
        [MaxLength(50)]
        [RegularExpression(@"[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}", ErrorMessage = "Please enter correct email")]
        public string? AlternateEmail { get; set; }
        
        [StringLength(12, MinimumLength = 5)]
        [Required(ErrorMessageResourceType = typeof(Validation), ErrorMessageResourceName = "Required")]
        public string? Phone { get; set; }
        
        [Required(ErrorMessageResourceType = typeof(Validation), ErrorMessageResourceName = "Required")]
        [Range(1, int.MaxValue, ErrorMessage = "The 'PhoneExt' field is required.")]
        public string PhoneExt { get; set; }
       
        [StringLength(12, MinimumLength = 5)]
        public string? AlternatePhone { get; set; }

        [StringLength(12, MinimumLength = 5)]
        public string? AlternatePhoneExt { get; set; }
       
        [StringLength(12, MinimumLength = 5)]
        public string? Landlinephone { get; set; }

        public bool? IsDeleted { get; set; }
    }
}
