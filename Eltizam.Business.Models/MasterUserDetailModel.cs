using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Xml.Linq;

namespace Eltizam.Business.Models
{
    public class MasterUserDetailModel
    {
        public int Id { get; set; }
        public string UserName { get; set; }
        public string FirstName { get; set; }
        public string MiddleName { get; set; }
        public string LastName { get; set; }
        public string? Gender { get; set; }
        public DateTime? DateOfBirth { get; set; }
        public int? DesignationId { get; set; }
        public int? DepartmentId { get; set; }

        public string LicenseNo { get; set; }
        public int ApproverLevelId { get; set; }
        public int CompanyId { get; set; }
        public string CompanyName { get; set; }
        public int ResourceId { get; set; }
        public int RoleId { get; set; }
        public bool IsActive { get; set; }
        public int CreatedBy { get; set; }
        public int ProfileAttachmentId { get; set; }
        public string? ProfilePath { get; set; }
        public string? Email { get; set; }
        public int? GenderId { get; set; }
        public MasterUserAddressModel? Address { get; set; }
        public List<MasterUserAddressModel> Addresses { get; set; }
        public Master_QualificationModel? Qualification { get; set; }
        public List<Master_QualificationModel> Qualifications { get; set; }
        public List<MasterDocumentModel>? Documents { get; set; }
    }
}
