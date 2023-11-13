using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using System.Diagnostics.CodeAnalysis;
using ValuationWeb.Application.Contracts.Persistence;
using ValuationWeb.Persistence.Repositories;

namespace ValuationWeb.Persistence
{
    public static class PersistenceServiceRegistration
    {

        [ExcludeFromCodeCoverage]
        public static IServiceCollection AddPersistenceServices(this IServiceCollection services, IConfiguration configuration)
        {
            var dbProvider = configuration.GetValue<string>("dbProvider");

            switch (dbProvider)
            {
                case "MSSQL":
                    services.AddDbContext<ValuationDbContext>(options =>
                        options.UseSqlServer(configuration.GetConnectionString("EltizamDBConn")));
                    break;               
                default:
                    break;
            }

            services.AddScoped(typeof(IAsyncRepository<>), typeof(BaseRepository<>));
            services.AddScoped<IBranchRepository, BranchRepository>();
            services.AddScoped<IUserRepository, UserRepository>();
            services.AddScoped<IMasterCityRepository, MasterCityRepository>();
            services.AddScoped<IRefreshTokenRepository, RefreshTokenRepository>(); 

            return services;
        }
    }
}
