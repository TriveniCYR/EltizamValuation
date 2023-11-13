using System;
using System.Configuration;
using System.Globalization;

namespace ValuationWeb.Persistence.Helper
{
    /// <summary>
    /// Added by YReddy on 08/15/2022
    /// Class used to hold all database related object names at one place
    /// </summary>
    public class SQLMetaStore
    {
        public static string User_SearchPageWise = "dbo.usp_User_SearchPageWise";
        public static string User_UpdatePassword = "dbo.usp_User_UpdatePassword";
        public static string User_GetUserDetails = "dbo.usp_User_GetUserDetails";
        public static string User_ResetPassword = "dbo.usp_User_ResetPassword"; 

        public static string Branch_SearchPageWise = "dbo.usp_Branch_SearchPageWise";
        public static string Branch_GetBranchDetails = "dbo.usp_Branch_GetBranchDetails"; 
         
        public static string User_UpsertUserBankAccount = "dbo.usp_User_UpsertBankAccount";
        public static string RefreshToken_GetDetailsbyToken = "dbo.usp_RefreshToken_GetDetailsbyToken";
        
    }
}
