using AutoMapper;
using MediatR;
using ValuationWeb.Application.Contracts.Infrastructure;
using ValuationWeb.Application.Contracts.Persistence;
using ValuationWeb.Application.Models.Mail;
using ValuationWeb.Application.Responses;

namespace ValuationWeb.Application.Features.Users.Commands.SendForgotPasswordEmail
{
    //public class SendForgotPasswordEmailCommandHandler : IRequestHandler<SendForgotPasswordEmailCommand, Response<bool>>
    //{
    //    private readonly IUserRepository _userRepository;
    //    private readonly IMapper _mapper;
    //    private readonly IEmailService _emailService;

    //    public SendForgotPasswordEmailCommandHandler(IMapper mapper, IUserRepository userRepository, IEmailService emailService)
    //    {
    //        _mapper = mapper;
    //        _userRepository = userRepository;
    //        _emailService = emailService;
    //    }

    //    /// <summary>
    //    ///  Added By Pradnesh Raut on 08/24/2022
    //    ///  Sends Forgot password email with encrypted id and random generated password
    //    /// </summary>
    //    /// <param name="request"></param>
    //    /// <param name="cancellationToken"></param>
    //    /// <returns></returns>
    //    public async Task<Response<bool>> Handle(SendForgotPasswordEmailCommand request, CancellationToken cancellationToken)
    //    { 
    //        string strData = "ResetPassword--" + request.Id;
    //       // string strToken = EncryptionDecryption.EncryptString(strData);
    //        string baseURL = "http://localhost:4200/";
    //        //string strRandompass = PasswordHelper.CreateRandomPassword();

    //        await _userRepository.SetForgotPassword(request.Id, "");
    //        Email email = new()
    //        {
    //            Subject = "Reset Password",
    //            Body = String.Format("{0}/reset-password?id={1}&ut={2}", baseURL, "", ""),
    //            To = request.Email
    //        };
    //        var status = await _emailService.SendEmail(email);

    //        if (status)
    //        {
    //            return new Response<bool>(status, "Email Sent ");
    //        }

    //        return new Response<bool>(status, "Email sending failed ");
    //    }
    //}
}