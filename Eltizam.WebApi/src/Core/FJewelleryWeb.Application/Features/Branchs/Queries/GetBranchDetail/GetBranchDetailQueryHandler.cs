using AutoMapper;
using ValuationWeb.Application.Contracts.Persistence;
using ValuationWeb.Application.Responses;
using ValuationWeb.Domain.ViewModel;
using MediatR;
using Microsoft.Extensions.Logging;


namespace ValuationWeb.Application.Features.Branchs.Queries.GetBranchDetail
{
    /// <summary>
    /// Added by YReddy on 08/15/2022
    /// Class used to hold User details request handler
    /// </summary>
    public class GetBranchDetailQueryHandler : IRequestHandler<GetBranchDetailQuery, Response<BranchDetailViewModel>>
    {
        private readonly IBranchRepository _branchRepository;
        private readonly IMapper _mapper;
        private readonly ILogger _logger;
        public GetBranchDetailQueryHandler(IMapper mapper, IBranchRepository branchRepository, ILogger<GetBranchDetailQueryHandler> logger)
        {
            _mapper = mapper;
            _branchRepository = branchRepository;
            _logger = logger;
        }

        public async Task<Response<BranchDetailViewModel>> Handle(GetBranchDetailQuery request, CancellationToken cancellationToken)
        { 
            var allBranchs = await _branchRepository.GetBranchDetails(request);
            var branch = _mapper.Map<BranchDetailViewModel>(allBranchs); 
            if(branch == null)
            {
                return new Response<BranchDetailViewModel>("branch not found");
            }
            return new Response<BranchDetailViewModel>(branch, "success");
        }
    }
}
