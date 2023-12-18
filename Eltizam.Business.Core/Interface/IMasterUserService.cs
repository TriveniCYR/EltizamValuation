using Eltizam.Business.Models;
using System.Collections.Generic;
using System.Threading.Tasks;
using static Eltizam.Utility.Enums.GeneralEnum;

namespace Eltizam.Business.Core.Interface
{
    public interface IMasterUserService
    {
        Task<UserSessionEntity> Login(LoginViewModel oLogin); 
        Task<DataTableResponseModel> GetAll(DataTableAjaxPostModel model);    
        Task<DBOperation> DeleteUser(int id); 
        Task<bool> CheckEmailAddressExists(string emailAddress);  
        Task<DBOperation> ForgotPassword(ForgotPasswordViewModel forgotPasswordViewModel); 
        Task<string> ResetPassword(MasterUserResetPasswordEntity entity);  
        Task<bool> IsTokenValid(string token);

        Task<DBOperation> Upsert(MasterUserModel entityUser);
        Task<MasterUserDetailModel> GetById(int id); 
        Task<List<MasterResourceTypeModel>> GetResourceTypeList();
        Task<List<MasterRoleModel>> GetRoleList();
        Task<List<MasterUserListModel>> GetApproverList(int id, string roleName);
        Task<DBOperation> Delete(int id);
        Task<DBOperation> ChangePassword(ChangePasswordModel changePasswordModel);
        Task<GlobalAuditFields?> GetGlobalAuditFields(int TableKeyId, string TableName);

        Task<List<MasterUserModel>> GetAllUserList();
        Task<bool> IsEmailExists(string email, int? userId);
        Task<DBOperation> DeleteDocument(int id);
    }
}