namespace ValuationWeb.Application.Models.Mail
{
    public class EmailSettings
    {
        public string ApiKey { get; set; }
        public string FromAddress { get; set; }
        public string FromName { get; set; }
    }

    public class AppSettings
    {
        public string ConnectionString { get; set; } 
    }
}
