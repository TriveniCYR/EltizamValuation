using Eltizam.Business.Models;
using Eltizam.Utility.Models;

namespace Eltizam.Web.Helpers
{
    public interface IHelper
    {
        int GetLoggedInUserId();

        string GetToken(); 

        string IsManagementUser();

        int GetLoggedInRoleId();
        void LogExceptions(Exception ex);

        List<RolePermissionModel> GetMenusByRole(int loginRoleId);
        List<MasterDocumentModel> FileUpload(DocumentFilesModel document);
    }
}
