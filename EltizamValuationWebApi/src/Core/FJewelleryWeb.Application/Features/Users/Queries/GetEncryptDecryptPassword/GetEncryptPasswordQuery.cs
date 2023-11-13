using ValuationWeb.Application.Responses;
using MediatR;
using System;
using System.Collections.Generic;

namespace ValuationWeb.Application.Features.Users.Queries.GetEncryptDecryptPassword
{
    /// <summary>
    /// Added by YReddy on 08/15/2022 
    /// Used to generate encrypt password from plain value
    /// </summary>
    public class GetEncryptPasswordQuery : IRequest<Response<string>>
    {
        public string InputValue { get; set; }
    }

    /// <summary>
    /// Added by YReddy on 08/15/2022 
    /// Used to generate Dectypt Value value from encrypt string
    /// </summary>
    public class GetDecryptedTextFromPasswordQuery : IRequest<Response<string>>
    {
        public string DectyptValue { get; set; }
    }
}
