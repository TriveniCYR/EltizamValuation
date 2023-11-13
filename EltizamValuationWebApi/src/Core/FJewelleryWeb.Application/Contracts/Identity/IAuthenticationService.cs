using ValuationWeb.Application.Models.Authentication;
using System.Threading.Tasks;

namespace ValuationWeb.Application.Contracts.Identity
{
    public interface IAuthenticationService
    {
        Task<AuthenticationResponse> AuthenticateAsync(AuthenticationRequest request);
        Task<RegistrationResponse> RegisterAsync(RegistrationRequest request);
        Task<RefreshTokenResponse> RefreshTokenAsync(RefreshTokenRequest request);       
    }
}
