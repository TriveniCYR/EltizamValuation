using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Eltizam.Utility.Enums
{
    public enum RecepientActionEnum
    {
        [Description("Validation Request Change")]
        ValidationRequestChange = 1,
        [Description("Invoice Creation")]
        InvoiceCreation = 2,
        [Description("Quaotation Creation")]
        QuaotationCreation = 3,
    }
}
