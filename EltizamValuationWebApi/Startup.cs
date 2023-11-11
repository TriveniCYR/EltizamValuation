using Eltizam.Business.Core.Interface;
using Eltizam.Business.Core.ServiceImplementations;
using Eltizam.Utility;
using Eltizam.WebApi.Filter;

namespace Eltizam.WebApi
{
    public class Startup
    {
        public Startup(IConfiguration configuration)
        {
            Configuration = configuration;
        }

        public IConfiguration Configuration { get; }

        public void ConfigureServices(IServiceCollection services)
        {
            DatabaseConnection.ConnString = Configuration.GetSection("ConnectionStrings:ConnectionString").Value;

            services.AddScoped<IMasterUserService, MasterUserService>();

            services.AddControllers(options =>
            {
                options.Filters.Add(typeof(ExceptionFilter));
            }).AddJsonOptions(options =>
            {
                options.JsonSerializerOptions.WriteIndented = true;
            }).AddNewtonsoftJson();

            //services.AddResource();//me
        }
    }
}
