using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Logging;
using ValuationWeb.Application.Contracts.Persistence;
using ValuationWeb.Persistence.Helper;

namespace ValuationWeb.Persistence.Repositories
{
    public class BaseRepository<T> : IAsyncRepository<T> where T : class
    {
        protected readonly ValuationDbContext _dbContext;
        private readonly ILogger _logger;
        public BaseRepository(ValuationDbContext dbContext, ILogger<T> logger)
        {
            _dbContext = dbContext; _logger = logger;
        }

        public virtual async Task<T?> GetByIdAsync(int id)
        {
            return await _dbContext.Set<T>().FindAsync(id);
        }

        public async Task<IReadOnlyList<T>> ListAllAsync()
        {
            _logger.LogInformation("ListAllAsync Initiated");
            return await _dbContext.Set<T>().ToListAsync();
        }

        public async virtual Task<IReadOnlyList<T>> GetPagedReponseAsync(int page, int size)
        {
            return await _dbContext.Set<T>().Skip((page - 1) * size).Take(size).AsNoTracking().ToListAsync();
        }

        public async Task<T> AddAsync(T entity)
        {
            await _dbContext.Set<T>().AddAsync(entity);
            await _dbContext.SaveChangesAsync();

            return entity;
        }

        /// <summary>
        /// Changes by YReddy on 08/17/2022
        /// Class used to take care for Update entity  
        /// </summary>
        /// <param name="entity"></param>
        /// <returns></returns>
        public async Task UpdateAsync(T entity)
        {
            //Add this line for resolving update entity issue
            _dbContext.ChangeTracker.Clear();

            _dbContext.Entry(entity).State = EntityState.Modified;
            await _dbContext.SaveChangesAsync();
        }

        public async Task DeleteAsync(T entity)
        {
            _dbContext.Set<T>().Remove(entity);
            await _dbContext.SaveChangesAsync();
        }
         
        public virtual async Task<T> GetByIdAsync(Guid id)
        {
            return await _dbContext.Set<T>().FindAsync(id);
        }



        #region Generate Account numbers for entities

        /// <summary>
        /// Added by Neeraj on 09/26/2022 for generating Account numbers
        /// </summary>
        /// <param name="tableName"></param>
        /// <param name="tableKey"></param>
        /// <param name="branchId"></param>
        /// <returns></returns>
        public string GenerateAccountId(string tableName, int tableKey, int? branchId)
        {
            string AccountId = "";
            string randomNumber = new Random().Next(Int32.MaxValue).ToString().Substring(0, 4);

            switch (tableName)
            {
                case ApplicationConstants.Branch:
                case ApplicationConstants.Supplier:
                    {
                        AccountId = CoerceValue(tableKey.ToString(), 3) + ApplicationConstants.Dateformat1 + randomNumber;
                        break;
                    }
                case ApplicationConstants.Customer:
                case ApplicationConstants.User:
                    {
                        AccountId = CoerceValue(tableKey.ToString(), 3) + CoerceValue(branchId.ToString(), 3, true) + ApplicationConstants.Dateformat1;
                        break;
                    }
            }

            return AccountId;
        }

        private string CoerceValue(string Value, int length, bool canTrim = false)
        {
            if (Value == null)
                return "0".PadLeft(length, '0');

            else if (Value.Length >= 3 && canTrim)
                return Value.Substring(0, length);
            else
                return Value.PadLeft(length, '0');
        }

        #endregion
    }
}
