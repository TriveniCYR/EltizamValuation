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

			services.AddScoped<IDashboardService, DashboardService>();
			services.AddScoped<IMasterLocationService, MasterLocationService>();
			services.AddScoped(typeof(IAsyncRepository<>), typeof(BaseRepository<>));
            services.AddScoped<IBranchRepository, BranchRepository>();
            //services.AddScoped<IUserRepository, UserRepository>();
            services.AddScoped<IMasterCityRepository, MasterCityRepository>();
            services.AddScoped<IMasterCityService, MasterCityService>();
            services.AddScoped<IMasterCountryService, MasterCountryService>();
            services.AddScoped<IMasterStateService, MasterStateService>();
            services.AddScoped<IMasterDepartmentService, MasterDepartmentService>();
            services.AddScoped<IMasterDesignationService, MasterDesignationService>();
            services.AddScoped<IRefreshTokenRepository, RefreshTokenRepository>();
            services.AddTransient<IMasterUserService, MasterUserService>();
            services.AddTransient<IMasterDictionaryService, MasterDictionaryService>();
            services.AddScoped<IRefreshTokenRepository, RefreshTokenRepository>();
            services.AddTransient<IMasterClientService, MasterClientService>();
            services.AddTransient<IMasterClientTypeService, MasterClientTypeService>();
            services.AddTransient<IMasterVendorService, MasterVendorService>();
            services.AddTransient<IMasterRoleService, MasterRoleService>();
            services.AddTransient<IMasterRoleModulePermission, MasterRoleModulePermissionService>();
            services.AddSingleton<IMemoryCache, MemoryCache>();
            services.AddTransient<IMasterModuleService, MasterModuleService>();
            services.AddTransient<IValuationRequestService, ValuationRequestService>();
            services.AddTransient<IMasterValuationFeesService, MasterValuationFeesService>();
            services.AddTransient<IMasterValuationFeeTypeService, MasterValuationFeeTypeService>();
            services.AddTransient<IMasterPropertyService, MasterPropertyService>();
            services.AddTransient<IMasterPropertyTypeService, MasterPropertyTypeService>();
            services.AddTransient<IMasterPropertySubTypeService, MasterPropertySubTypeService>();
            services.AddTransient<IValuationRequestStatusService, ValuationRequestStatusService>();
            services.AddTransient<IValuationQuatationService, ValuationQuatationService>();
            services.AddTransient<IValuationInvoiceService, ValuationInvoiceService>();
            services.AddTransient<IMasterOwnershipTypeService, MasterOwnershipTypeService>();
            services.AddTransient<IAuditLogService, AuditLogService>();
            services.AddTransient<IValuationAssessmentService, ValuationAssessmentService>();
            services.AddTransient<IMasterNotificationService, MasterNotificationService>();
            services.AddTransient<IFileUploadService, FileUploadService>();
            services.AddTransient<IMasterApproverLevelService, MasterApproverLevelService>();
            return services;
        }
    }
}
