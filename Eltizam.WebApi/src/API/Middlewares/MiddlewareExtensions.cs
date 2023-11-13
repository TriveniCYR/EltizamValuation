using Newtonsoft.Json;
using System.Net;
using ValuationWeb.Application.Exceptions;
using ValuationWeb.Application.Responses;


namespace Eltizam.WebApi.Middlewares
{
    public static class MiddlewareExtensions
    {
        public static IApplicationBuilder UseCustomExceptionHandler(this IApplicationBuilder builder)
        {
            return builder.UseMiddleware<ExceptionHandlerMiddleware>();
        }
    }

    public class ExceptionHandlerMiddleware
    {
        private readonly RequestDelegate _next;
        private readonly ILogger _logger;

        public ExceptionHandlerMiddleware(RequestDelegate next, ILogger<ExceptionHandlerMiddleware> logger)
        {
            _next = next; _logger = logger;
        }

        public async Task Invoke(HttpContext context)
        {
            try
            {
                await _next(context);
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, "", null);
                await ConvertException(context, ex);
            }
        }

        private Task ConvertException(HttpContext context, Exception exception)
        {
            HttpStatusCode httpStatusCode = HttpStatusCode.InternalServerError;

            context.Response.ContentType = "application/json";

            var result = string.Empty;

            switch (exception)
            {
                case ValidationException validationException:
                    httpStatusCode = HttpStatusCode.BadRequest;
                    result = GetErrorMessages(validationException.ValdationErrors);
                    break;
                case BadRequestException badRequestException:
                    httpStatusCode = HttpStatusCode.BadRequest;
                    result = GetErrorMessage(badRequestException.Message);
                    break;
                case NotFoundException notFoundException:
                    httpStatusCode = HttpStatusCode.NotFound;
                    result = GetErrorMessage(notFoundException.Message);
                    break;
                case ApplicationException appexception:
                    httpStatusCode = HttpStatusCode.BadRequest;
                    result = GetErrorMessage(appexception.Message);
                    break;
                case Exception ex:
                    httpStatusCode = HttpStatusCode.BadRequest;
                    result = GetErrorMessage("Internal server error occurred contact dev team. Issue is: " + ex.Message);
                    break;
            }

            context.Response.StatusCode = (int)httpStatusCode;

            return context.Response.WriteAsync(result);
        }

        private string GetErrorMessage(string message)
        {
            var response = new Response<string>();
            response.Succeeded = false;
            response.Errors = new List<string>();
            response.Errors.Add(message);
            return JsonConvert.SerializeObject(response);

        }

        private string GetErrorMessages(List<string> messages)
        {
            var response = new Response<string>();
            response.Succeeded = false;
            response.Errors = new List<string>();
            response.Errors = messages;
            return JsonConvert.SerializeObject(response);

        }
    }
}
