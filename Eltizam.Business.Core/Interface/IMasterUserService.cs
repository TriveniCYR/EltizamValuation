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
       // Task<DBOperation> AddUpdateUser(MasterUserEntity entityUser);        
        Task<DBOperation> DeleteUser(int id); 
        Task<bool> CheckEmailAddressExists(string emailAddress);  
        Task<DBOperation> ForgotPassword(ForgotPasswordViewModel forgotPasswordViewModel); 
        Task<string> ResetPassword(MasterUserResetPasswordEntity entity);  
        Task<bool> IsTokenValid(string token);  
    }
}