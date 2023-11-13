using AutoMapper;
using ValuationWeb.Application.Contracts.Persistence;
using ValuationWeb.Application.Responses;
using ValuationWeb.Domain.Entities;
using MediatR;
using Microsoft.Extensions.Logging;
using System.Collections.Generic;
using System.Linq;
using System.Threading;
using System.Threading.Tasks;


namespace ValuationWeb.Application.Features.Users.Queries.GetEncryptDecryptPassword
{
    /// <summary>
    /// Added by YReddy on 08/15/2022 
    /// Used to generate Encrypt original string into encrypt password value
    /// </summary>
    public class GetEncryptPasswordQueryHandler : IRequestHandler<GetEncryptPasswordQuery, Response<string>>
    {
        private readonly IUserRepository _userRepository;
        private readonly IMapper _mapper;
        private readonly ILogger _logger;
        public GetEncryptPasswordQueryHandler(IMapper mapper, IUserRepository userRepository, ILogger<GetEncryptPasswordQueryHandler> logger)
        {
            _mapper = mapper;
            _userRepository = userRepository;
            _logger = logger;
        }

        public async Task<Response<string>> Handle(GetEncryptPasswordQuery request, CancellationToken cancellationToken)
        { 
            var encryptVal = await _userRepository.GetEncryptPassword(request.InputValue); 

            _logger.LogInformation("Success: Hanlde Completed for the method GetEncryptPassword");
            return new Response<string>(encryptVal, "success");
        }
    }

    /// <summary>
    /// Added by YReddy on 08/15/2022 
    /// Used to generate Dectypt password from encrypt password value
    /// </summary>
    public class GetDecryptedTextFromPasswordQueryHandler : IRequestHandler<GetDecryptedTextFromPasswordQuery, Response<string>>
    {
        private readonly IUserRepository _userRepository;
        private readonly IMapper _mapper;
        private readonly ILogger _logger;
        public GetDecryptedTextFromPasswordQueryHandler(IMapper mapper, IUserRepository userRepository, ILogger<GetDecryptedTextFromPasswordQueryHandler> logger)
        {
            _mapper = mapper;
            _userRepository = userRepository;
            _logger = logger;
        }

        public async Task<Response<string>> Handle(GetDecryptedTextFromPasswordQuery request, CancellationToken cancellationToken)
        {
            var password = await _userRepository.GetDecryptedTextFromPassword(request.DectyptValue); 

            _logger.LogInformation("Success: Hanlde Completed for the method GetDecryptedTextFromPassword");
            return new Response<string>(password, "success");
        }
    }
}
