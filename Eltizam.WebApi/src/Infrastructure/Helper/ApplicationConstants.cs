namespace ValuationWeb.Persistence.Helper
{
    public static class ApplicationConstants
    {
        public const string LANG_ENG = "en";
        public const string LANG_AR = "ar";
        

        public const string PageNumber = "PageNumber";
        public const string PageSize = "PageSize";
        public const string OrderClause = "OrderClause";
        public const string ReverseSort = "ReverseSort";
        public const string CreatedBy = "CreatedBy";
        public const string UserId = "UserId";
        public const string RoleId = "RoleId";
        public const string BranchId = "BranchId";
        public const string IsActive = "IsActive";
        public const string Letter = "Letter";
        public const string Id = "Id";
        public const string AccountNumber = "AccountNumber";


        public const string success = "success";
        public const string fail = "fail";  
        public const string successMessage = "Success: {0} method executed successfully.";

        public static string Dateformat1 = DateTime.Now.ToString("yyyyMMdd");
        public const string Branch = "Branch";
        public const string Supplier = "Supplier";
        public const string Customer = "Customer";
        public const string User = "User"; 
    }


    /// <summary>
    /// Added by YReddy on 09/22/2022
    /// Class used to hold all Account type related constants
    /// </summary>
    public static class AccountType
    {
        public const string Account_Cash = "CAS";
        public const string Account_NonCash = "NCA";
        public const string Account_Purchase = "PRA";
        public const string Account_Deposit = "DPA";
    }
}
