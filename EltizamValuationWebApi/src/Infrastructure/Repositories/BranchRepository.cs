using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.Logging;
using System.Data;
using ValuationWeb.Application.Contracts.Persistence;
using ValuationWeb.Application.Features.Branchs.Queries.GetBranchDetail;
using ValuationWeb.Application.Features.Branchs.Queries.GetBranchListWithPagination;
using ValuationWeb.Application.Features.GloblaFilters;
using ValuationWeb.Domain.Entities;
using ValuationWeb.Domain.ViewModel;
using ValuationWeb.Persistence.Helper;
using DbParameter = ValuationWeb.Persistence.Helper.DbParameter;

namespace ValuationWeb.Persistence.Repositories
{
    public class BranchRepository : BaseRepository<Branch>, IBranchRepository
    {
        private readonly ILogger _logger;
        //Connection string changes
        protected IConfiguration _configuration;
        private string _dbConnection;
        public BranchRepository(ValuationDbContext dbContext, ILogger<Branch> logger, IConfiguration configuration) : base(dbContext, logger)
        {
            _logger = logger;
            //Connection string changes
            _configuration = configuration;
            _dbConnection = _configuration[ApplicationHelper.ConnectionStringkey];
        }

        public async Task<List<Branch>> GetBranchesWithEvents(bool includePassedEvents)
        {
            _logger.LogInformation("GetCategoriesWithEvents Initiated");
            var allBranches = await _dbContext.Set<Branch>().Include(x => x.Address).ToListAsync();
            //if(!includePassedEvents)
            //{
            //    allCategories.ForEach(p => p.Events.ToList().RemoveAll(c => c.Date < DateTime.Today));
            //}
            _logger.LogInformation("GetCategoriesWithEvents Completed");
            return allBranches;
        }

        //public async Task<Branch> AddBranch(Branch category)
        //{ 
        //    return category;
        //}

        /// <summary>
        /// Added by Sharanaiyya Swami  on 22/08/2022
        /// Method used to get all branch related information depends on input
        /// </summary>
        /// <param name="userDetail"></param>
        /// <returns></returns>
        public async Task<BranchDetailViewModel> GetBranchDetails(GetBranchDetailQuery branchDetail)
        {
            DbParameter[] dbParameters = 
            {
                new DbParameter("Id", branchDetail.Id, FieldTypeEnum.FieldTypeInteger),
                new DbParameter("Name", branchDetail.Name, FieldTypeEnum.FieldTypeVarchar),
                new DbParameter("IsActive", branchDetail.status, FieldTypeEnum.FieldTypeBoolean)
            };

            var branchDetails = FJDBHelper.ExecuteMappedReader<BranchDetailViewModel>(SQLMetaStore.Branch_GetBranchDetails, _dbConnection,
                        CommandType.StoredProcedure, dbParameters)
                        .FirstOrDefault();

            _logger.LogInformation("Success: GetBranchDetails method executed successfully.");
            return branchDetails;
        }


        /// <summary>
        /// Added by Sharanaiyya Swami  on 22/08/2022
        /// To deactive branch by email
        /// </summary>
        /// <param name="email"></param>
        /// <returns></returns>
        public async Task<Branch> DeactivateBranch(int Id)
        {
            var branch = await _dbContext.Set<Branch>().Where(x => x.Id == Id).FirstOrDefaultAsync();
            //branch.State = 0;
            await UpdateAsync(branch);

            _logger.LogInformation("Success: DeactivateBranch method executed successfully.");
            return branch;
        }


        /// <summary>
        /// Added by Sharanaiyya Swami  on 22/08/2022
        /// Method is used to pull all branch details depends on filter values
        /// </summary>
        /// <param name="searchUser"></param>
        /// <returns></returns>
        public async Task<GlobalSeachResponse> GetBranchListWithPaginationGlobal(BranchSearchFilters searchBranch)
        {
            int _count;
            DbParameter[] dbParameters =
            {
                new DbParameter(ApplicationConstants.PageNumber, searchBranch.PageNumber, FieldTypeEnum.FieldTypeInteger),
                new DbParameter(ApplicationConstants.PageSize, searchBranch.PageSize, FieldTypeEnum.FieldTypeInteger),
                new DbParameter(ApplicationConstants.OrderClause, searchBranch.OrderClause, FieldTypeEnum.FieldTypeVarchar),
                new DbParameter(ApplicationConstants.ReverseSort, searchBranch.ReverseSort, FieldTypeEnum.FieldTypeVarchar),
                new DbParameter("IsActive", searchBranch.IsActive, FieldTypeEnum.FieldTypeBoolean),
                new DbParameter("Letter", searchBranch.Letter, FieldTypeEnum.FieldTypeVarchar)
            };

            //Call procedure with params and read respnose in Model
            var branchlist = FJDBHelper.ExecuteMappedReaderWithOutputParameter<BranchViewModel>(SQLMetaStore.Branch_SearchPageWise,
                           _dbConnection, out _count, CommandType.StoredProcedure, dbParameters);

            //Prepare model for output with response
            var response = new GlobalSeachResponse()
            {
                OrderClause = searchBranch.OrderClause,
                PageNumber = searchBranch.PageNumber,
                PageSize = searchBranch.PageSize,
                ReverseSort = searchBranch.ReverseSort,
                TotalRecords = _count,
                dataresults = branchlist
            };

            _logger.LogInformation("Success: GetBranchListWithPaginationGlobal method executed successfully.");
            return response;
        }

        /// <summary>
        /// Added by Sharanaiyya Swami  on 22/08/2022
        /// To get unique branch by name
        /// </summary>
        /// <param name="email"></param>
        /// <returns></returns>
        public async Task<Branch> GetBranchByName(string name)
        {
            var user = await _dbContext.Set<Branch>().Where(x => x.Name == name).FirstOrDefaultAsync();
            _logger.LogInformation("Success: GetUserByEmail method executed successfully.");

            return user;
        }
         
    }
     
}
