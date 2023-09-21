using Eltizam.Business.Core.Implementation;
using Eltizam.Business.Core.Interface;
using Eltizam.Business.Core.ModelMapper;
using Eltizam.Data.DataAccess.Core.Repositories;
using Eltizam.Data.DataAccess.Core.UnitOfWork;
using Eltizam.Data.DataAccess.DataContext;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.DependencyInjection;
using Eltizam.Business.Core.ServiceImplementations;

namespace Eltizam.Business.Core.Resolver
{
    public static class DependencyResolver
    {
        public static IServiceCollection ContainerResolver(this IServiceCollection services)
        {
            services.AddScoped<DbContext, EltizamDevContext>();
            services.AddScoped<IMapperFactory, MapperFactory>();
            services.AddScoped<IUnitOfWork, UnitOfWork>();
            services.AddScoped(typeof(IRepository<>), typeof(Repository<>));
                       
           // services.AddTransient<IMasterRoleService, MasterRoleService>();
            services.AddTransient<IUserService, UserService>();
            services.AddTransient<IMasterUserService, MasterUserService>();
            services.AddTransient<IDepartmentService, DepartmentService>();
            services.AddTransient<IDesignationService, DesignationService>();
			services.AddTransient<IMasterModuleService, MasterModuleService>();
			
            services.AddTransient<IHelper, Helper>();
           
            services.AddTransient<IExceptionService, ExceptionService>();
            services.AddTransient<IUploadService, UploadService>();

            return services;
        }

    }
}
