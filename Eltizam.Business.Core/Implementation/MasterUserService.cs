using Eltizam.Business.Core.Interface;
using Eltizam.Business.Core.ModelMapper;
using Eltizam.Business.Models;
using Eltizam.Data.DataAccess.Core.Repositories;
using Eltizam.Data.DataAccess.Core.UnitOfWork;
using Eltizam.Data.DataAccess.Entity;
using Eltizam.Resource;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Localization;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Dynamic;
using System.Linq;
using System.Threading.Tasks;
using static Eltizam.Utility.Enums.GeneralEnum;
using Eltizam.Business.Core;
using Eltizam.Utility.Utility;
using Eltizam.Utility.Helpers;

namespace Eltizam.Business.Core.ServiceImplementations
{
	public class MasterUserService : IMasterUserService
	{
		private readonly IUnitOfWork _unitOfWork;
		private readonly IMapperFactory _mapperFactory;
		private readonly IStringLocalizer<Errors> _stringLocalizerError;
		private readonly Microsoft.Extensions.Configuration.IConfiguration configuration;
		private IRepository<MasterUser> _repository { get; set; }
		private IRepository<EmailLogHistory> _emailLog { get; set; }

		private IRepository<MasterBusinessUnit> _businessUnitRepository { get; set; }

		private readonly IHelper _helper;
		public MasterUserService(IUnitOfWork unitOfWork, IMapperFactory mapperFactory, IStringLocalizer<Errors> stringLocalizerError,
								  IHelper helper,
								  Microsoft.Extensions.Configuration.IConfiguration _configuration)
		{
			_unitOfWork = unitOfWork;
			_mapperFactory = mapperFactory;
			
			_repository = _unitOfWork.GetRepository<MasterUser>();
			_emailLog = _unitOfWork.GetRepository<EmailLogHistory>();
			_businessUnitRepository = _unitOfWork.GetRepository<MasterBusinessUnit>();
			configuration = _configuration;
			_helper = helper;
		}

		public async Task<UserSessionEntity> Login(LoginViewModel oLogin)
		{

			UserSessionEntity oUser = null;

			SqlParameter[] osqlParameter = 
			{
		        new SqlParameter("@Email", oLogin.Email),
				new SqlParameter("@Password", UtilityHelper.GenerateSHA256String(oLogin.Password))
			};

			var UserList = await _repository.GetBySP("usp_User_VerifyUserLogin", System.Data.CommandType.StoredProcedure, osqlParameter);

			if (UserList != null && UserList.Rows.Count > 0)
			{
                oUser = new UserSessionEntity();
                oUser.UserName = Convert.ToString(UserList.Rows[0]["UserName"]);
                oUser.UserId = Convert.ToInt32(UserList.Rows[0]["UserId"]);
                oUser.Email = Convert.ToString(UserList.Rows[0]["EmailAddress"]);
				oUser.RoleId = Convert.ToInt32(UserList.Rows[0]["RoleId"]);
			}
			return oUser;
		}

		public async Task<DataTableResponseModel> GetAll(DataTableAjaxPostModel model)
		{
			string ColumnName = (model.order.Count > 0 ? model.columns[model.order[0].column].data : string.Empty);
			string SortDir = (model.order.Count > 0 ? model.order[0].dir : string.Empty);

			SqlParameter[] osqlParameter = 
			{
				new SqlParameter("@UserId", 0),
				new SqlParameter("@CurrentPageNumber", model.start),
				new SqlParameter("@PageSize", model.length),
				new SqlParameter("@SortColumn", ColumnName),
				new SqlParameter("@SortDirection", SortDir),
				new SqlParameter("@SearchText", model.search.value)
			};

			var UserList = await _repository.GetBySP("stp_npd_GetUserList", System.Data.CommandType.StoredProcedure, osqlParameter);

			var TotalRecord = (UserList != null && UserList.Rows.Count > 0 ? Convert.ToInt32(UserList.Rows[0]["TotalRecord"]) : 0);
			var TotalCount = (UserList != null && UserList.Rows.Count > 0 ? Convert.ToInt32(UserList.Rows[0]["TotalCount"]) : 0);

			DataTableResponseModel oDataTableResponseModel = new DataTableResponseModel(model.draw, TotalRecord, TotalCount, UserList.DataTableToList<MasterUserEntity>());

			return oDataTableResponseModel;
		} 

		public async Task<MasterUserEntity> GetById(int id)
		{
			var _userEntity = new MasterUserEntity();
			_userEntity = _mapperFactory.Get<MasterUser, MasterUserEntity>(await _repository.GetAsync(id));

			return _userEntity;
		}
		 

