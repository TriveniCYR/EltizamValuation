namespace Eltizam.Web.Helpers
{
    public interface IHelper
    {
        int GetLoggedInUserId();

        string GetToken();

     

        string IsManagementUser();

        int GetLoggedInRoleId();
        void LogExceptions(Exception ex);


    }
}
