using AutoMapper;
using ValuationWeb.Application.Contracts.Persistence;
using ValuationWeb.Application.Responses;
using ValuationWeb.Domain.Entities;
using MediatR;
using System.Collections.Generic;
using System.Threading;
using System.Threading.Tasks;

namespace ValuationWeb.Application.Features.Users.Commands.UpdateUserPassword
{
    public class UpdateUserPasswordCommandHandler : IRequestHandler<UpdateUserPasswordCommand, Response<int>>
    {
        private readonly IUserRepository _userRepository;
        private readonly IMapper _mapper;

        public UpdateUserPasswordCommandHandler(IMapper mapper, IUserRepository userRepository)
        {
            _mapper = mapper;
            _userRepository = userRepository;
        }

        public async Task<Response<int>> Handle(UpdateUserPasswordCommand request, CancellationToken cancellationToken)
        {
            var result = await _userRepository.UpdateUserPassword(request.Id,request.Password);

            if (result > 0)
            {
                return new Response<int>(result, "Updated successfully ");
            }

            return new Response<int>(result, "Updated Failed ");
        }      
    }
}