namespace Eltizam.Business.Models
{
    public class SendEmailModel
    {
        public string ToEmailList { get; set; } = string.Empty;
        public string? Subject { get; set; } = string.Empty;
        public string? Body { get; set; } = string.Empty;

        public int? ValId { get; set; }
        public string? ValRefNo { get; set; }
        public string? Client { get; set; }
        public string? Property { get; set; }
        public string? Location { get; set; }
        public string? Status { get; set; }
        public int? StatusId { get; set; }
    }
}
