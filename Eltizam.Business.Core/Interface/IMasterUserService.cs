﻿using Eltizam.Business.Models;
using System.Collections.Generic;
using System.Threading.Tasks;
using static Eltizam.Utility.Enums.GeneralEnum;

namespace Eltizam.Business.Core.Interface
{
    public interface IMasterUserService
    {
        Task<UserSessionEntity> Login(LoginViewModel oLogin);

        Task<DataTableResponseModel> GetAll(DataTableAjaxPostModel model);

        //Task<MasterUserEntity> GetById(int id);
        Task<List<MasterUserEntity>> GetUserForAPIInterested();
        Task<DBOperation> AddUpdateUser(MasterUserEntity entityUser);
       // Task<DBOperation> ChangeProfile(MasterUserEntityChangeProfile entityUser);        
        Task<DBOperation> DeleteUser(int id);

       // Task<DBOperation> ChangeUserPassword(MasterUserChangePasswordEntity entityUser);

       // Task<dynamic> GetUserDropdown();

       // Task<dynamic> GetDepartmentCountryByBusinessUnit(int BusinessUnitId);

        Task<bool> CheckEmailAddressExists(string emailAddress);

        //Task<List<MasterBusinessUnitEntity>> GetAll();

        Task<dynamic> GetRegionByBusinessUnit(string BusinessUnitId);

        Task<dynamic> GetCountryByRegion(string RegionIds);

        //Task<DBOperation> ForgotPassword(ForgotPasswordViewModel forgotPasswordViewModel);

        //Task<string> ResetPassword(MasterUserResetPasswordEntity entity);

        //Task<List<MasterBusinessUnitEntity>> GetBusinessUNitByUserId(int userid);

        Task<bool> IsTokenValid(string token);

        //SMTPEntityViewModel GetSMTPConfiguration();
    }
}