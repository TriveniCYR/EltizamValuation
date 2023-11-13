using AutoMapper;
using MediatR;
using ValuationWeb.Application.Contracts.Persistence;
using ValuationWeb.Application.Responses;

namespace ValuationWeb.Application.Features.Users.Commands.ResetForgotPassword
{
    //public class ResetForgotPasswordCommandHandler : IRequestHandler<ResetForgotPasswordCommand, Response<int>>
    //{
    //    private readonly IUserRepository _userRepository;
    //    private readonly IMapper _mapper;

    //    public ResetForgotPasswordCommandHandler(IMapper mapper, IUserRepository userRepository)
    //    {
    //        _mapper = mapper;
    //        _userRepository = userRepository;
    //    }

    //    /// <summary>
    //    ///  Added By Pradnesh Raut on 08/24/2022
    //    ///  Checks if user exists or Forgot password token is matched or it the token valid and then updates the password
    //    /// </summary>
    //    /// <param name="request"></param>
    //    /// <param name="cancellationToken"></param>
    //    /// <returns></returns>
    //    public async Task<Response<int>> Handle(ResetForgotPasswordCommand request, CancellationToken cancellationToken)
    //    {
    //        var strid = ""; // EncryptionDecryption.DecryptString(request.Id);
    //        var id = strid.Split("--")[1];
    //        var isNumeric = int.TryParse(id, out _);
    //        if (isNumeric)
    //        {
    //            var user = _userRepository.GetUserDetailsById(Int32.Parse(id));
    //            if (user != null)
    //            {
    //                if (user.Result.ForgotPasswordToken == request.ForgotPasswordToken)
    //                {
    //                    if (user.Result.ForgotPasswordExpirationDate > DateTime.Now)
    //                    {
    //                        var result = await _userRepository.UpdateUserPassword(Int32.Parse(id), request.Password);

    //                        if (result > 0)
    //                        {
    //                            return new Response<int>(result, "Password reset successfull ");
    //                        }

    //                        return new Response<int>(result, "Password reset Failed ");
    //                    }
    //                    else
    //                    {
    //                        return new Response<int>("Token expired");
    //                    }
    //                }
    //                else
    //                {
    //                    return new Response<int>("Invalid token");
    //                }
    //            }
    //            else
    //            {
    //                return new Response<int>("User not found");
    //            }
    //        }
    //        else
    //        {
    //            return new Response<int>("Invalid Id");
    //        }
    //    }
    //}
}