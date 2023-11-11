using Eltizam.WebApi.Helpers.Response;
using Eltizam.WebApi.Middlewares;
using Eltizam.WebApi.SwaggerHelper;
using Microsoft.AspNetCore.DataProtection;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc.ApiExplorer;
using Microsoft.Extensions.Options;
using Serilog;
using Swashbuckle.AspNetCore.SwaggerGen;
using ValuationWeb.Api.Extensions;
using ValuationWeb.Application;
using ValuationWeb.Identity.Models;
using ValuationWeb.Persistence;

var builder = WebApplication.CreateBuilder(args);


//SERILOG IMPLEMENTATION 
IConfiguration configurationBuilder = new ConfigurationBuilder()
    .AddJsonFile("appsettings.json", optional: false, reloadOnChange: true)
    .AddJsonFile(
        $"appsettings.{Environment.GetEnvironmentVariable("ASPNETCORE_ENVIRONMENT")}.json",
        optional: true)
    .Build();

Log.Logger = new LoggerConfiguration()
    .ReadFrom.Configuration(configurationBuilder)
    .CreateBootstrapLogger().Freeze();

new LoggerConfiguration()
    .ReadFrom.Configuration(configurationBuilder)
    .CreateLogger();

builder.Host.UseSerilog((ctx, lc) => lc
        .WriteTo.Console()
        .ReadFrom.Configuration(ctx.Configuration));


IConfiguration Configuration = builder.Configuration;
string MyAllowSpecificOrigins = "_myAllowSpecificOrigins";

var services = builder.Services;

string Urls = Configuration.GetSection("URLWhiteListings").GetSection("URLs").Value;
services.AddCors(options =>
{
    //Changes by YReddy for whitelisting all incoming requests
    options.AddPolicy(name: MyAllowSpecificOrigins,
        builder =>
        {
            builder//.WithOrigins(Urls)
            .AllowAnyOrigin()
            .AllowAnyHeader()
            .AllowAnyMethod();
        });
});

services.AddApplicationServices();

services.AddSingleton<IHttpContextAccessor, HttpContextAccessor>();
//services.AddScoped<IExceptionService, ExceptionService>(); 
//services.AddScoped<UnitOfWork>();
services.AddScoped(typeof(IResponseHandler<>), typeof(ResponseHandler<>));

// services.AddInfrastructureServices(Configuration);
services.AddPersistenceServices(Configuration);
//services.AddIdentityServices(Configuration);
services.AddSwaggerExtension();
services.AddSwaggerVersionedApiExplorer();
services.AddTransient<IConfigureOptions<SwaggerGenOptions>, ConfigureSwaggerOptions>();
services.AddSwaggerGen(options => options.OperationFilter<SwaggerDefaultValues>());
services.AddControllers();
services.AddControllers().AddNewtonsoftJson();
services.AddDataProtection()
    .PersistKeysToFileSystem(new DirectoryInfo(@"bin\debug\configuration"));



//services.AddScoped<IMasterCityService, MasterCityService>();
//builder.Services.AddTransient<IMasterCityService, MasterCityService>();

builder.Services.AddSwaggerGen();
builder.Services.AddControllers();

 

// Learn more about configuring Swagger/OpenAPI at https://aka.ms/aspnetcore/swashbuckle
builder.Services.AddEndpointsApiExplorer();
var app = builder.Build();

//app.Services.GetService<MasterCityService>();
//app.Services.GetService<ExceptionService>();

using (var scope = app.Services.CreateScope())
{
    try
    {
        Log.Information("Application Starting");
        var userManager = scope.ServiceProvider.GetService<UserManager<ApplicationUser>>();
    }
    catch (Exception ex)
    {
        Log.Warning(ex, "An error occured while starting the application");
    }
}

// Configure the HTTP request pipeline.
app.UseHttpsRedirection();

app.UseAuthentication();

app.UseSwagger();

// Enable middleware to serve swagger-ui (HTML, JS, CSS, etc.),  
// specifying the Swagger JSON endpoint.  
IApiVersionDescriptionProvider provider = app.Services.GetRequiredService<IApiVersionDescriptionProvider>();

app.UseSwaggerUI(
options =>
{
    // build a swagger endpoint for each discovered API version  
    foreach (var description in provider.ApiVersionDescriptions)
    {
        options.SwaggerEndpoint($"/swagger/{description.GroupName}/swagger.json", description.GroupName.ToUpperInvariant());
    }
});

app.UseCustomExceptionHandler();



//app.UseCors("Open");
app.UseCors(x => x.AllowAnyOrigin()
                .AllowAnyMethod()
                .AllowAnyHeader());

app.UseAuthorization();

app.MapControllers();



app.Run();

//For Integration test
public partial class Program { }
