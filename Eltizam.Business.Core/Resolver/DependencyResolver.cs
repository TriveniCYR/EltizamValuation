using Eltizam.Business.Core.Implementation;
using Eltizam.Business.Core.Interface;
using Eltizam.Business.Core.ModelMapper;
using Eltizam.Data.DataAccess.Core.Repositories;
using Eltizam.Data.DataAccess.Core.UnitOfWork;

using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.DependencyInjection;
using Eltizam.Business.Core.ServiceImplementations;
using Eltizam.Data.DataAccess.DataContext;

namespace Eltizam.Business.Core.Resolver
{
    public static class DependencyResolver
    {
        public static IServiceCollection ContainerResolver(this IServiceCollection services)
        {
            services.AddTransient<IMasterQualificationServices, MasterQualificationServices>();
            services.AddTransient<IMasterPropertyService, MasterPropertyService>();
            services.AddTransient<IMasterPropertyTypeService, MasterPropertyTypeService>();
            services.AddTransient<IMasterPropertySubTypeService, MasterPropertySubTypeService>();
            services.AddTransient<IMasterVendorService, MasterVendorService>();
            services.AddScoped<DbContext, EltizamDB_DevContext>();
            services.AddScoped<IMapperFactory, MapperFactory>();
            services.AddScoped<IUnitOfWork, UnitOfWork>();
            services.AddScoped(typeof(IRepository<>), typeof(Repository<>));
                       
            services.AddTransient<IMasterRoleService, MasterRoleService>();
            services.AddTransient<IMasterRoleModulePermission, MasterRoleModulePermissionService>();
            //services.AddTransient<IUserService, UserService>();
            services.AddTransient<IMasterRoleService, MasterRoleService>();
            services.AddTransient<IMasterUserService, MasterUserService>();
            services.AddTransient<IMasterCityService, MasterCityService>();
            services.AddTransient<IMasterStateService, MasterStateService>();
            services.AddTransient<IMasterCountryService, MasterCountryService>();
            services.AddTransient<IMasterDepartmentService, MasterDepartmentService>();
            services.AddTransient<IMasterDesignationService, MasterDesignationService>();
            services.AddTransient<IMasterOwnershipTypeService, MasterOwnershipTypeService>();
            services.AddTransient<IMasterValuationFeesService, MasterValuationFeesService>();
            services.AddTransient<IMasterValuationFeeTypeService, MasterValuationFeeTypeService>();
            services.AddTransient<IMasterLocationService, MasterLocationService>();
            services.AddTransient<IMasterModuleService, MasterModuleService>();
            services.AddTransient<IMasterClientService, MasterClientService>();
            services.AddTransient<IMasterClientTypeService, MasterClientTypeService>();
            services.AddTransient<IMasterDictionaryService, MasterDictionaryService>();
            

            services.AddTransient<IHelper, Helper>();
           
            services.AddTransient<IExceptionService, ExceptionService>();
            services.AddTransient<IUploadService, UploadService>();

            return services;
        }

    }
}
