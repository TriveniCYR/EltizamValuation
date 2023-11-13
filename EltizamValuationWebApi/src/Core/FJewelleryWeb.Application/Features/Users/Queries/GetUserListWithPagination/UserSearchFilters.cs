using ValuationWeb.Application.Features.GloblaFilters;
using ValuationWeb.Application.Responses;
using MediatR;
using System.Collections.Generic;

namespace ValuationWeb.Application.Features.Users.Queries.GetUserListWithPagination
{
    public class UserSearchFilters : GlobalSeachFilter, IRequest<Response<GlobalSeachResponse>>
    {
        public int? RoleId { get; set; }
        public byte? BranchId { get; set; }
        public bool? IsActive { get; set; }
        public string? Letter { get; set; }
        public int? Id { get; set; }
    } 
}
