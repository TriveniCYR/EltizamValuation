using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Eltizam.Business.Models
{
    public class ValuationRequestDependencies
    {
        public int? Id { get; set; }
        public string? ReferenceNO { get; set; }
        public int ClientId { get; set; }
        public string? ClientName { get; set; }
        public int ClientTypeId { get; set; }
        public string? ClientType { get; set; }
        public int PropertyTypeId { get; set; }
        public string? PropertyType { get; set; }
        public int OwnershipTypeId { get; set; }
        public string? OwnershipType { get; set; }
        public int PropertySubTypeId { get; set; }
        public string? PropertySubType { get; set; } 
        public int PropertyId { get; set; }
        public string? PropertyName { get; set; }

        //     r.Id, r.ReferenceNO, c.Id ClientId, c.ClientName, c.ClientTypeId, ct.ClientType, p.PropertyTypeId, pt.PropertyType,  
        //p.OwnershipTypeId, o.OwnershipType, p.PropertySubTypeId, sp.PropertySubType
    }
}
