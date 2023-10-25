using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Eltizam.Data.DataAccess.Helper
{
    public class AppConstants
    {
        public static string msgLinkToResetpasswordSentOnEmail = "Forgot password link sent to the given email successfully."; 
        public static string SomeErrorOccurred = "Some error occurred"; 
        public static string msgEmailAddressNotExistIndatabase = "Entered email address is not found"; 
        public static string msgPasswordResetSuccessfully = "Password Reset successfully"; 
        public static string msgResetPasswordTokenExpired = "You link has been expired please go to forgot password page to reset your password again"; 
        public static string msgInvalidLink = "Invalid Link";

        public static string TableName = "TableName"; 
        public static string TableId = "TableId";
        public static string TableKeyId = "TableKeyId";

        public static string NoRecordFound = "No Record Found";
        public static string InsertSuccess = "Data inserted successfully";
        public static string UpdateSuccess = "Data updated successfully";
        public static string DeleteSuccess = "Data deleted successfully";
        public static string BadRequest = "Bad Reques";
        public static string ActionSuccess = "Action performed successfully";

        public static string P_SearchText   = "@SearchText";
        public static string P_SortDirection = "@SortDirection";
        public static string P_SortColumn    = "@SortColumn";
        public static string P_PageSize      = "@PageSize";
        public static string P_CurrentPageNumber = "@CurrentPageNumber";

        public static string P_Id = "@Id";
        public static string P_CreatedBy = "@CreatedBy";
        public static string P_RequestData = "@RequestData";

        public static DateTime DateTime = DateTime.Now;
    }

    public class TableName
    {
        public static string Master_User = "Master_User";
        public static string Master_Client = "Master_Client";
        public static string Master_Vendor = "Master_Vendor";
        public static string Master_Dictionary = "Master_Dictionary";
    }
}
