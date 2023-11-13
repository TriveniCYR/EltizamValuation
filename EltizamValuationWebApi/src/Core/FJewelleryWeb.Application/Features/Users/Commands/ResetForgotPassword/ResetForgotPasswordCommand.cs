using ValuationWeb.Application.Responses;
using MediatR;
using System;

namespace ValuationWeb.Application.Features.Users.Commands.ResetForgotPassword
{
    public class ResetForgotPasswordCommand : IRequest<Response<int>>
    {
        public string Id { get; set; }        
        public string ForgotPasswordToken { get; set; }
        public string Password { get; set; }
    }
}
