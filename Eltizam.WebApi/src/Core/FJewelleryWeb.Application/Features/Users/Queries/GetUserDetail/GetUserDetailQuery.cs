using ValuationWeb.Application.Responses;
using ValuationWeb.Domain.ViewModel;
using MediatR;
using System;
using System.Collections.Generic;

namespace ValuationWeb.Application.Features.Users.Queries.GetUserDetail
{
    /// <summary>
    /// Added by YReddy on 08/05/2022
    /// Class used to hold all user related filters
    /// </summary>
    public class GetUserDetailQuery : IRequest<Response<UserDetailViewModel>>
    {
        public int? Id { get; set; }
        public bool? status { get; set; }

        public string? Email { get; set; }
        public string? LastName { get; set; }
        public string? Password { get; set; }
    }
}
