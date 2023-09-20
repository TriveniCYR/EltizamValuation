
using Serilog;
using Eltizam.Web;

namespace EmcureNPD.Web
{
    public class Program
    {
        public static void Main(string[] args)
        {
            var config = new ConfigurationBuilder()
                 .AddJsonFile("appsettings.json")
                 .Build();

            try
            {
                Log.Logger = new LoggerConfiguration()
                    .ReadFrom.Configuration(config)
                    .CreateLogger();

                CreateHostBuilder(args).Build().Run();
            }
            catch
            {
            }
            finally
            {
                Log.CloseAndFlush();
            }

            var builder = WebApplication.CreateBuilder(args);

            builder.Services.AddRazorPages()
                .AddRazorRuntimeCompilation();
        }

        public static IHostBuilder CreateHostBuilder(string[] args) =>
            Host.CreateDefaultBuilder(args)
            .UseSerilog()
                .ConfigureWebHostDefaults(webBuilder =>
                {
                    webBuilder.UseStartup<Startup>();
                });
    }
}