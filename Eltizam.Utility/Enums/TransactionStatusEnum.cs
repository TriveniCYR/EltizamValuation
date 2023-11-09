namespace Eltizam.Utility.Enums
{
    public enum TransactionStatusEnum
    {
        Completed = 1,
        Inprogress = 2,
        Failed = 3,
        Success = 4       
    }
    public static class TransactionStatusEnumValue
    {
        public static string ToStatusStringValue(this TransactionStatusEnum value)
        {
            switch (value)
            {
                case TransactionStatusEnum.Completed:
                    return "Completed";
                case TransactionStatusEnum.Inprogress:
                    return "Inprogress";
                case TransactionStatusEnum.Failed:
                    return "Failed";
                case TransactionStatusEnum.Success:
                    return "Success";
                default:
                    return "N/A";
            }
        }
    }
}