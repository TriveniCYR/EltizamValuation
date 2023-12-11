using Eltizam.Business.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Eltizam.Business.Core.Interface
{
    public interface IValuationRequestStatusService
    {
        Task<List<ValuationRequestStatusModel>> GetAll(int roleId, string action);
        Task<List<ValuationRequestStatusModel>> GetAllStatus();
    }
}
