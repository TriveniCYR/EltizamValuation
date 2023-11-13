using ValuationWeb.Application.Features.Branchs.Queries.GetBranchDetail;
using ValuationWeb.Application.Features.Branchs.Queries.GetBranchListWithPagination;
using ValuationWeb.Application.Features.GloblaFilters;
using ValuationWeb.Domain.Entities;
using ValuationWeb.Domain.ViewModel;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace ValuationWeb.Application.Contracts.Persistence
{
    public interface IBranchRepository : IAsyncRepository<Branch>
    {
        Task<List<Branch>> GetBranchesWithEvents(bool includePassedEvents);
        //Task<Branch> AddBranch(Branch category);

        Task<GlobalSeachResponse> GetBranchListWithPaginationGlobal(BranchSearchFilters searchBranch);

        Task<BranchDetailViewModel> GetBranchDetails(GetBranchDetailQuery branchDetail);

        Task<Branch> GetBranchByName(string name);
    }
}
