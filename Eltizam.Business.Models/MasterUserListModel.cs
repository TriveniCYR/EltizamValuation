using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Eltizam.Business.Models
{
    public class MasterUserListModel
    {
        public int Id { get; set; }
        public string UserName { get; set; }
        public DateTime DateOfBirth { get; set; }
        public string Department { get; set; }
        public string Designation { get; set; }
        public string ResourceType { get; set; }
        public string Address1 { get; set; }
        public string Address2 { get; set; }
        public string Address3 { get; set; }
        public string CountryName { get; set; }
        public string StateName { get; set; }
        public string CityName { get; set; }
        public string Email { get; set; }
        public string Mobile { get; set; }
        public string ContactPersonName { get; set; }
        public int IsActive { get; set; }
        public int CreatedBy { get; set; }
    }
}
