using AutoMapper;
using MediatR;
using ValuationWeb.Application.Contracts.Persistence;
using ValuationWeb.Application.Responses;
using ValuationWeb.Domain.Entities;
using ValuationWeb.Domain.ViewModel;

namespace ValuationWeb.Application.Features.Users.Commands.UpdateUser
{
    /// <summary>
    /// Added by YReddy on 08/17/2022
    /// Class used to take care for Update user action
    /// </summary>
    public class UpdateUserCommandHandler : IRequestHandler<UpdateUserCommand, Response<UserDetailViewModel>>
    {
        private readonly IUserRepository _userRepository;
        private readonly IMapper _mapper;

        public UpdateUserCommandHandler(IMapper mapper, IUserRepository userRepository)
        {
            _mapper = mapper;
            _userRepository = userRepository;
        }

        public async Task<Response<UserDetailViewModel>> Handle(UpdateUserCommand request, CancellationToken cancellationToken)
        {
            var updateCmd = new Response<UserDetailViewModel>();
            var existUser = await _userRepository.GetUserByEmail(request.Email);

            var UsersToUpdate = await _userRepository.GetByIdAsync(request.Id);
            if (UsersToUpdate == null)
            {
                updateCmd.Succeeded = false;
                updateCmd.Message = request.Id + " is not available";
            }
            //Used to check another user in DB for same email & give erros
            if (existUser != null && existUser.Id != request.Id)
            {
                updateCmd.Succeeded = false;
                updateCmd.Errors = new List<string>();
                updateCmd.Errors.Add("Error: Another user already exists with same email address.");
            }
            else
            {
                // request.Password = EncryptionDecryption.EncryptString(request.Password);
                var reqInput = _mapper.Map<User>(request);

                //Update user data in db
                await _userRepository.UpdateAsync(reqInput);

                //Sp call for AccNum, Role changes
                await _userRepository.UpsertUserAccountDetails(reqInput);

                var userVM = await _userRepository.GetUserDetailsById(reqInput.Id);

                updateCmd.Data = userVM; 
                updateCmd.Succeeded = true;
                updateCmd.Message = "Data is Updated successfully for id "+ request.Id ; 
            }
            return updateCmd;
        }
    }
}