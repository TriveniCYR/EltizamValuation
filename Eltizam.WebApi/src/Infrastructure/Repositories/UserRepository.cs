using Microsoft.Data.SqlClient;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.Logging;
using System.Data;
using ValuationWeb.Application.Contracts.Persistence;
using ValuationWeb.Application.Features.GloblaFilters; 
using ValuationWeb.Domain.Entities;
using ValuationWeb.Domain.ViewModel;
using ValuationWeb.Persistence.EncryptDecrypt;
using ValuationWeb.Persistence.Helper;

namespace ValuationWeb.Persistence.Repositories
{
    /// <summary>
    /// Added by YReddy on 08/15/2022
    /// Repository used to handle all user related repository actions in project
    /// </summary>
    public class UserRepository : BaseRepository<User>, IUserRepository
    {
        private readonly ILogger _logger;
        //Connection string changes
        protected IConfiguration _configuration;
        private string _dbConnection;

        public UserRepository(ValuationDbContext dbContext, ILogger<User> logger, IConfiguration configuration) : base(dbContext, logger)
        {
            _logger = logger;

            //Connection string changes
            _configuration = configuration;
            _dbConnection = _configuration[ApplicationHelper.ConnectionStringkey];
        }

        /// <summary>
        /// Added by YReddy on 08/15/2022
        /// Method used to get all user related information depends on input
        /// </summary>
        /// <param name="userDetail"></param>
        /// <returns></returns>
        public async Task<UserDetailViewModel> GetUserDetails(GetUserDetailQuery userDetail)
        {
            if(!String.IsNullOrEmpty(userDetail.Password))
            {
                userDetail.Password = EncryptionDecryption.EncryptString(userDetail.Password);
            }
            DbParameter[] dbParameters = { 
                new DbParameter(ApplicationConstants.Id, userDetail.Id, FieldTypeEnum.FieldTypeInteger),
                new DbParameter("LastName", userDetail.LastName, FieldTypeEnum.FieldTypeVarchar),
                new DbParameter("Email", userDetail.Email, FieldTypeEnum.FieldTypeVarchar),
                new DbParameter("Password", userDetail.Password, FieldTypeEnum.FieldTypeVarchar),
                new DbParameter(ApplicationConstants.IsActive, userDetail.status, FieldTypeEnum.FieldTypeBoolean)
            };

            var user =  FJDBHelper.ExecuteMappedReader<UserDetailViewModel>(SQLMetaStore.User_GetUserDetails, _dbConnection,
                        CommandType.StoredProcedure, dbParameters)
                        .FirstOrDefault();

            _logger.LogInformation(ApplicationConstants.successMessage, "GetUserDetails");
            return user;
        } 

        /// <summary>
        /// Added By Pradnesh Raut on 08/12/2022
        /// Get user by email and password
        /// </summary>
        /// <param name="email"></param>
        /// <param name="password"></param>
        /// <returns></returns>
        public async Task<User> GetUserByEmailPassword(string email, string password)
        {
            password = EncryptionDecryption.EncryptString(password);
            var result =  await _dbContext.Set<User>().Where(x => x.Email == email && x.Password == password).FirstOrDefaultAsync();

            _logger.LogInformation(ApplicationConstants.successMessage, "GetUserByEmailPassword"); 
            return result;
        }

        /// <summary>
        /// Added By Pradnesh Raut on 08/12/2022
        /// Calling update password proc for password update of user
        /// </summary>
        /// <param name="id">user id of which password needs to be updated</param>
        /// <param name="password">password to be updated</param>
        /// <returns></returns>
        public async Task<int> UpdateUserPassword(int id, string password)
        {
            password = EncryptionDecryption.EncryptString(password);
            var pId = new SqlParameter("@id", id);
            var pPassword = new SqlParameter("@password", password);
            int recordCount = await _dbContext.Database.ExecuteSqlRawAsync(SQLMetaStore.User_UpdatePassword + " @id, @password", pId, pPassword);

            _logger.LogInformation(ApplicationConstants.successMessage, "UpdateUserPassword"); 
            return recordCount;
        } 

        /// <summary>
        /// Added By Pradnesh Raut on 08/12/2022
        /// To get user by email
        /// </summary>
        /// <param name="email"></param>
        /// <returns></returns>
        public async Task<User> GetUserByEmail(string email)
        { 
            var user = await _dbContext.Set<User>().Where(x => x.Email == email).FirstOrDefaultAsync();

            _logger.LogInformation(ApplicationConstants.successMessage, "GetUserByEmail"); 
            return user;
        } 

