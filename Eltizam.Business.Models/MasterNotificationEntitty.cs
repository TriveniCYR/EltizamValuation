using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Eltizam.Business.Models
{
    public class MasterNotificationEntitty
    {
        public long Id { get; set; }
        public int? ValuationRequestId { get; set; }
        public int? StatusId { get; set; }
        public string? Subject { get; set; }
        public string? ToEmails { get; set; }
        public string? Body { get; set; }
        [DisplayFormat(DataFormatString = "{0:dd-MM-yyyy}", ApplyFormatInEditMode = true)]
        public DateTime? SentDatetime { get; set; }
        public byte IsEmailSent { get; set; }
        public int CreatedBy { get; set; }
        public DateTime CreatedDate { get; set; }
        public int? Readby { get; set; }
        public DateTime? ReadDate { get; set; }
        public string ValRefNo { get; set; }
    }
}
