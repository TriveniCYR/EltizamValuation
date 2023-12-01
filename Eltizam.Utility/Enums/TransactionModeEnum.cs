using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Eltizam.Utility.Enums
{
    public enum TransactionModeEnum
    {
        [Description("Cash")]
        Cash = 1,
        [Description("Check")]
        Check = 2,
        [Description("Net Banking")]
        NetBanking = 3,
        [Description("Credit/Debit Card")]
        CreditDebitCard = 4       
    }
}