        /// <summary>
        /// Added by YReddy on 08/12/2022 
        /// Method is used to pull all user details depends on filter values
        /// </summary>
        /// <param name="searchUser"></param>
        /// <returns></returns>
        public async Task<GlobalSeachResponse> GetUserListWithPaginationGlobal(UserSearchFilters searchUser)
        {
            int _count;
            DbParameter[] dbParameters =
            {
                new DbParameter(ApplicationConstants.PageNumber, searchUser.PageNumber, FieldTypeEnum.FieldTypeInteger),
                new DbParameter(ApplicationConstants.PageSize, searchUser.PageSize, FieldTypeEnum.FieldTypeInteger),
                new DbParameter(ApplicationConstants.OrderClause, searchUser.OrderClause, FieldTypeEnum.FieldTypeVarchar),
                new DbParameter(ApplicationConstants.ReverseSort, searchUser.ReverseSort, FieldTypeEnum.FieldTypeVarchar),
                new DbParameter(ApplicationConstants.RoleId, searchUser.RoleId, FieldTypeEnum.FieldTypeInteger),
                new DbParameter(ApplicationConstants.BranchId, searchUser.BranchId, FieldTypeEnum.FieldTypeInteger), 
                new DbParameter(ApplicationConstants.IsActive, searchUser.IsActive, FieldTypeEnum.FieldTypeBoolean),
                new DbParameter(ApplicationConstants.Letter, searchUser.Letter, FieldTypeEnum.FieldTypeVarchar) 
            };

            //Call procedure with params and read respnose in Model
            var userlist = FJDBHelper.ExecuteMappedReaderWithOutputParameter<UserViewModel>(SQLMetaStore.User_SearchPageWise,
                           _dbConnection, out _count, CommandType.StoredProcedure, dbParameters);

            //Prepare model for output with response
            var response = new GlobalSeachResponse()
            {
                OrderClause = searchUser.OrderClause,
                PageNumber = searchUser.PageNumber,
                PageSize = searchUser.PageSize,
                ReverseSort = searchUser.ReverseSort,
                TotalRecords = _count,
                dataresults = userlist
            };

            _logger.LogInformation(ApplicationConstants.successMessage, "GetUserListWithPaginationGlobal");
            return response;
        }

        /// <summary>
        /// Added by YReddy on 08/15/2022 
        /// Used to generate encrypt password from plain value
        /// </summary>
        /// <param name="inputValue"></param>
        /// <returns></returns>
        public async Task<string> GetEncryptPassword(string inputValue)
        {
            var val = EncryptionDecryption.EncryptString(inputValue);

            _logger.LogInformation(ApplicationConstants.successMessage, "GetEncryptPassword");
            return val;
        }

        /// <summary>
        /// Added by YReddy on 08/15/2022 
        /// Used to generate original value from encrypt value
        /// </summary>
        /// <param name="decryptValue"></param>
        /// <returns></returns>
        public async Task<string> GetDecryptedTextFromPassword(string decryptValue)
        {
            var val = EncryptionDecryption.DecryptString(decryptValue);

            _logger.LogInformation(ApplicationConstants.successMessage, "GetDecryptedTextFromPassword");
            return val;
        }

        /// <summary>
        /// Added by YReddy on 08/18/2022 
        /// Used to get User by ID 
        /// </summary>
        /// <param name="Id"></param>
        /// <returns></returns>
        public async Task<UserDetailViewModel> GetUserDetailsById(int Id)
        {
            var model = new GetUserDetailQuery()
            {
                Id = Id
            }; 
            
            //Get User details
            var user = await GetUserDetails(model);

            _logger.LogInformation(ApplicationConstants.successMessage, "GetUserDetailsById");
            return user;
        }

        /// <summary>
        /// Added By Pradnesh Raut on 08/17/2022
        /// Function to set forgot password token and set the forgot password token
        /// </summary>
        /// <param name="id"></param>
        /// <param name="password"></param>
        /// <returns></returns>
        public async Task<int> SetForgotPassword(int id, string ForgotPasswordToken)
        {            
            var pId = new SqlParameter("@id", id);
            var pForgotpasswordtoken = new SqlParameter("@forgotpasswordtoken", ForgotPasswordToken);
            int recordCount = await _dbContext.Database.ExecuteSqlRawAsync(SQLMetaStore.User_ResetPassword + " @id, @forgotpasswordtoken", pId, pForgotpasswordtoken);

            _logger.LogInformation(ApplicationConstants.successMessage, "SetForgotPassword");
            return recordCount;
        }

        /// <summary>
        /// /// Added by Sharanaiyya Swami  on 17/08/2022
        /// For Getting Account number for user data 
        /// </summary>
        /// <param name="request"></param>
        /// <returns></returns>
        public async Task<string> UpsertUserAccountDetails(User request)
        {
            //Generate account 
            var AccountNum = GenerateAccountId(ApplicationConstants.User, request.Id, request.BranchId);
            DbParameter[] dbParameters = 
            {
                new DbParameter(ApplicationConstants.UserId, request.Id, FieldTypeEnum.FieldTypeInteger),
                new DbParameter(ApplicationConstants.BranchId, request.BranchId, FieldTypeEnum.FieldTypeInteger),
                new DbParameter(ApplicationConstants.AccountNumber, AccountNum, FieldTypeEnum.FieldTypeVarchar),
                new DbParameter(ApplicationConstants.RoleId, request.RoleId, FieldTypeEnum.FieldTypeInteger), 
                new DbParameter(ApplicationConstants.CreatedBy, request.ModifiedBy, FieldTypeEnum.FieldTypeInteger)
            };

            FJDBHelper.ExecuteReader(SQLMetaStore.User_UpsertUserBankAccount, _dbConnection, 
            reader =>
            {
                AccountNum = reader.GetValue<string>(ApplicationConstants.AccountNumber);
            },
            CommandType.StoredProcedure, dbParameters);

            _logger.LogInformation(ApplicationConstants.successMessage, "UpsertUserBankAccountDetails");
            return AccountNum;
        }
    }
}