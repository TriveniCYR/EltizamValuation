using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Eltizam.Business.Models
{
    public class Master_ClientModel
    {
        public int Id { get; set; }

       
        public string LicenseNumber { get; set; }

       
        public string FirstName { get; set; }

        
        public string MiddleName { get; set; }

      
        public string LastName { get; set; }

        
        public int ClientTypeId { get; set; }

        public string Company { get; set; }

        public string Address1 { get; set; }

        public string Address2 { get; set; }

        public string PinNo { get; set; }

        public int CountryId { get; set; }

        public int StateId { get; set; }

        public int CityId { get; set; }

        public string Trnnumber { get; set; }

        public DateTime TrnexpiryDate { get; set; }

       
        public int IsActive { get; set; }

        public string Logo { get; set; }

      
        public DateTime CreatedDate { get; set; }

       
        public int CreatedBy { get; set; }

        public DateTime ModifiedDate { get; set; }

        public int ModidiedBy { get; set; }

        public Master_ClientContactModel Contacts { get; set; }
    }
}
