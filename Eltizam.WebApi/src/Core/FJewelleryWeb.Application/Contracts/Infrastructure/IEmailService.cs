using ValuationWeb.Application.Models.Mail;
using System.Threading.Tasks;

namespace ValuationWeb.Application.Contracts.Infrastructure
{
    public interface IEmailService
    {
        Task<bool> SendEmail(Email email);
    }
}
