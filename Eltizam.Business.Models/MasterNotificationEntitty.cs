using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Eltizam.Business.Models
{
    public class MasterNotificationEntitty
    {
        public int Id { get; set; }
        public int ValuationRequestId { get; set; }
        public int StatusId { get; set; }
        public string? Subject { get; set; }
        public string? ToEmails { get; set; }
        public string? Body { get; set; }
        public DateTime SentDatetime { get; set; }
        public byte IsEmailSent { get; set; }
        public int CreatedBy { get; set; }
        public DateTime CreatedDate { get; set; }
    }
}
