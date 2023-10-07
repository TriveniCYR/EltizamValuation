using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Eltizam.Business.Models
{
    public class UserSearchModel
    {
        public string? UserName { get; set; }
        public int CountryId { get; set; }
        public int StateId { get; set; }
    }
}
