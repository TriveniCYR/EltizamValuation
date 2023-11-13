using Eltizam.Business.Core.Implementation;
using Eltizam.Business.Core.Interface;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Caching.Memory;
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

			services.AddScoped<IMasterLocationService, MasterLocationService>();
			services.AddScoped(typeof(IAsyncRepository<>), typeof(BaseRepository<>));
            services.AddScoped<IBranchRepository, BranchRepository>();
            //services.AddScoped<IUserRepository, UserRepository>();
            services.AddScoped<IMasterCityRepository, MasterCityRepository>();
            services.AddScoped<IMasterCityService, MasterCityService>();
            services.AddScoped<IRefreshTokenRepository, RefreshTokenRepository>();
            services.AddTransient<IMasterUserService, MasterUserService>();
            services.AddTransient<IMasterDictionaryService, MasterDictionaryService>();
            services.AddScoped<IRefreshTokenRepository, RefreshTokenRepository>();
            services.AddTransient<IMasterUserService, MasterUserService>();
            services.AddTransient<IMasterRoleService, MasterRoleService>();
            services.AddTransient<IMasterRoleModulePermission, MasterRoleModulePermissionService>();
            services.AddTransient<IMemoryCache, MemoryCache>();
            services.AddTransient<IMasterModuleService, MasterModuleService>();
            return services;
        }
    }
}
