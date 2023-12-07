using System.ComponentModel;

namespace Eltizam.Utility.Enums
{
    public enum RecepientActionEnum
    {
        [Description("Validation Created")]
        ValuationCreated = 1,
        [Description("Valuation Status Changed")]
        ValuationStatusChanged = 2,
        [Description("Quaotation Created")]
        QuaotationCreation = 3,
        [Description("Invoice Created")]
        InvoiceCreation = 4,       
    }
}
