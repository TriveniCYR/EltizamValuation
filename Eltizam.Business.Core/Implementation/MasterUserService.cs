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

namespace Eltizam.Business.Core.ServiceImplementations
{
	public class MasterUserService : IMasterUserService
	{
		private readonly IUnitOfWork _unitOfWork;
		private readonly IMapperFactory _mapperFactory;
		private readonly IStringLocalizer<Errors> _stringLocalizerError;
		private readonly Microsoft.Extensions.Configuration.IConfiguration configuration;
		private IRepository<MasterUser> _repository { get; set; }

		private IRepository<MasterBusinessUnit> _businessUnitRepository { get; set; }

		private readonly IHelper _helper;
		public MasterUserService(IUnitOfWork unitOfWork, IMapperFactory mapperFactory, IStringLocalizer<Errors> stringLocalizerError,
								  IHelper helper,
								 Microsoft.Extensions.Configuration.IConfiguration _configuration)
		{
			_unitOfWork = unitOfWork;
			_mapperFactory = mapperFactory;
			_repository = _unitOfWork.GetRepository<MasterUser>();
			_businessUnitRepository = _unitOfWork.GetRepository<MasterBusinessUnit>();
			configuration = _configuration;
			_helper = helper;
		}

		public async Task<UserSessionEntity> Login(LoginViewModel oLogin)
		{

			UserSessionEntity oUser = null;

			SqlParameter[] osqlParameter = {
		        new SqlParameter("@Email", oLogin.Email),
				new SqlParameter("@Password", Utility.Utility.UtilityHelper.GenerateSHA256String(oLogin.Password))
			};

			var UserList = await _repository.GetBySP("usp_User_VerifyUserLogin", System.Data.CommandType.StoredProcedure, osqlParameter);

			if (UserList != null && UserList.Rows.Count > 0)
			{
                oUser = new UserSessionEntity();
                oUser.FullName = Convert.ToString(UserList.Rows[0]["FullName"]);
                oUser.UserId = Convert.ToInt32(UserList.Rows[0]["UserId"]);
                oUser.Email = Convert.ToString(UserList.Rows[0]["EmailAddress"]);
            }
			return oUser;
		}

