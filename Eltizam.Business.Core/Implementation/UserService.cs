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
using Microsoft.EntityFrameworkCore.Metadata.Internal;

namespace Eltizam.Business.Core.Implementation
{
	public class UserService : IUserService
	{
		private readonly IUnitOfWork _unitOfWork;
		private readonly IMapperFactory _mapperFactory;
		private readonly IStringLocalizer<Errors> _stringLocalizerError;
		private readonly Microsoft.Extensions.Configuration.IConfiguration configuration;

		private IRepository<MasterUser> _repository { get; set; }
		private IRepository<MasterAddress> _addressRepository { get; set; }
		private IRepository<MasterContact> _contactRepository { get; set; }
		private readonly IHelper _helper;
		public UserService(IUnitOfWork unitOfWork, IMapperFactory mapperFactory, IStringLocalizer<Errors> stringLocalizerError,
								  IHelper helper,
								 Microsoft.Extensions.Configuration.IConfiguration _configuration)
		{
			_unitOfWork = unitOfWork;
			_mapperFactory = mapperFactory;

			_repository = _unitOfWork.GetRepository<MasterUser>();
            _addressRepository = _unitOfWork.GetRepository<MasterAddress>();
            _contactRepository = _unitOfWork.GetRepository<MasterContact>();
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
		public async Task<MasterUserDetailModel> GetById(int id)
		{
			var _userEntity = new MasterUserDetailModel();
			_userEntity = _mapperFactory.Get<MasterUser, MasterUserDetailModel>(await _repository.GetAsync(id));
			if (_userEntity != null)
			{
				SqlParameter[] osqlParameter = {
				new SqlParameter("@UserId", _userEntity.Id),
				new SqlParameter("@TableName", "Master_User"),
				};
				var UserAddress = await _addressRepository.GetBySP("usp_User_GetAddressByUserId", System.Data.CommandType.StoredProcedure, osqlParameter);
				if (UserAddress != null)
				{
					_userEntity.Address = UserAddress;

				}

				SqlParameter[] osqlParameter1 = {
				new SqlParameter("@UserId", _userEntity.Id),
				new SqlParameter("@TableName", "Master_User"),
				};
				var UserContact = await _addressRepository.GetBySP("usp_User_GetContactByUserId", System.Data.CommandType.StoredProcedure, osqlParameter);
				if (UserContact != null)
				{
					_userEntity.Contact = UserContact;

				}
			}
			return _userEntity;
		}
		public async Task<DBOperation> Upsert(MasterUserModel entityUser)
		{
			if (!string.IsNullOrEmpty(entityUser.Password) && entityUser.Id <= 0)
			{
				entityUser.Password = Utility.Utility.UtilityHelper.GenerateSHA256String(entityUser.Password);
				entityUser.ConfirmPassowrd = entityUser.Password;
			}
			MasterUser objUser;
			MasterAddress objUserAddress;
			MasterContact objUserContact;

			if (entityUser.Id > 0)
			{
				objUser = _repository.Get(entityUser.Id);
				var OldObjUser = objUser;
				if (objUser != null)
				{

                    objUser.FirstName = entityUser.FirstName;
                    objUser.MiddleName = entityUser.MiddleName;
                    objUser.LastName = entityUser.LastName;
                    objUser.UserName = entityUser.UserName;
                    objUser.Gender = entityUser.Gender;
                    objUser.DateOfBirth = entityUser.DateOfBirth;
                    objUser.DepartmentId = entityUser.DepartmentId;
                    objUser.DesignationId = entityUser.DesignationId;
                    objUser.LicenseNo = entityUser.LicenseNo;
                    objUser.CompanyId = entityUser.CompanyId;
                    objUser.ResourceId = entityUser.ResourceId;
                    objUser.IsActive = entityUser.IsActive;
                    objUser.ModifiedBy = entityUser.CreatedBy;
                    objUser.ModifiedDate = DateTime.Now;
                    _repository.UpdateAsync(objUser);
				}
				else
				{
					return DBOperation.NotFound;
				}
			}
			else
			{
				objUser = _mapperFactory.Get<MasterUserModel, MasterUser>(entityUser);
                objUser.IsActive = entityUser.IsActive;
                objUser.CreatedBy = entityUser.CreatedBy;
                objUser.CreatedDate = DateTime.Now;
                objUser.ModifiedBy = entityUser.CreatedBy;
                objUser.ModifiedDate = DateTime.Now;
                _repository.AddAsync(objUser);
			}
			await _unitOfWork.SaveChangesAsync();
			if (objUser.Id == 0)
				return DBOperation.Error;
			else
			{
				if (entityUser.Address.Id > 0)
				{
                    objUserAddress = _addressRepository.Get(entityUser.Address.Id);
					if (objUserAddress != null)
                    {
                        var entityAddress = _mapperFactory.Get<MasterUserAddressModel, MasterAddress>(entityUser.Address);
                        objUserAddress.Address1 = entityAddress.Address1;
                        objUserAddress.Address1 = entityAddress.Address1;
						objUserAddress.Address2 = entityAddress.Address2;
						objUserAddress.Address3 = entityAddress.Address3;
						objUserAddress.Landmark = entityAddress.Landmark;
						objUserAddress.PinNo = entityAddress.PinNo;
						objUserAddress.CountryId = entityAddress.CountryId;
						objUserAddress.StateId = entityAddress.StateId;
						objUserAddress.CityId = entityAddress.CityId;
						objUserAddress.PinNo = entityAddress.PinNo;
						objUserAddress.IsActive = entityAddress.IsActive;
						objUserAddress.ModifiedBy = entityUser.CreatedBy;
						objUserAddress.ModifiedDate = DateTime.Now;
						_addressRepository.UpdateAsync(objUserAddress);
					}
				}
				else
				{
                    objUserAddress = _mapperFactory.Get<MasterUserAddressModel, MasterAddress>(entityUser.Address);
                    objUserAddress.IsActive = entityUser.IsActive;
                    objUserAddress.TableKeyId = objUser.Id;
                    objUserAddress.TableName = "Master_User";
                    objUserAddress.CreatedBy = entityUser.CreatedBy;
                    objUserAddress.CreatedDate = DateTime.Now;
                    objUserAddress.ModifiedBy = entityUser.CreatedBy;
                    objUserAddress.ModifiedDate = DateTime.Now;
                    _addressRepository.AddAsync(objUserAddress);
                }
                await _unitOfWork.SaveChangesAsync();

                if (entityUser.Contact.Id > 0)
                {
                    objUserContact = _contactRepository.Get(entityUser.Contact.Id);
                    if (objUserContact != null)
                    {
                        var entityContact = _mapperFactory.Get<MasterUserContactModel, MasterContact>(entityUser.Contact);
                        objUserContact.ContactPersonName = entityContact.ContactPersonName;
                        objUserContact.Department = entityContact.Department;
                        objUserContact.Designation = entityContact.Designation;
                        objUserContact.Email = entityContact.Email;
                        objUserContact.Mobile = entityContact.Mobile;
                        objUserContact.Status = entityContact.Status;
                        objUserContact.ModifiedBy = entityUser.CreatedBy;
                        objUserContact.ModifiedDate = DateTime.Now;
                        _addressRepository.UpdateAsync(objUserAddress);
                    }
                }
                else
                {
                    objUserContact = _mapperFactory.Get<MasterUserContactModel, MasterContact>(entityUser.Contact);
                    objUserContact.Status = objUserContact.Status;
                    objUserContact.TableKeyId = objUser.Id;
                    objUserContact.TableName = "Master_User";
                    objUserContact.CreatedBy = entityUser.CreatedBy;
                    objUserContact.CreatedDate = DateTime.Now;
                    objUserContact.ModifiedBy = entityUser.CreatedBy;
                    objUserContact.ModifiedDate = DateTime.Now;
                    _contactRepository.AddAsync(objUserContact);
                }
                await _unitOfWork.SaveChangesAsync();
			}

			return DBOperation.Success;
		}
	}
}
