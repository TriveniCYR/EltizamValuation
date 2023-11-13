using AutoMapper;
using ValuationWeb.Application.Contracts.Persistence;
using ValuationWeb.Application.Responses;
using ValuationWeb.Domain.Entities;
using MediatR;
using System.Collections.Generic;
using System.Threading;
using System.Threading.Tasks;
namespace ValuationWeb.Application.Features.Branchs.Commands.DeleteBranchById
{
    /// <summary>
    /// Added by Sharanaiyya Swami  on 22/08/2022
    /// Class used to take care for Deactivate branch action
    /// </summary>
    public class DeleteBranchByIdCommandHandler : IRequestHandler<DeleteBranchByIdCommand, Response<int>>
    {
        private readonly IBranchRepository _branchRepository;
        private readonly IMapper _mapper;

        public DeleteBranchByIdCommandHandler(IMapper mapper, IBranchRepository branchRepository)
        {
            _mapper = mapper;
            _branchRepository = branchRepository;
        }

        public async Task<Response<int>> Handle(DeleteBranchByIdCommand request, CancellationToken cancellationToken)
        {
            var BranchsToDelete = await _branchRepository.GetByIdAsync(request.Id);
            if (BranchsToDelete == null)
            {
                var resposeObj = new Response<int>(request.Id + " is not available");
                return resposeObj;
            }

            var reqInput = _mapper.Map<Branch>(BranchsToDelete);
            reqInput.IsActive = false;
            reqInput.CloseDate = DateTime.Now;
            await _branchRepository.UpdateAsync(reqInput);

            return new Response<int>(request.Id, "Deactivated successfully");
        }
    }
}