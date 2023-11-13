using ValuationWeb.Application.Contracts.Persistence;
using ValuationWeb.Application.Features.GloblaFilters;
using ValuationWeb.Application.Features.Users.Commands.CreateUser;
using ValuationWeb.Application.Features.Users.Commands.UpdateUser;
using ValuationWeb.Application.Features.Users.Queries.GetUserDetail;
using ValuationWeb.Application.Features.Users.Queries.GetUserListWithPagination;
using ValuationWeb.Domain.Entities;
using ValuationWeb.Domain.ViewModel;
using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;

namespace ValuationWeb.Application.Contracts.Persistence
{
    public interface IUserRepository : IAsyncRepository<User>
    { 
        Task<User> GetUserByEmailPassword(string email, string password);
        Task<User> GetUserByEmail(string email);

        Task<int> UpdateUserPassword(int id, string password);

        Task<string> GetEncryptPassword(string inputValue);

        Task<string> GetDecryptedTextFromPassword(string decryptValue);

        Task<GlobalSeachResponse> GetUserListWithPaginationGlobal(UserSearchFilters searchUser);

        Task<UserDetailViewModel> GetUserDetails(GetUserDetailQuery userDetail);
        Task<UserDetailViewModel> GetUserDetailsById(int Id);

        Task<int> SetForgotPassword(int id, string ForgotPasswordToken);

        Task<string> UpsertUserAccountDetails(User request);
    }
}
