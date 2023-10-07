using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Eltizam.Business.Models
{
    public class MasterUserAddressModel
    {
        public int Id { get; set; }
        public int UserId { get; set; }
        public string Address1 { get; set; }
        public string Address2 { get; set; }
        public string Address3 { get; set; }
        public string PinNo { get; set; }
        public int CountryId { get; set; }
        public int StateId { get; set; }
        public int CityId { get; set; }
        public string Email { get; set; }
        public string AlternateEmail { get; set; }
        public string Phone { get; set; }
        public string AlternatePhone { get; set; }
        public string Landlinephone { get; set; }
    }
}
