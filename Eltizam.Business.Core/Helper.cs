using Microsoft.AspNetCore.Http;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Eltizam.Business.Models;

namespace Eltizam.Business.Core
{
    public class Helper : IHelper
    {
        private readonly IHttpContextAccessor _httpContextAccessor;

        public Helper(IHttpContextAccessor httpContextAccessor)
        {
            _httpContextAccessor = httpContextAccessor;
        }

        public UserSessionEntity GetLoggedInUser()
        {
            return ((UserSessionEntity)_httpContextAccessor.HttpContext.Items["User"]);
        }
    }
}
