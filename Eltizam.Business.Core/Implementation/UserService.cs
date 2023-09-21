using Eltizam.Business.Models;
using static Eltizam.Utility.Enums.GeneralEnum;
using Eltizam.Data.DataAccess.Entity;
using Microsoft.Extensions.Localization;
using Eltizam.Business.Core.ModelMapper;
using Eltizam.Data.DataAccess.Core.Repositories;
using Eltizam.Data.DataAccess.Core.UnitOfWork;
using Eltizam.Resource;
using Eltizam.Business.Core.Interface;
using System.Data.SqlClient;
using Eltizam.Utility.Utility;

namespace Eltizam.Business.Core.Implementation
{
	public class UserService : IUserService
	{
		private readonly IUnitOfWork _unitOfWork;
		private readonly IMapperFactory _mapperFactory;
		private readonly IStringLocalizer<Errors> _stringLocalizerError;
		private readonly Microsoft.Extensions.Configuration.IConfiguration configuration;

		private IRepository<Tbl_User> _repository { get; set; }
		private readonly IHelper _helper;
		public UserService(IUnitOfWork unitOfWork, IMapperFactory mapperFactory, IStringLocalizer<Errors> stringLocalizerError,
								  IHelper helper,
								 Microsoft.Extensions.Configuration.IConfiguration _configuration)
		{
			_unitOfWork = unitOfWork;
			_mapperFactory = mapperFactory;

			_repository = _unitOfWork.GetRepository<Tbl_User>();
			configuration = _configuration;
			_helper = helper;
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

			var UserList = await _repository.GetBySP("stp_npd_GetTblUserList", System.Data.CommandType.StoredProcedure, osqlParameter);

			var TotalRecord = (UserList != null && UserList.Rows.Count > 0 ? Convert.ToInt32(UserList.Rows[0]["TotalRecord"]) : 0);
			var TotalCount = (UserList != null && UserList.Rows.Count > 0 ? Convert.ToInt32(UserList.Rows[0]["TotalCount"]) : 0);

			DataTableResponseModel oDataTableResponseModel = new DataTableResponseModel(model.draw, TotalRecord, TotalCount, UserList.DataTableToList<TblUserModel>());

			return oDataTableResponseModel;
		}
		public async Task<TblUserModel> GetTblUserById(int id)
		{
			var _userEntity = new TblUserModel();
			_userEntity = _mapperFactory.Get<Tbl_User, TblUserModel>(await _repository.GetAsync(id));

			return _userEntity;
		}
		public async Task<DBOperation> AddUpdateUser(TblUserModel entityUser)
		{
			if (!string.IsNullOrEmpty(entityUser.Password) && entityUser.Id <= 0)
			{
				entityUser.Password = Utility.Utility.UtilityHelper.GenerateSHA256String(entityUser.Password);
				entityUser.ConfirmPassowrd = entityUser.Password;
			}
			Tbl_User objUser;

			if (entityUser.Id > 0)
			{
				objUser = _repository.Get(entityUser.Id);
				var OldObjUser = objUser;
				if (objUser != null)
				{
					objUser.Name = entityUser.Name;
					objUser.Mobile = entityUser.Mobile;
					objUser.Email = entityUser.Email;
					objUser.IsActive = entityUser.IsActive;
					objUser.CreatedOn = DateTime.Now;
					_repository.UpdateAsync(objUser);
				}
				else
				{
					return DBOperation.NotFound;
				}
			}
			else
			{
				objUser = _mapperFactory.Get<TblUserModel, Tbl_User>(entityUser);
				objUser.CreatedOn = DateTime.Now;
				_repository.AddAsync(objUser);
			}
			await _unitOfWork.SaveChangesAsync();
			if (objUser.Id == 0)
				return DBOperation.Error;

			return DBOperation.Success;
		}
	}
}
