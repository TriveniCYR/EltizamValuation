using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Eltizam.Business.Models
{
    public class MasterClientListModel
    {
        public int Id { get; set; }
        public string FirstName { get; set; }
        public string MiddleName { get; set; }
        public string LastName { get; set; }
        public string ClientName { get; set; }
        public string ClientType { get; set; }
        public int ClientTypeId { get; set; }
        public string LicenseNumber { get; set; }
        public string Trnnumber { get; set; }
        public DateTime TrnexpiryDate { get; set; }
        public int IsActive { get; set; }
    }
}
