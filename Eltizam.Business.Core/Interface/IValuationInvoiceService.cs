﻿using Eltizam.Business.Models;
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
        Task<DBOperation> InvoiceDelete(int id, int? by);
        Task<DBOperation> Upsert(ValuationInvoiceListModel entityQuatation);
        Task<DBOperation> DeleteDocument(int id, int? by);
        Task<DBOperation> UpsertInvoice(ValuationInvoicePaymentModel invoice);
        Task<ValuationInvoicePaymentModel> PaymentInvoiceById(int id);
        Task<List<ValuationInvoicePaymentModel>> GetPaymentInvoiceById(int requestId);
        Task<DBOperation> DeletePyamentInvoice(int id, int? by);


    }
}
