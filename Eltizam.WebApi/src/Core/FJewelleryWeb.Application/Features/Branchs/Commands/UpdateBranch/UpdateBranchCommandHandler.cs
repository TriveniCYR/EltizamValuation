using AutoMapper;
using MediatR;
using ValuationWeb.Application.Contracts.Persistence;
using ValuationWeb.Application.Responses;
using ValuationWeb.Domain.Entities;
using ValuationWeb.Domain.ViewModel;

namespace ValuationWeb.Application.Features.Branchs.Commands.UpdateBranch
{
    /// <summary>
    /// Added by Sharanaiyya Swami  on 22/08/2022
    /// Class used to take care for Update branch action
    /// </summary>
    public class UpdateBranchCommandHandler : IRequestHandler<UpdateBranchCommand, Response<BranchDetailViewModel>>
    {
        private readonly IBranchRepository _branchRepository;
        private readonly IMapper _mapper;

        public UpdateBranchCommandHandler(IMapper mapper, IBranchRepository branchRepository)
        {
            _mapper = mapper;
            _branchRepository = branchRepository;
        }

        public async Task<Response<BranchDetailViewModel>> Handle(UpdateBranchCommand request, CancellationToken cancellationToken)
        {
            var updateCmd = new Response<BranchDetailViewModel>();
            var existBranch = await _branchRepository.GetBranchByName(request.Name);

            var BranchsToUpdate = await _branchRepository.GetByIdAsync(request.Id);
            if (BranchsToUpdate == null)
            {
                updateCmd.Succeeded = false;
                updateCmd.Message = request.Id + " is not available";
            }
            //Used to check another branch in DB for same email & give erros
            if (existBranch != null && existBranch.Id != request.Id)
            {
                updateCmd.Succeeded = false;
                updateCmd.Errors = new List<string>();
                updateCmd.Errors.Add("Error: Another user already exists with same email address.");
            }
            else
            {
                var reqInput = _mapper.Map<Branch>(request);

                //Update branch data in db
                await _branchRepository.UpdateAsync(reqInput); 
                 
                reqInput = await _branchRepository.GetByIdAsync(reqInput.Id);

                updateCmd.Data = _mapper.Map<BranchDetailViewModel>(reqInput);
                updateCmd.Succeeded = true;
                updateCmd.Message = "Data is Updated successfully for id "+ request.Id ; 
            }
            return updateCmd;
        }
    }
}