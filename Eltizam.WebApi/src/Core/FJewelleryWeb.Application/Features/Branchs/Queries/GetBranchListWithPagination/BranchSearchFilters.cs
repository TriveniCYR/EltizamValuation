using ValuationWeb.Application.Features.GloblaFilters;
using ValuationWeb.Application.Responses;
using MediatR;
using System.Collections.Generic;

namespace ValuationWeb.Application.Features.Branchs.Queries.GetBranchListWithPagination
{
    public class BranchSearchFilters : GlobalSeachFilter, IRequest<Response<GlobalSeachResponse>>
    {
        public bool? IsActive { get; set; }
        public string? Letter { get; set; }
        public int? Id { get; set; }
    } 
}
