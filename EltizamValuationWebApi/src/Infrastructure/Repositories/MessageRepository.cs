using ValuationWeb.Application.Contracts.Infrastructure;
using ValuationWeb.Application.Contracts.Persistence;
using ValuationWeb.Domain.Entities;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Logging;

namespace ValuationWeb.Persistence.Repositories
{
    //public class MessageRepository : BaseRepository<Message>, IMessageRepository
    //{
    //    private readonly string cacheKey = $"{typeof(Message)}";
    //    private readonly ILogger _logger;
    //    private readonly ICacheService _cacheService;
    //    public MessageRepository(FJewelleryDbContext dbContext, ILogger<Message> logger, ICacheService cacheService) : base(dbContext, logger)
    //    {
    //        _logger = logger;
    //        _cacheService = cacheService;
    //    }

    //    public async Task<Message> GetMessage(string Code, string Lang)
    //    {
    //        _logger.LogInformation("GetAllNotifications Initiated");
    //        if (!_cacheService.TryGet(cacheKey, out IReadOnlyList<Message> cachedList))
    //        {
    //            cachedList = await _dbContext.Set<Message>().ToListAsync();
    //            _cacheService.Set(cacheKey, cachedList);
    //        }
    //        _logger.LogInformation("GetAllNotifications Completed");
    //        return cachedList.FirstOrDefault(x => x.Code == Code && x.Language == Lang);
    //    }
    //}
}
