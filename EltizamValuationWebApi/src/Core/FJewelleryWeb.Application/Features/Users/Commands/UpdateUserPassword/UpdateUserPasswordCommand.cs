using ValuationWeb.Application.Responses;
using MediatR;
using System;

namespace ValuationWeb.Application.Features.Users.Commands.UpdateUserPassword
{
    public class UpdateUserPasswordCommand : IRequest<Response<int>>
    {
        public int Id { get; set; }        
        public string Password { get; set; }        
    }
}
