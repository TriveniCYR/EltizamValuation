using ValuationWeb.Application.Responses;
using MediatR;
using System;

namespace ValuationWeb.Application.Features.Users.Commands.SendForgotPasswordEmail
{
    public class SendForgotPasswordEmailCommand : IRequest<Response<bool>>
    {       
        public string Email { get; set; }
        public int Id { get; set; }
    }
}
