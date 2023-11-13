using AutoMapper;
using ValuationWeb.Application.Contracts.Persistence;
using ValuationWeb.Application.Responses;
using ValuationWeb.Domain.ViewModel;
using MediatR;
using Microsoft.Extensions.Logging;


namespace ValuationWeb.Application.Features.Users.Queries.GetUserDetail
{
    /// <summary>
    /// Added by YReddy on 08/15/2022
    /// Class used to hold User details request handler
    /// </summary>
    public class GetUserDetailQueryHandler : IRequestHandler<GetUserDetailQuery, Response<UserDetailViewModel>>
    {
        private readonly IUserRepository _userRepository;
        private readonly IMapper _mapper;
        private readonly ILogger _logger;
        public GetUserDetailQueryHandler(IMapper mapper, IUserRepository userRepository, ILogger<GetUserDetailQueryHandler> logger)
        {
            _mapper = mapper;
            _userRepository = userRepository;
            _logger = logger;
        }

        public async Task<Response<UserDetailViewModel>> Handle(GetUserDetailQuery request, CancellationToken cancellationToken)
        { 
            var allUsers = await _userRepository.GetUserDetails(request);
            var user = _mapper.Map<UserDetailViewModel>(allUsers); 
            if(user == null)
            {
                return new Response<UserDetailViewModel>("user not found");
            }
            return new Response<UserDetailViewModel>(user, "success");
        }
    }
}