		public async Task<DBOperation> DeleteUser(int id)
		{
			var entityUser = _repository.Get(x => x.Id == id);

			if (entityUser == null)
				return DBOperation.NotFound;

			_repository.Remove(entityUser);

			await _unitOfWork.SaveChangesAsync();

			return DBOperation.Success;
		}


		public async Task<bool> CheckEmailAddressExists(string emailAddress)
		{
			var isExists = await _repository.GetAllQuery().AnyAsync(x => x.Email.ToLower() == emailAddress.ToLower());
			return isExists;
        }

        public async Task<DBOperation> ForgotPassword(ForgotPasswordViewModel forgotPasswordViewModel)
        {
            EmailHelper email = new EmailHelper();
			bool IsSuccess = false;
            string baseURL = forgotPasswordViewModel.WebApplicationUrl;
            var entityUser = _repository.Get(x => x.Email == forgotPasswordViewModel.Email);
            if (entityUser == null)
                return DBOperation.NotFound;

            entityUser.ForgotPasswordToken = UtilityHelper.GenerateSHA256String(entityUser.Id.ToString());
            entityUser.ForgotPasswordDateTime = DateTime.Now;
            _repository.UpdateAsync(entityUser);
            await _unitOfWork.SaveChangesAsync();

            string strURL = baseURL + @"/Account/ResetPassword?userToken=" + entityUser.ForgotPasswordToken;
            string strHtml = System.IO.File.ReadAllText(@"wwwroot\Uploads\HTMLTemplates\ForgotPassword.html");
            strHtml = strHtml.Replace("ValidateURL", strURL);
            strHtml = strHtml.Replace("ValidDateTime", entityUser.ForgotPasswordDateTime.Value.AddHours(1).ToString());
            strHtml = strHtml.Replace("Name", entityUser.FirstName + entityUser.LastName);
            IsSuccess =	email.SendMail(entityUser.Email, string.Empty, "Eltizam - Forgot Password", strHtml, GetSMTPConfiguration());
			
			
			EmailLogHistory emailLogHistory = new EmailLogHistory();
			emailLogHistory.FromAddress = configuration.GetSection("SMTPDetails").GetSection("FromEmail").Value;//entityUser.Email;

            emailLogHistory.ToAddress = entityUser.Email;
			emailLogHistory.Subject = "Eltizam - Forgot Password";
			emailLogHistory.EmailResponse = "";
			emailLogHistory.CreatedBy = null;
			emailLogHistory.CreatedDate = DateTime.Now;
			emailLogHistory.Body = strHtml;
			emailLogHistory.IsSent = IsSuccess;
			_emailLog.Add(emailLogHistory);
			await _unitOfWork.SaveChangesAsync();

			//if (IsSuccess)
			return DBOperation.Success;
        }
        public async Task<string> ResetPassword(MasterUserResetPasswordEntity resetPasswordentity)
        {
            var entityUser = _repository.Get(x => x.ForgotPasswordToken == resetPasswordentity.ForgotPasswordToken);
            if (entityUser == null)
                return "TokenNotFound";

            if (entityUser.ForgotPasswordDateTime.Value.AddHours(1) < DateTime.Now)
            {
                return "TokenExpired";
            }
            entityUser.Password = UtilityHelper.GenerateSHA256String(resetPasswordentity.Password);
            entityUser.ForgotPasswordToken = string.Empty;
            entityUser.ForgotPasswordDateTime = null;
            _repository.UpdateAsync(entityUser);
            await _unitOfWork.SaveChangesAsync();
            return "ResetSuccessfully";
        }

        public SMTPEntityViewModel GetSMTPConfiguration()
        {
            SMTPEntityViewModel _smtp = new SMTPEntityViewModel();
            _smtp.Host = configuration.GetSection("SMTPDetails").GetSection("Host").Value;
            _smtp.Port = configuration.GetSection("SMTPDetails").GetSection("Port").Value;
            _smtp.EnableSsl = configuration.GetSection("SMTPDetails").GetSection("Enable_SSL").Value;
            _smtp.FromEmail = configuration.GetSection("SMTPDetails").GetSection("FromEmail").Value;
            _smtp.UserName = configuration.GetSection("SMTPDetails").GetSection("UserName").Value;
            _smtp.Password = configuration.GetSection("SMTPDetails").GetSection("Password").Value;
            return _smtp;
        }
        public async Task<bool> IsTokenValid(string token)
		{
			var isExists = await _repository.GetAllQuery().AnyAsync(x => x.ForgotPasswordToken == token);
			return isExists;
		}


	}
}