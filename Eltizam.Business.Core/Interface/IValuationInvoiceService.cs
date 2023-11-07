using Eltizam.Business.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using static Eltizam.Utility.Enums.GeneralEnum;

namespace Eltizam.Business.Core.Interface
{
    public interface IValuationInvoiceService
    {
        Task<List<ValuationInvoiceListModel>> GetInvoiceList(int requestId);
        Task<ValuationInvoiceListModel> GetInvoiceById(int id);
        Task<DBOperation> InvoiceDelete(int id);
    }
}
