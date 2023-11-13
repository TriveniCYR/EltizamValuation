using ValuationWeb.Application.Responses;
using MediatR;
using System;

namespace ValuationWeb.Application.Features.Users.Commands.DeleteUserById
{
    public class DeleteUserByIdCommand: IRequest<Response<int>>
    {
        public int Id { get; set; }
        public bool? IsActive { get; set; }
    }
}
