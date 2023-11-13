using AutoMapper;
using ValuationWeb.Application.Contracts.Persistence;
using ValuationWeb.Application.Responses;
using ValuationWeb.Domain.Entities;
using MediatR;
using System.Collections.Generic;
using System.Threading;
using System.Threading.Tasks;

namespace ValuationWeb.Application.Features.Users.Commands.SetForgotPassword
{
    public class SetForgotPasswordCommandHandler : IRequestHandler<SetForgotPasswordCommand, Response<int>>
    {
        private readonly IUserRepository _userRepository;
        private readonly IMapper _mapper;

        public SetForgotPasswordCommandHandler(IMapper mapper, IUserRepository userRepository)
        {
            _mapper = mapper;
            _userRepository = userRepository;
        }

        public async Task<Response<int>> Handle(SetForgotPasswordCommand request, CancellationToken cancellationToken)
        {
            var result = await _userRepository.SetForgotPassword(request.Id,request.ForgotPasswordToken);

            if (result > 0)
            {
                return new Response<int>(result, "Password reset successfull ");
            }

            return new Response<int>(result, "Password reset Failed ");
        }      
    }
}