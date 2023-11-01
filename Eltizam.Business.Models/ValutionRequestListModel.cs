using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Eltizam.Business.Models
{
    public class ValutionRequestListModel
    {
        public int Id { get; set; }
       
        public string? ClientName { get; set; }
        public string? ClientType { get; set; }

        public string? Location { get; set; }

        public string? PropertyName { get; set; }

        public DateTime? ValuationDate { get; set; }
        public string? ValuationPurpose { get; set; }

        public string? StatusName { get; set; }

        public string? Approver { get; set; }

        public string? Requestor { get; set; }
        public string? Valuator { get; set; }
        public string MethodOfValution { get; set; }

        public string ColorCode { get; set; }

        public string ReferenceNO { get; set; }

        public int ResourceId { get; set; }
        public int RoleId { get; set; }

        public int DepartmentId { get; set; }
        public int DesignationId { get; set; }


    }
}
