using ValuationWeb.Domain.ViewModel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ValuationWeb.Application.Models.Login
{
    public class AuthenticateUserResponse : UserDetailViewModel
    {
        public string Message { get; set; }
        public bool IsAuthenticated { get; set; } 
        public string Token { get; set; }
        public string RefreshToken { get; set; }
        public DateTime? RefreshTokenExpiration { get; set; }  
    }
}
