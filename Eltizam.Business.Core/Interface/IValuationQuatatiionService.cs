using Eltizam.Business.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using static Eltizam.Utility.Enums.GeneralEnum;

namespace Eltizam.Business.Core.Interface
{
    public interface IValuationQuatationService
    {
        Task<List<ValuationQuatationListModel>> GetQuatationList(int requestId);
        Task<ValuationQuatationListModel> GetQuatationById(int id);
        Task<DBOperation> QuatationDelete(int id);
        Task<DBOperation> Upsert(ValuationQuatationListModel entityQuatation);
        Task<dynamic> GetValuationPDFData(int valId);
    }
}
