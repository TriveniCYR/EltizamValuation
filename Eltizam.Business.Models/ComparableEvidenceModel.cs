using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Eltizam.Business.Models
{
    public class ComparableEvidenceModel
    {
        public int Id { get; set; }
        public int? RequestId { get; set; }
        public string? Type { get; set; }
        public int? Size { get; set; }
        public string? Remarks { get; set; }
        public decimal? RateSqFt { get; set; }
        public decimal? Price { get; set; }
        public string? AddtionalComments { get; set; }
        public int? CreatedBy { get; set; }
        public int? ModifiedBy { get; set; }
        public DateTime? CreatedDate { get; set; }
        public DateTime? ModifiedDate { get; set; }
        public bool IsActive { get; set; }
        //public MasterUserAddressModel? Address { get; set; } = null;

        public List<MasterDocumentModel>? Documents { get; set; }
        public List<MasterDocumentModel>? uploadDocument { get; set; }
        //public DocumentFilesModel? Document { get; set; }
    }
}
