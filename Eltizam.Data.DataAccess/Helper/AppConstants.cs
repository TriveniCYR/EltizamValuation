using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Eltizam.Data.DataAccess.Helper
{
    public class AppConstants
    {
        public static string msgLinkToResetpasswordSentOnEmail = "We have send an email successfully to entered email address, please go to your mail box and follow further steps";

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
        public static string BadRequest =  AppConstants.BadRequest;
        public static string ActionSuccess = "Action performed successfully";
    }

    public class TableName
    {
        public static string Master_User = "Master_User";
        public static string Master_Client = "Master_Client";
        public static string Master_Vendor = "Master_Vendor";
    }
}
