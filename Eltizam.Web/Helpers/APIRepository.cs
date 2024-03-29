﻿using System.Net;
using System.Net.Http.Headers;

namespace Eltizam.Web.Helpers
{
    public class APIRepository
    {
        public static string baseURL;
        private IConfiguration Configuration;
        private readonly IHttpContextAccessor _httpContextAccessor;

        public APIRepository(IConfiguration configuration)
        {
            Configuration = configuration;
            baseURL = Configuration.GetSection("Apiconfig").GetSection("baseurl").Value;
            // _httpContextAccessor = httpContextAccessor;
        }

        #region APICommunication - Common Method for API calling

        public async Task<HttpResponseMessage> APICommunication(string URL, HttpMethod invokeType, string token, HttpContent body = null, string ContentType = "application/json", List<IFormFile> formFile = null, string bodyKey = null)
        {
            HttpResponseMessage oHttpResponseMessage = new HttpResponseMessage();
            try
            {
                HttpClientHandler clientHandler = new HttpClientHandler();
                clientHandler.ServerCertificateCustomValidationCallback = (sender, cert, chain, sslPolicyErrors) => { return true; };

                // Pass the handler to httpclient(from you are calling api)
                using (var client = new HttpClient(clientHandler))
                {
                    client.BaseAddress = new Uri(baseURL);
                    if (!string.IsNullOrEmpty(token))
                        client.DefaultRequestHeaders.Add("Authorization", "Bearer " + token);

                    if (invokeType.Method == HttpMethod.Get.ToString())
                    {
                        return await client.GetAsync(URL);
                    }
                    else if (invokeType.Method == HttpMethod.Post.ToString())
                    {
                        if (formFile != null)
                        {
                            // file upload logic will go here
                        }
                        try
                        {
                            if (body != null)
                                body.Headers.ContentType = new MediaTypeHeaderValue("application/json");

                            return await client.PostAsync(URL, body);
                        }
                        catch (Exception ex)
                        {

                            throw ex;
                        }

                       
                    }
                    else if (invokeType.Method == HttpMethod.Put.ToString())
                    {

                        if (body != null)
                            body.Headers.ContentType = new MediaTypeHeaderValue("application/json");

                        return await client.PostAsync(URL, body);
                    }
                    else if (invokeType.Method == HttpMethod.Delete.ToString())
                    {
                        return await client.DeleteAsync(URL);
                    }
                }
            }
            catch (Exception ex)
            {
                oHttpResponseMessage.StatusCode = HttpStatusCode.InternalServerError;
            }
            if (oHttpResponseMessage.StatusCode == HttpStatusCode.Unauthorized)
            {
                // RedirectToAction("Login", "Account");
            }
            return oHttpResponseMessage;
        }

        #endregion APICommunication - Common Method for API calling

        public async Task<HttpResponseMessage> APIComm(string URL, HttpMethod invokeType, string token, HttpContent body = null)
        {
            HttpContextAccessor httpContextAccessor = new HttpContextAccessor();
            HttpResponseMessage oHttpResponseMessage = new HttpResponseMessage();
            try
            {
                HttpClientHandler clientHandler = new HttpClientHandler();
                clientHandler.ServerCertificateCustomValidationCallback = (sender, cert, chain, sslPolicyErrors) => { return true; };
                using (var client = new HttpClient(clientHandler))
                {
                    client.BaseAddress = new Uri(baseURL);
                    if (!string.IsNullOrEmpty(token))
                        client.DefaultRequestHeaders.Add("Authorization", "Bearer " + token);

                    if (invokeType.Method == HttpMethod.Get.ToString())
                    {
                        oHttpResponseMessage = await client.GetAsync(URL);
                    }
                    else if (invokeType.Method == HttpMethod.Post.ToString())
                    {
                        if (body != null)
                            oHttpResponseMessage = await client.PostAsync(URL, body);
                    }
                    else if (invokeType.Method == HttpMethod.Put.ToString())
                    {
                        if (body != null)
                            oHttpResponseMessage = await client.PostAsync(URL, body);
                    }
                    else if (invokeType.Method == HttpMethod.Delete.ToString())
                    {
                        oHttpResponseMessage = await client.DeleteAsync(URL);
                    }
                }
            }
            catch (Exception ex)
            {
                oHttpResponseMessage.StatusCode = HttpStatusCode.InternalServerError;
            }
            if (oHttpResponseMessage.StatusCode == HttpStatusCode.Unauthorized)
            {
                string redirecturl = "/Home/AccessRestriction";
                string scheme = httpContextAccessor.HttpContext.Request.Scheme;
                string Host = httpContextAccessor.HttpContext.Request.Host.ToUriComponent();
                var absoluteUri = string.Concat(scheme, "://", Host, redirecturl);
                httpContextAccessor.HttpContext.Response.Redirect(absoluteUri);
            }
            return oHttpResponseMessage;
        }
    }
}
