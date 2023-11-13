using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.Logging;
using System.Data;
using ValuationWeb.Application.Contracts.Persistence;
using ValuationWeb.Domain.Entities;
using ValuationWeb.Persistence.Helper;

namespace ValuationWeb.Persistence.Repositories
{
    public class RefreshTokenRepository:  BaseRepository<RefreshToken>, IRefreshTokenRepository
    {
        private readonly ILogger _logger;
        private string _dbConnection;
        protected IConfiguration _configuration;
        public RefreshTokenRepository(ValuationDbContext dbContext, ILogger<RefreshToken> logger, IConfiguration configuration) : base(dbContext, logger)
        {
            _logger = logger;
            _configuration = configuration;
            _dbConnection = _configuration[ApplicationHelper.ConnectionStringkey];
        }

        /// <summary>
        /// Added By Pradnesh Raut on 08/22/2022
        /// To get Refresh token record by Token
        /// </summary>
        /// <param name="token"></param>
        /// <returns></returns>
        public async Task<RefreshToken> GetRefreshTokenByToken(string token)
        {
            DbParameter[] dbParameters = {
                new DbParameter("token", token, FieldTypeEnum.FieldTypeVarchar)               
            };

            var refreshToken = FJDBHelper.ExecuteMappedReader<RefreshToken>(SQLMetaStore.RefreshToken_GetDetailsbyToken, _dbConnection,
                        CommandType.StoredProcedure, dbParameters).FirstOrDefault();

            _logger.LogInformation("Success: GetRefreshTokenByToken method executed successfully.");         
            
            return refreshToken;
        }
    }
}
