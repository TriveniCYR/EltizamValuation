using Eltizam.Business.Models;
using static Eltizam.Utility.Enums.GeneralEnum;
using Eltizam.Data.DataAccess.Entity;
using Microsoft.Extensions.Localization;
using Eltizam.Business.Core.ModelMapper;
using Eltizam.Data.DataAccess.Core.Repositories;
using Eltizam.Data.DataAccess.Core.UnitOfWork;
using Eltizam.Resource;
using Eltizam.Data.DataAccess.Helper;
using Eltizam.Business.Core.Interface;
using Eltizam.Utility.Utility;
using Microsoft.EntityFrameworkCore.Metadata.Internal;
using System.Data.Common;
using System.Data;
using DbParameter = Eltizam.Data.DataAccess.Helper.DbParameter;
using Eltizam.Utility;
using static Microsoft.EntityFrameworkCore.DbLoggerCategory;

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
        private IRepository<MasterQualification> _qualifyRepository { get; set; }
        private IRepository<MasterDocument> _documentRepository { get; set; }
        private readonly IHelper _helper;
        public UserService(IUnitOfWork unitOfWork, IMapperFactory mapperFactory, IStringLocalizer<Errors> stringLocalizerError,
                                  IHelper helper,
                                 Microsoft.Extensions.Configuration.IConfiguration _configuration)
        {
            _unitOfWork = unitOfWork;
            _mapperFactory = mapperFactory;

            _repository = _unitOfWork.GetRepository<MasterUser>();
            _addressRepository = _unitOfWork.GetRepository<MasterAddress>();
            _qualifyRepository = _unitOfWork.GetRepository<MasterQualification>();
            _documentRepository = _unitOfWork.GetRepository<MasterDocument>();
            configuration = _configuration;
            _helper = helper;
        }

        public async Task<DataTableResponseModel> GetAll(UserSearchModel model, PaginationModel paging)
        {
            var _dbParams = new[]
             {
                 new DbParameter("UserId", 0,SqlDbType.Int),
                 new DbParameter("PageSize", paging.pageSize, SqlDbType.Int),
                 new DbParameter("PageNumber", paging.pageNo, SqlDbType.Int),
                 new DbParameter("OrderClause", paging.sortName, SqlDbType.VarChar),
                 new DbParameter("ReverseSort", 1, SqlDbType.Int)
             };

            int _count = 0;
            var lstStf = FJDBHelper.ExecuteMappedReaderWithOutputParameter<MasterUserListModel>(ProcedureNameCall.usp_User_SearchAllList,

             DatabaseConnection.EltizamDatabaseConnection, out _count, CommandType.StoredProcedure, _dbParams);


            DataTableResponseModel oDataTableResponseModel = new DataTableResponseModel(0, _count, lstStf.Count, lstStf);

            return oDataTableResponseModel;
        }
        public async Task<MasterUserDetailModel> GetById(int id)
        {
            var _userEntity = new MasterUserDetailModel();
            _userEntity = _mapperFactory.Get<MasterUser, MasterUserDetailModel>(await _repository.GetAsync(id));
            if (_userEntity != null)
            {
                DbParameter[] osqlParameter = {
                 new DbParameter("TableKeyId", id, SqlDbType.Int),
                 new DbParameter("TableName", SourceTableKey.Master_User, SqlDbType.VarChar),
                };
                var UserAddress = FJDBHelper.ExecuteMappedReader<MasterUserAddressModel>(ProcedureNameCall.usp_Address_GetAddressByTableKeyId, DatabaseConnection.EltizamDatabaseConnection, System.Data.CommandType.StoredProcedure, osqlParameter);
                if (UserAddress != null)
                {
                    _userEntity.Address = UserAddress;

                }

                DbParameter[] osqlParameter1 = {
                 new DbParameter("TableKeyId", id, SqlDbType.Int),
                 new DbParameter("TableName", SourceTableKey.Master_User, SqlDbType.VarChar),
                };
                var UserQualification = FJDBHelper.ExecuteMappedReader<Master_QualificationModel>(ProcedureNameCall.usp_Qualification_GetQualificationByTableKeyId, DatabaseConnection.EltizamDatabaseConnection, System.Data.CommandType.StoredProcedure, osqlParameter1);
                if (UserQualification != null)
                {
                    _userEntity.Qualification = UserQualification;

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
            entityUser.DateOfBirth = DateTime.Now;
            MasterUser objUser;
            MasterAddress objUserAddress;
            MasterQualification objUserQualification;
            MasterDocument objUserDocument;

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
                if (entityUser.UpsertAddress != null || entityUser.Address != null)
                {
                    if(entityUser.UpsertAddress != null)
                    {
                        if(entityUser.Address == null)
                        {
                            entityUser.Address = new List<MasterUserAddressModel>();
                        }
                        entityUser.Address.Add(entityUser.UpsertAddress);
                    }
                    foreach (var addres in entityUser.Address)
                    {
                        if (addres.Id > 0)
                        {
                            objUserAddress = _addressRepository.Get(addres.Id);
                            if (objUserAddress != null)
                            {
                                var entityAddress = _mapperFactory.Get<MasterUserAddressModel, MasterAddress>(addres);
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
                                objUserAddress.Email = entityAddress.Email;
                                objUserAddress.AlternateEmail = entityAddress.AlternateEmail;
                                objUserAddress.Phone = entityAddress.Phone;
                                objUserAddress.AlternatePhone = entityAddress.AlternatePhone;
                                objUserAddress.Landlinephone = entityAddress.Landlinephone;
                                objUserAddress.IsActive = entityAddress.IsActive;
                                objUserAddress.ModifiedBy = entityUser.CreatedBy;
                                objUserAddress.ModifiedDate = DateTime.Now;
                                _addressRepository.UpdateAsync(objUserAddress);
                            }
                        }
                        else
                        {
                            objUserAddress = _mapperFactory.Get<MasterUserAddressModel, MasterAddress>(addres);
                            objUserAddress.IsActive = entityUser.IsActive;
                            objUserAddress.TableKeyId = objUser.Id;
                            objUserAddress.TableName = SourceTableKey.Master_User;
                            objUserAddress.CreatedBy = entityUser.CreatedBy;
                            objUserAddress.CreatedDate = DateTime.Now;
                            objUserAddress.ModifiedBy = entityUser.CreatedBy;
                            objUserAddress.ModifiedDate = DateTime.Now;
                            _addressRepository.AddAsync(objUserAddress);
                        }
                        await _unitOfWork.SaveChangesAsync();
                    }

                }
                if (entityUser.Qualification != null || entityUser.UpsertQualification != null)
                {
                    if(entityUser.UpsertQualification != null)
                    {
                        if (entityUser.Qualification == null)
                        {
                            entityUser.Qualification = new List<Master_QualificationModel>();
                        }
                        entityUser.Qualification.Add(entityUser.UpsertQualification);
                    }
                    foreach (var qualification in entityUser.Qualification)
                    {
                        if (qualification.Id > 0)
                        {
                            objUserQualification = _qualifyRepository.Get(qualification.Id);
                            if (objUserQualification != null)
                            {
                                var entityContact = _mapperFactory.Get<Master_QualificationModel, MasterQualification>(qualification);
                                objUserQualification.Qualification = qualification.Qualification;
                                objUserQualification.Subject = qualification.Subject;
                                objUserQualification.Institute = qualification.Institute;
                                objUserQualification.Grade = qualification.Grade;
                                objUserQualification.YearOfInstitute = qualification.YearOfInstitute;
                                objUserQualification.IsActive = qualification.IsActive;
                                objUserQualification.ModifiedBy = entityUser.CreatedBy;
                                objUserQualification.ModifiedDate = DateTime.Now;
                                _qualifyRepository.UpdateAsync(objUserQualification);
                            }
                        }
                        else
                        {
                            objUserQualification = _mapperFactory.Get<Master_QualificationModel, MasterQualification>(qualification);
                            qualification.IsActive = qualification.IsActive;
                            objUserQualification.TableKeyId = objUser.Id;
                            objUserQualification.TableName = SourceTableKey.Master_User;
                            objUserQualification.CreatedBy = entityUser.CreatedBy;
                            objUserQualification.CreatedDate = DateTime.Now;
                            objUserQualification.ModifiedBy = entityUser.CreatedBy;
                            objUserQualification.ModifiedDate = DateTime.Now;
                            _qualifyRepository.AddAsync(objUserQualification);
                        }
                        await _unitOfWork.SaveChangesAsync();
                    }
                }
            }

            return DBOperation.Success;
        }

        public async Task<List<MasterResourceTypeModel>> GetResourceTypeList()
        {

            var lstStf = FJDBHelper.ExecuteMappedReader<MasterResourceTypeModel>(ProcedureNameCall.usp_ResourceType_AllList,
             DatabaseConnection.EltizamDatabaseConnection, CommandType.StoredProcedure, null);

            return lstStf;
        }
        public async Task<List<MasterRoleModel>> GetRoleList()
        {

            var lstStf = FJDBHelper.ExecuteMappedReader<MasterRoleModel>(ProcedureNameCall.usp_Role_AllList,
             DatabaseConnection.EltizamDatabaseConnection, CommandType.StoredProcedure, null);

            return lstStf;
        }
    }
}
