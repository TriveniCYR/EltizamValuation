using AutoMapper;
using Eltizam.Data.DataAccess.Core.UnitOfWork;
using MediatR;
using ValuationWeb.Application.Contracts.Persistence;
using ValuationWeb.Application.Responses;
using ValuationWeb.Domain.Entities;
using ValuationWeb.Domain.ViewModel;

namespace ValuationWeb.Application.Features.Users.Commands.CreateUser
{
    /// <summary>
    /// Added by YReddy on 08/17/2022
    /// Class used to take care for Create user action
    /// </summary>
    public class CreateBranchCommandHandler : IRequestHandler<CreateUserCommand, Response<UserDetailViewModel>>
    {
        private readonly IUserRepository _userRepository;
        private readonly IMapper _mapper;
        //private readonly IUnitOfWork _unitOfWork;

        public CreateBranchCommandHandler(IMapper mapper, IUserRepository userRepository) //, IUnitOfWork unitOfWork)
        {
            _mapper = mapper;
            _userRepository = userRepository; 
          //  _unitOfWork = unitOfWork;
        }

        public async Task<Response<UserDetailViewModel>> Handle(CreateUserCommand request, CancellationToken cancellationToken)
        {
            var createCmdRes = new Response<UserDetailViewModel>();
            var existUser = await _userRepository.GetUserByEmail(request.Email) != null;

            var validator = new CreateUserCommandValidator();
            var validationResult = await validator.ValidateAsync(request);

            if (validationResult.Errors.Count > 0 || existUser)
            {
                createCmdRes.Succeeded = false;
                createCmdRes.Errors = new List<string>();
                foreach (var error in validationResult.Errors)
                {
                    createCmdRes.Errors.Add(error.ErrorMessage);
                }

                //Used to check another user in DB for same email & give erros
                if (existUser)
                {
                    createCmdRes.Errors.Add("Error: Another user already exists with same email address.");
                }
            }
            else
            {
                request.Password = "";// EncryptionDecryption.EncryptString(request.Password);
                var user = _mapper.Map<User>(request);

                //Check and sure mandatory fields are filled up
                if (string.IsNullOrWhiteSpace(user.UserName))
                    user.UserName = string.Format("{0}.{1}", user.FirstName, user.LastName);

                if (string.IsNullOrWhiteSpace(user.Name))
                    user.Name = string.Format("{0} {1}", user.FirstName, user.LastName);

                if (string.IsNullOrWhiteSpace(user.Prefix))
                    user.Prefix = "";

                if (string.IsNullOrWhiteSpace(user.Description))
                    user.Description = "";

                //Add user with entity
                await _userRepository.AddAsync(user);

                //Sp call for AccNum checking
                await _userRepository.UpsertUserAccountDetails(user);

                //Get user details after insert
                var userVM = await _userRepository.GetUserDetailsById(user.Id);

                createCmdRes.Data = userVM; // _mapper.Map<UserDetailViewModel>(users);
                createCmdRes.Succeeded = true;
                createCmdRes.Message = "success";
            }

            return createCmdRes;
        }
    }
}
