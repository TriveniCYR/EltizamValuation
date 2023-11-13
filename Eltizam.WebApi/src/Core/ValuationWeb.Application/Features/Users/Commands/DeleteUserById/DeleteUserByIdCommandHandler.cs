using AutoMapper;
using ValuationWeb.Application.Contracts.Persistence;
using ValuationWeb.Application.Responses;
using ValuationWeb.Domain.Entities;
using MediatR;
using System.Collections.Generic;
using System.Threading;
using System.Threading.Tasks;
namespace ValuationWeb.Application.Features.Users.Commands.DeleteUserById
{
    /// <summary>
    /// Added by YReddy on 08/17/2022
    /// Class used to take care for Deactivate user action
    /// </summary>
    public class DeleteUserByIdCommandHandler : IRequestHandler<DeleteUserByIdCommand, Response<int>>
    {
        private readonly IUserRepository _userRepository;
        private readonly IMapper _mapper;

        public DeleteUserByIdCommandHandler(IMapper mapper, IUserRepository userRepository)
        {
            _mapper = mapper;
            _userRepository = userRepository;
        }


        /// <summary>
        /// Made changes by YReddy on 08/30/2022
        /// Changes for toggle user status changes
        /// </summary>
        /// <param name="request"></param>
        /// <param name="cancellationToken"></param>
        /// <returns></returns>
        public async Task<Response<int>> Handle(DeleteUserByIdCommand request, CancellationToken cancellationToken)
        {
            var UsersToDelete = await _userRepository.GetByIdAsync(request.Id);
            if (UsersToDelete == null)
            {
                var resposeObj = new Response<int>(request.Id + " is not available");
                return resposeObj;
            }

            var reqInput = _mapper.Map<User>(UsersToDelete);
            reqInput.IsActive = request.IsActive;
            reqInput.CloseDate = request.IsActive.HasValue && request.IsActive.Value == true ? null : DateTime.Now;

            await _userRepository.UpdateAsync(reqInput);

            return new Response<int>(request.Id, "Deactivated successfully");
        }
    }
}