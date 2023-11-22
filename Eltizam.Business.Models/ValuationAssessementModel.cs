using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Eltizam.Business.Models
{
    public class ValuationAssessementModel
    {
        public int Id { get; set; }
        public int? RequestId { get; set; }
        public int? MarketValue { get; set; }
        public int? MarkentRent { get; set; }
        public int? LifeOfBuilding { get; set; }
        public int? AnnualMaintainceCost { get; set; }
        public bool Insuarance { get; set; }
        public string? InsuranceDetails { get; set; }

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