		public async Task<DataTableResponseModel> GetAll(DataTableAjaxPostModel model)
		{
			string ColumnName = (model.order.Count > 0 ? model.columns[model.order[0].column].data : string.Empty);
			string SortDir = (model.order.Count > 0 ? model.order[0].dir : string.Empty);

			SqlParameter[] osqlParameter = {
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

		public async Task<dynamic> GetRegionByBusinessUnit(string BusinessUnitIds)
		{
			SqlParameter[] osqlParameter = {
				new SqlParameter("@UserId", 0),
				new SqlParameter("@BusinessUnitIds", BusinessUnitIds)
			};

			var UserRegionDropdown = await _repository.GetDataSetBySP("stp_npd_GetRegionByBusinessUnit", System.Data.CommandType.StoredProcedure, osqlParameter);

			dynamic DropdownObjects = new ExpandoObject();
			if (UserRegionDropdown != null)
			{
				if (UserRegionDropdown.Tables[0] != null && UserRegionDropdown.Tables[0].Rows.Count > 0)
				{
					//DropdownObjects.Region = UserRegionDropdown.Tables[0].DataTableToList<MasterRegion>();
				}
			}

			return DropdownObjects;
		}

		public async Task<dynamic> GetCountryByRegion(string RegionIds)
		{
			SqlParameter[] osqlParameter = {
				new SqlParameter("@UserId", 0),
				new SqlParameter("@RegionIds", RegionIds)
			};

			var UserCountryDropdown = await _repository.GetDataSetBySP("stp_npd_GetCountryByRegion", System.Data.CommandType.StoredProcedure, osqlParameter);

			dynamic DropdownObjects = new ExpandoObject();
			if (UserCountryDropdown != null)
			{
				if (UserCountryDropdown.Tables[0] != null && UserCountryDropdown.Tables[0].Rows.Count > 0)
				{
					DropdownObjects.Country = UserCountryDropdown.Tables[0].DataTableToList<MasterCountry>();
				}
			}

			return DropdownObjects;
		}


		public async Task<MasterUserEntity> GetById(int id)
		{
			var _userEntity = new MasterUserEntity();
			_userEntity = _mapperFactory.Get<MasterUser, MasterUserEntity>(await _repository.GetAsync(id));

			return _userEntity;
		}
		public async Task<List<MasterUserEntity>> GetUserForAPIInterested()
		{
			var _userEntities = new List<MasterUserEntity>();
			var _userDBEntity = await _repository.GetAllAsync(x => x.IsActive == true );
			_userEntities = _mapperFactory.GetList<MasterUser, MasterUserEntity>(_userDBEntity.ToList());
			return _userEntities;
		}


		public async Task<DBOperation> AddUpdateUser(MasterUserEntity entityUser)
		{
			if (!string.IsNullOrEmpty(entityUser.Password) && entityUser.UserId <= 0)
			{
				entityUser.Password = Utility.Utility.UtilityHelper.GenerateSHA256String(entityUser.Password);
				entityUser.ConfirmPassowrd = entityUser.Password;
			}
			MasterUser objUser;
			var LoggedUserId = entityUser.LoggedUserId;
			if (entityUser.UserId > 0)
			{
				objUser = _repository.Get(entityUser.UserId);
				var OldObjUser = objUser;
				if (objUser != null)
				{
					//objUser.FullName = entityUser.FullName;
					//objUser.MobileNumber = entityUser.MobileNumber;
					//objUser.MobileCountryId = entityUser.MobileCountryId;
					//objUser.RoleId = entityUser.RoleId;
					//objUser.Address = entityUser.Address;
					//objUser.IsActive = entityUser.IsActive;
					//objUser.IsManagement = entityUser.IsManagement;
					//objUser.Apiuser = entityUser.APIUser;
					//objUser.FormulationGl = entityUser.FormulationGL;
					//objUser.ApigroupLeader = entityUser.ApigroupLeader;
					//objUser.AnalyticalGl = entityUser.AnalyticalGL;
					//objUser.DesignationName = entityUser.DesignationName;
					//objUser.ModifyBy = LoggedUserId;
					//objUser.ModifyDate = DateTime.Now;

					SqlParameter[] osqlParameter = {
				new SqlParameter("@UserId", entityUser.UserId)
			};
					var result = await _repository.GetDataSetBySP("stp_npd_RemoveAllMultipleMappingofMasterUser", System.Data.CommandType.StoredProcedure, osqlParameter);
					//objUser = FillMappingData(entityUser, objUser);
					_repository.UpdateAsync(objUser);
					//  var isSuccess = await _auditLogService.CreateAuditLog<MasterUser>(Utility.Audit.AuditActionType.Update,
					//Utility.Enums.ModuleEnum.UserManagement, OldObjUser, objUser, 0);
				}
				else
				{
					return DBOperation.NotFound;
				}
			}
			else
			{
				objUser = _mapperFactory.Get<MasterUserEntity, MasterUser>(entityUser);
				//objUser = FillMappingData(entityUser, objUser);
				objUser.CreatedBy = LoggedUserId;
				objUser.CreatedDate = DateTime.Now;
				_repository.AddAsync(objUser);
				//SendUserCreateMail(entityUser, LoggedUserId);
			}
			await _unitOfWork.SaveChangesAsync();
			if (objUser.Id == 0)
				return DBOperation.Error;

			return DBOperation.Success;
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
			var isExists = false; //await _repository.GetAllQuery().AnyAsync(x => x.EmailAddress.ToLower() == emailAddress.ToLower());
			return isExists;
		}

		public async Task<bool> IsTokenValid(string token)
		{
			var isExists = false;//await _repository.GetAllQuery().AnyAsync(x => x.ForgotPasswordToken == token);
			return isExists;
		}


	}
}