using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Eltizam.Business.Models
{
    public class UserSessionEntity
    {
        public Int32 UserId { get; set; }

        public string FullName { get; set; }

        public string Email { get; set; }

        public string UserToken { get; set; }

        public DateTime VallidTo { get; set; }
       
    }
}
