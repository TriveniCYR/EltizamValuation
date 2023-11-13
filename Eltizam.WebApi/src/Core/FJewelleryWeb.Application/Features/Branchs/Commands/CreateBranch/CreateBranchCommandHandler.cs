using AutoMapper;
using ValuationWeb.Application.Contracts.Persistence;
using ValuationWeb.Application.Responses;
using ValuationWeb.Domain.Entities;
using ValuationWeb.Domain.ViewModel;
using MediatR;
using System.Collections.Generic;
using System.Threading;
using System.Threading.Tasks;

namespace ValuationWeb.Application.Features.Branchs.Commands.CreateBranch
{
    /// <summary>
    /// Added by Sharanaiyya Swami  on 22/08/2022 sfsd fsd
    /// Class used to take care for Create branch action
    /// </summary>
    public class CreateBranchCommandHandler : IRequestHandler<CreateBranchCommand, Response<BranchDetailViewModel>>
    {
        private readonly IBranchRepository _branchRepository;
        private readonly IMapper _mapper; 

        public CreateBranchCommandHandler(IMapper mapper, IBranchRepository branchRepository)
        {
            _mapper = mapper;
            _branchRepository = branchRepository;
        }

        public async Task<Response<BranchDetailViewModel>> Handle(CreateBranchCommand request, CancellationToken cancellationToken)
        {
            var createBranchCmdResponse = new Response<BranchDetailViewModel>();
            var existBranch = await _branchRepository.GetBranchByName(request.Name) != null;

            var validator = new CreateBranchCommandValidator();
            var validationResult = await validator.ValidateAsync(request);

            if (validationResult.Errors.Count > 0 || existBranch)
            {
                createBranchCmdResponse.Succeeded = false;
                createBranchCmdResponse.Errors = new List<string>();
                foreach (var error in validationResult.Errors)
                {
                    createBranchCmdResponse.Errors.Add(error.ErrorMessage);
                }

                //Used to check another user in DB for same email & give erros
                if (existBranch)
                {
                    createBranchCmdResponse.Errors.Add("Error: Another branch already exists with same name.");
                }
            }
            else
            {
                var branch = _mapper.Map<Branch>(request);
                //Add branch with entity
                await _branchRepository.AddAsync(branch); 

                //Get branch details after insert
                var branchs = await _branchRepository.GetByIdAsync(branch.Id);

                createBranchCmdResponse.Data = _mapper.Map<BranchDetailViewModel>(branchs);
                createBranchCmdResponse.Succeeded = true;
                createBranchCmdResponse.Message = "success";
            }

            return createBranchCmdResponse;
        }
    }
}
