using AutoMapper;
using ValuationWeb.Application.Contracts.Persistence;
using ValuationWeb.Application.Features.GloblaFilters;
using ValuationWeb.Application.Responses;
using MediatR;
using Microsoft.Extensions.Logging;


namespace ValuationWeb.Application.Features.Users.Queries.GetUserListWithPagination
{
    /// <summary>
    /// Added by YReddy on 08/12/2022 
    /// Method is used to pull all user details depends on filter values
    /// </summary>
    public class UserSearchFiltersHandler : IRequestHandler<UserSearchFilters, Response<GlobalSeachResponse>>
    {
        private readonly IUserRepository _userRepository;
        private readonly IMapper _mapper;
        private readonly ILogger _logger;
        public UserSearchFiltersHandler(IMapper mapper, IUserRepository userRepository, ILogger<UserSearchFiltersHandler> logger)
        {
            _mapper = mapper;
            _userRepository = userRepository;
            _logger = logger;
        }

        public async Task<Response<GlobalSeachResponse>> Handle(UserSearchFilters request, CancellationToken cancellationToken)
        {
            var allusers = await _userRepository.GetUserListWithPaginationGlobal(request); 
            return new Response<GlobalSeachResponse>(allusers, "success"); ;
        }
    }
}
