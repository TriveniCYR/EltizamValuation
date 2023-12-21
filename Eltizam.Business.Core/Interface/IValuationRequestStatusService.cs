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
        Task<List<ValuationRequestStatusModel>> GetAll(int? roleId = null, string? action = null, int? ValReqId = null);
        Task<List<ValuationRequestStatusModel>> GetAllStatus();
        Task<List<ValuationRequestHistoryStatusModel>> GetAllStatusHistory(int? ValReqId = null);
    }
}
