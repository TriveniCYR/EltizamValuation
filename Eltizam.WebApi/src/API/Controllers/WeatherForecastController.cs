using Eltizam.WebApi.Filters;
using Microsoft.AspNetCore.Mvc;

namespace Eltizam.WebApi.Controllers
{
    [ApiController]
    [AuthorizeAttribute]
    [ApiVersion("1")]
    [Route("api/v{version:apiVersion}/[controller]")]
    public class WeatherForecastController : ControllerBase
    {
        #region Properties

        //private readonly IConfiguration _configuration;
        //private readonly IResponseHandler<dynamic> _ObjectResponse;
       // private readonly IMasterUserService _MasterUserService;
       // private readonly IStringLocalizer<Errors> _stringLocalizerError;
        //private readonly IExceptionService _ExceptionService;
        //private readonly IHelper _helper;

        #endregion Properties
 

        private static readonly string[] Summaries = new[]
        {
            "Freezing", "Bracing", "Chilly", "Cool", "Mild", "Warm", "Balmy", "Hot", "Sweltering", "Scorching"
        };

        private readonly ILogger<WeatherForecastController> _logger;

        public WeatherForecastController(ILogger<WeatherForecastController> logger) //, IMasterUserService MasterUserService)
        {
            _logger = logger;
           // _MasterUserService = MasterUserService;
        }


        [HttpGet, Route("GetDateTime")]
        public DateTime GetDateTime()
        {
            return DateTime.Now;
        }

        [HttpGet, Route("GetWeatherForecast")]
        public IEnumerable<WeatherForecast> Get()
        {
            return Enumerable.Range(1, 5).Select(index => new WeatherForecast
            {
                Date = DateTime.Now.AddDays(index),
                TemperatureC = Random.Shared.Next(-20, 55),
                Summary = Summaries[Random.Shared.Next(Summaries.Length)]
            })
            .ToArray();
        }
    }
}
