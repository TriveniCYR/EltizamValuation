using Microsoft.AspNetCore.Mvc;

namespace Eltizam.Api.Helpers.Response
{
    public interface IResponseHandler<T> where T : class
    {
        IActionResult Create(T Data, int? StatusCode, string Message = null, string ReturnToUrl = null, List<string> errorMessages = null);

        IActionResult CreateData(T Data, int? StatusCode);
    }
}
