using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Eltizam.Business.Models
{
    public class EmailLogHistoryModel
    {
        public string FromAddress { get; set; }
        public string Subject { get; set; }
        public string ToAddress { get; set; }
        public string CCAddress { get; set; }
        public string BccAddress { get; set; }
        public string Body { get; set; }
        public bool IsSent { get; set; }
        public string EmailResponse { get; set; }
        public int CreatedBy { get; set; }
        public DateTime CreatedDate { get; set; }
       // [Id], [FromAddress], [Subject], [ToAddress], [CCAddress], [BccAddress], [Body], [IsSent], [EmailResponse], [CreatedBy], [CreatedDate]
    }
}
