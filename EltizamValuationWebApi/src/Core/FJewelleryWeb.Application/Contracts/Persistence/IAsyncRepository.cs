﻿using System;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace ValuationWeb.Application.Contracts.Persistence
{
    public interface IAsyncRepository<T> where T : class
    {
        Task<T> GetByIdAsync(Guid id);
        Task<IReadOnlyList<T>> ListAllAsync();
        Task<T> AddAsync(T entity);
        Task UpdateAsync(T entity);
        Task DeleteAsync(T entity);
        Task<IReadOnlyList<T>> GetPagedReponseAsync(int page, int size); 
        Task<T> GetByIdAsync(int id);
        string GenerateAccountId(string tableName, int tableKey, int? branchId);
    }
}
