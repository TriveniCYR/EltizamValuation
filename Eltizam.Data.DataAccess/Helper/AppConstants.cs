﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Eltizam.Data.DataAccess.Helper
{
    public class AppConstants
    {
        public static string ConnectionStringkey = "ConnectionStrings:EltizamDBConn";

        public static string msgLinkToResetpasswordSentOnEmail = "Forgot password link sent to the given email successfully."; 
        public static string SomeErrorOccurred = "Some error occurred"; 
        public static string msgEmailAddressNotExistIndatabase = "Entered email address is not found"; 
        public static string msgPasswordResetSuccessfully = "Password Reset successfully"; 
        public static string msgResetPasswordTokenExpired = "You link has been expired please go to forgot password page to reset your password again"; 
        public static string msgInvalidLink = "Invalid Link";
        public static string AccessRestriction = "AccessRestriction";
        public static string Home = "Home";

        public static string TableName = "TableName"; 
        public static string TableId = "TableId";
        public static string TableKeyId = "TableKeyId";

        public static string NoRecordFound = "No Record Found";
        public static string InsertSuccess = "Data inserted successfully";
        public static string UpdateSuccess = "Data updated successfully";
        public static string DeleteSuccess = "Data deleted successfully";
        public static string BadRequest = "Bad Request";
        public static string ActionSuccess = "Action performed successfully.";
        public static string ActionFailed = "Action failed.";
        public static string DuplicateRecordFound = "Duplicate Record Found";

        public static string P_SearchText   = "@SearchText";
        public static string P_SortDirection = "@SortDirection";
        public static string P_SortColumn    = "@SortColumn";
        public static string P_PageSize      = "@PageSize";
        public static string P_CurrentPageNumber = "@CurrentPageNumber"; 
        public static string P_Id = "@Id";
        public static string P_CreatedBy = "@CreatedBy"; 
        public static string P_RequestData = "@RequestData"; 
        public static string CreatedBy = "CreatedBy";
        public static string ModifiedBy = "ModifiedBy";
        public static string MenusCache = "MenusCache";


        public static DateTime DateTime = DateTime.Now; 
        public static string DateFormat1 = DateTime.Now.ToString("dd-MMM-yyyy");
        public static string DateFormat2 = DateTime.Now.ToString("yyyymmdd");


        public static string ID_ValuationRequest = string.Format("VR{0}-", DateFormat2);
        public static string ID_QuotationsRequest = string.Format("VR{0}-QT", DateFormat2); 
    } 

    public class AppSettings
    {
        public static string ConnString = "ConnectionStrings:EltizamDBConn";
    }
}
