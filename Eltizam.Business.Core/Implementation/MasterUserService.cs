using Eltizam.Business.Core.Interface;
using Eltizam.Business.Core.ModelMapper;
using Eltizam.Business.Models;
using Eltizam.Data.DataAccess.Core.Repositories;
using Eltizam.Data.DataAccess.Core.UnitOfWork;
using Eltizam.Data.DataAccess.Entity;
using Eltizam.Data.DataAccess.Helper;
using Eltizam.Utility;
using Eltizam.Utility.Enums;
using Eltizam.Utility.Helpers;
using Eltizam.Utility.Utility;
using Microsoft.EntityFrameworkCore;
using Newtonsoft.Json;
using Newtonsoft.Json.Linq;
using System;
using System.Data;
using System.Data.SqlClient;
using static Eltizam.Utility.Enums.GeneralEnum;

namespace Eltizam.Business.Core.Implementation
{
    public class MasterUserService : IMasterUserService
    {
        private readonly IUnitOfWork _unitOfWork;
        private readonly IMapperFactory _mapperFactory; 
        private readonly Microsoft.Extensions.Configuration.IConfiguration configuration;
        private IRepository<MasterUser> _repository { get; set; }
        private IRepository<MasterAddress> _addressRepository { get; set; }
        private IRepository<MasterQualification> _qualifyRepository { get; set; }
        private IRepository<MasterDocument> _documentRepository { get; set; }
        private IRepository<EmailLogHistory> _emailLog { get; set; }
        private readonly IAuditLogService _auditLogService;
        private readonly IHelper _helper;
        private readonly int? _LoginUserId;


        public MasterUserService(IUnitOfWork unitOfWork, IMapperFactory mapperFactory, IAuditLogService auditLogService,
                                  IHelper helper, Microsoft.Extensions.Configuration.IConfiguration _configuration)
        {
            _unitOfWork = unitOfWork;
            _mapperFactory = mapperFactory;

            _emailLog = _unitOfWork.GetRepository<EmailLogHistory>();
            _repository = _unitOfWork.GetRepository<MasterUser>();
            _addressRepository = _unitOfWork.GetRepository<MasterAddress>();
            _qualifyRepository = _unitOfWork.GetRepository<MasterQualification>();
            _documentRepository = _unitOfWork.GetRepository<MasterDocument>();
            configuration = _configuration;
            _helper = helper; 
           _auditLogService = auditLogService;
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
            entityUser.ForgotPasswordDateTime = AppConstants.DateTime;
            _repository.UpdateAsync(entityUser);
            await _unitOfWork.SaveChangesAsync();

            string strURL = baseURL + @"/Account/ResetPassword?userToken=" + entityUser.ForgotPasswordToken;
            string strHtml = System.IO.File.ReadAllText(@"wwwroot\Uploads\HTMLTemplates\ForgotPassword.html");
            strHtml = strHtml.Replace("ValidateURL", strURL);
            strHtml = strHtml.Replace("ValidDateTime", entityUser.ForgotPasswordDateTime.Value.AddHours(1).ToString());
            strHtml = strHtml.Replace("Name", entityUser.FirstName + entityUser.LastName);
            IsSuccess = email.SendMail(entityUser.Email, string.Empty, "Eltizam - Forgot Password", strHtml, GetSMTPConfiguration());


            EmailLogHistory emailLogHistory = new EmailLogHistory();
            emailLogHistory.FromAddress = configuration.GetSection("SMTPDetails").GetSection("FromEmail").Value;//entityUser.Email;

            emailLogHistory.ToAddress = entityUser.Email;
            emailLogHistory.Subject = "Eltizam - Forgot Password";
            emailLogHistory.EmailResponse = "";
            emailLogHistory.CreatedBy = null;
            emailLogHistory.CreatedDate = AppConstants.DateTime;
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

            if (entityUser.ForgotPasswordDateTime.Value.AddHours(1) < AppConstants.DateTime)
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

        public async Task<DataTableResponseModel> GetAll(DataTableAjaxPostModel model)
        { 
            string ColumnName = model.order.Count > 0 ? model.columns[model.order[0].column].data : string.Empty;
            string SortDir = model.order[0]?.dir; 
            SqlParameter[] osqlParameter =
            {
                new SqlParameter(AppConstants.P_CurrentPageNumber,  model.start),
                new SqlParameter(AppConstants.P_PageSize,           model.length),
                new SqlParameter(AppConstants.P_SortColumn,         ColumnName),
                new SqlParameter(AppConstants.P_SortDirection,      SortDir),
                new SqlParameter(AppConstants.P_SearchText,         model.search?.value)
            };

            var Results = await _repository.GetBySP(ProcedureMetastore.usp_User_SearchAllList, CommandType.StoredProcedure, osqlParameter);

            //Get Pagination information
            var res = UtilityHelper.GetPaginationInfo(Results);

            DataTableResponseModel oDataTableResponseModel = new DataTableResponseModel(model.draw, res.Item1, res.Item1, Results.DataTableToList<MasterUserListModel>());

            return oDataTableResponseModel;
        }

        public async Task<MasterUserDetailModel> GetById(int id)
        {
            var tableName = Enum.GetName(TableNameEnum.Master_User);  

            var _userEntity = new MasterUserDetailModel();
            _userEntity = _mapperFactory.Get<MasterUser, MasterUserDetailModel>(await _repository.GetAsync(id));
            
            if (_userEntity != null)
            {
                DbParameter[] osqlParameter =
                {
                 new DbParameter(AppConstants.TableKeyId, id, SqlDbType.Int),
                 new DbParameter(AppConstants.TableName,  tableName, SqlDbType.VarChar),
                };
                var UserAddress = EltizamDBHelper.ExecuteMappedReader<MasterUserAddressModel>(ProcedureMetastore.usp_Address_GetAddressByTableKeyId, 
                                  DatabaseConnection.ConnString, System.Data.CommandType.StoredProcedure, osqlParameter);
                if (UserAddress != null)
                {
                    _userEntity.Addresses = UserAddress; 
                }

                DbParameter[] osqlParameter1 =
                {
                    new DbParameter(AppConstants.TableKeyId, id, SqlDbType.Int),
                    new DbParameter(AppConstants.TableName, tableName, SqlDbType.VarChar),
                };
                var UserQualification = EltizamDBHelper.ExecuteMappedReader<Master_QualificationModel>(ProcedureMetastore.usp_Qualification_GetQualificationByTableKeyId, 
                                        DatabaseConnection.ConnString, System.Data.CommandType.StoredProcedure, osqlParameter1);
                if (UserQualification != null)
                {
                    _userEntity.Qualifications = UserQualification; 
                } 

                DbParameter[] osqlParameter2 =
                {
                    new DbParameter(AppConstants.TableKeyId, id, SqlDbType.Int),
                    new DbParameter(AppConstants.TableName,  tableName, SqlDbType.VarChar),
                };

                var UserDocuments = EltizamDBHelper.ExecuteMappedReader<MasterDocumentModel>(ProcedureMetastore.usp_Document_GetDocumentByTableKeyId, 
                                    DatabaseConnection.ConnString, System.Data.CommandType.StoredProcedure, osqlParameter2);
                if (UserDocuments != null)
                {
                    _userEntity.Documents = UserDocuments; 
                }

                if(_userEntity.ProfileAttachmentId != null && _userEntity.ProfileAttachmentId > 0)
                {
                    var profile = _documentRepository.Get(_userEntity.ProfileAttachmentId);
                    if(profile != null)
                    {
                        _userEntity.ProfilePath = profile.FilePath;
                    }
                }
            }

            return _userEntity;
        }

        /// <summary>
        /// User save code
        /// 
        /// </summary>
        /// <param name="entityUser"></param>
        /// <returns></returns>
        public async Task<DBOperation> Upsert(MasterUserModel entityUser)
        {
            //var By = _helper.GetLoggedInUser().UserId;
            if (!string.IsNullOrEmpty(entityUser.Password) && entityUser.Id <= 0)
            {
                entityUser.Password = UtilityHelper.GenerateSHA256String(entityUser.Password);
                entityUser.ConfirmPassowrd = entityUser.Password;
            }
             
            MasterUser objUser;
            MasterAddress objUserAddress;
            MasterQualification objUserQualification;
            MasterDocument objUserDocument;

            string MainTableName = Enum.GetName(TableNameEnum.Master_User); 
            int MainTableKey = entityUser.Id;

            //User details
            if (entityUser.Id > 0)
            {
                //Get current Entiry --AUDITLOGUSER
                MasterUser OldEntity = null; 
                OldEntity = _repository.GetNoTracking(entityUser.Id); 

                objUser = _repository.Get(entityUser.Id);

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
                    objUser.CompanyName = entityUser.CompanyName;
                    objUser.ResourceId = entityUser.ResourceId;
                    objUser.IsActive = entityUser.IsActive; 
                    objUser.RoleId = entityUser.RoleId; 
                    objUser.Email = entityUser.Email;
                    objUser.ModifiedBy = entityUser.ModifiedBy;

                    
                    _repository.UpdateAsync(objUser);  
                    //_repository.UpdateGraph(objUser, EntityState.Modified);
                    await _unitOfWork.SaveChangesAsync();

                    //Do Audit Log --AUDITLOGUSER
                    await _auditLogService.CreateAuditLog<MasterUser>(AuditActionTypeEnum.Update, OldEntity, objUser, MainTableName, MainTableKey); 
                } 
            }
            else
            {
                objUser = _mapperFactory.Get<MasterUserModel, MasterUser>(entityUser);
                objUser.IsActive = entityUser.IsActive;
                objUser.CreatedBy = entityUser.CreatedBy;

                _repository.AddAsync(objUser);
                await _unitOfWork.SaveChangesAsync();
            }
            

            if (objUser.Id == 0)
                return DBOperation.Error;
            else
            {
                if (entityUser.uploadProfile != null)
                {
                    objUserDocument = _mapperFactory.Get<MasterDocumentModel, MasterDocument>(entityUser.uploadProfile);
                    objUserDocument.IsActive = entityUser.uploadProfile.IsActive;
                    objUserDocument.TableKeyId = objUser.Id;
                    objUserDocument.TableName = "User_Profile";
                    objUserDocument.DocumentName = entityUser.uploadProfile.DocumentName;
                    objUserDocument.FileName = entityUser.uploadProfile.FileName;
                    objUserDocument.FilePath = entityUser.uploadProfile.FilePath;
                    objUserDocument.FileType = entityUser.uploadProfile.FileType;
                    objUserDocument.CreatedBy = entityUser.uploadProfile.CreatedBy;

                    _documentRepository.AddAsync(objUserDocument);
                    await _unitOfWork.SaveChangesAsync();

                    var user = _repository.Get(entityUser.Id);
                    user.ProfileAttachmentId = objUserDocument.Id;

                    _repository.UpdateAsync(user);
                    await _unitOfWork.SaveChangesAsync();
                }
                //Address details

                if (entityUser.Addresses.Count > 0)
                {

                    var entityAddressess = _addressRepository.GetAll().Where(x => x.TableKeyId == entityUser.Id && x.TableName == "Master_User" && (x.IsDeleted == false || x.IsDeleted == null)).ToList();
                    var allAddressId = entityAddressess.Count > 0 ? entityAddressess.Select(x => x.Id).OrderBy(Id => Id).ToList() : null;

                    foreach (var address in entityUser.Addresses)
                    {
                        if (address.Id > 0)
                        {
                            if (allAddressId != null && allAddressId.Count > 0)
                            {
                                allAddressId.Remove(address.Id);
                            }
                            //Get current Entiry --AUDITLOGUSER
                            var OldEntity = _addressRepository.GetNoTracking(address.Id);
                            objUserAddress = _addressRepository.Get(address.Id);

                            if (objUserAddress != null)
                            {
                                var entityAddress = _mapperFactory.Get<MasterUserAddressModel, MasterAddress>(address);
                                objUserAddress.Address1 = entityAddress.Address1;
                                objUserAddress.Address1 = entityAddress.Address1;
                                objUserAddress.Address2 = entityAddress.Address2;
                                objUserAddress.Address3 = entityAddress.Address3;
                                objUserAddress.Landmark = entityAddress.Landmark;
                                objUserAddress.PinNo = entityAddress.PinNo;
                                objUserAddress.CountryId = entityAddress.CountryId;
                                objUserAddress.StateId = entityAddress.StateId; ;
                                objUserAddress.CityId = entityAddress.CityId;
                                objUserAddress.PinNo = entityAddress.PinNo;
                                objUserAddress.Email = entityAddress.Email;
                                objUserAddress.AlternateEmail = entityAddress.AlternateEmail;
                                objUserAddress.Phone = entityAddress.Phone;
                                objUserAddress.PhoneExt = entityAddress.PhoneExt;
                                objUserAddress.AlternatePhone = entityAddress.AlternatePhone;
                                objUserAddress.AlternatePhoneExt = entityAddress.AlternatePhoneExt;
                                objUserAddress.Landlinephone = entityAddress.Landlinephone;
                                objUserAddress.IsActive = entityAddress.IsActive;
                                objUserAddress.ModifiedBy = entityUser.ModifiedBy;

                                _addressRepository.UpdateAsync(objUserAddress);
                                //_addressRepository.UpdateGraph(objUserAddress, EntityState.Modified);
                                await _unitOfWork.SaveChangesAsync();

                                //Do Audit Log --AUDITLOGUSER
                                await _auditLogService.CreateAuditLog<MasterAddress>(AuditActionTypeEnum.Update, OldEntity, objUserAddress, MainTableName, MainTableKey);
                            }
                        }
                        else
                        {
                            objUserAddress = _mapperFactory.Get<MasterUserAddressModel, MasterAddress>(address);
                            objUserAddress.IsActive = entityUser.IsActive;
                            objUserAddress.TableKeyId = objUser.Id;
                            objUserAddress.TableName = Enum.GetName(TableNameEnum.Master_User);
                            objUserAddress.CreatedBy = entityUser.CreatedBy;

                            _addressRepository.AddAsync(objUserAddress);
                            await _unitOfWork.SaveChangesAsync();
                        }
                    }
                    if (allAddressId != null && allAddressId.Count > 0)
                    {
                        foreach (var addId in allAddressId)
                        {
                            var entityAdd = _addressRepository.Get(x => x.Id == addId);
                            if (entityAdd != null)
                            {
                                _addressRepository.Remove(entityAdd);
                            }
                        }
                        await _unitOfWork.SaveChangesAsync();
                    }
                } 

                //Qualification details
                if (entityUser.Qualifications.Count > 0)
                {

                    var entityContacts = _qualifyRepository.GetAll().Where(x => x.TableKeyId == entityUser.Id && x.TableName == "Master_User" && (x.IsDeleted == false || x.IsDeleted == null)).ToList();
                    var allContactId = entityContacts.Count > 0 ? entityContacts.Select(x => x.Id).OrderBy(Id => Id).ToList() : null;

                    foreach (var qualify in entityUser.Qualifications)
                    {
                        var Qlfc = qualify;
                        if (Qlfc.Id > 0)
                        {
                            if (allContactId != null && allContactId.Count > 0)
                            {
                                allContactId.Remove(qualify.Id);
                            }
                            //Get current Entiry --AUDITLOGUSER
                            var OldEntity = _qualifyRepository.GetNoTracking(Qlfc.Id);
                            objUserQualification = _qualifyRepository.Get(Qlfc.Id);

                            if (objUserQualification != null)
                            {
                                objUserQualification.Qualification = Qlfc.Qualification;
                                objUserQualification.Subject = Qlfc.Subject;
                                objUserQualification.Institute = Qlfc.Institute;
                                objUserQualification.Grade = Qlfc.Grade;
                                objUserQualification.YearOfInstitute = Qlfc.YearOfInstitute;
                                objUserQualification.IsActive = Qlfc.IsActive;
                                objUserQualification.ModifiedBy = entityUser.ModifiedBy;

                                _qualifyRepository.UpdateAsync(objUserQualification);
                                //_qualifyRepository.UpdateGraph(objUserQualification, EntityState.Modified);
                                await _unitOfWork.SaveChangesAsync();

                                //Do Audit Log --AUDITLOGUSER
                                await _auditLogService.CreateAuditLog<MasterQualification>(AuditActionTypeEnum.Update, OldEntity, objUserQualification, MainTableName, MainTableKey);
                            }
                        }
                        else
                        {
                            objUserQualification = _mapperFactory.Get<Master_QualificationModel, MasterQualification>(qualify);
                            objUserQualification.IsActive = qualify.IsActive;
                            objUserQualification.TableKeyId = objUser.Id;
                            objUserQualification.TableName = Enum.GetName(TableNameEnum.Master_User);
                            objUserQualification.CreatedBy = entityUser.CreatedBy;

                            _qualifyRepository.AddAsync(objUserQualification);
                            await _unitOfWork.SaveChangesAsync();
                        }
                    }
                    if (allContactId != null && allContactId.Count > 0)
                    {
                        foreach (var addId in allContactId)
                        {
                            var entityAdd = _qualifyRepository.Get(x => x.Id == addId);
                            if (entityAdd != null)
                            {
                                _qualifyRepository.Remove(entityAdd);
                            }
                        }
                        await _unitOfWork.SaveChangesAsync();
                    }
                } 

                if (entityUser.uploadDocument != null)
                {
                    foreach (var doc in entityUser.uploadDocument)
                    {
                        objUserDocument = _mapperFactory.Get<MasterDocumentModel, MasterDocument>(doc);
                        objUserDocument.IsActive = doc.IsActive;
                        objUserDocument.TableKeyId = objUser.Id;
                        objUserDocument.TableName = Enum.GetName(TableNameEnum.Master_User);
                        objUserDocument.DocumentName = doc.DocumentName;
                        objUserDocument.FileName = doc.FileName;
                        objUserDocument.FilePath = doc.FilePath;
                        objUserDocument.FileType = doc.FileType; 
                        objUserDocument.CreatedBy = doc.CreatedBy;

                        _documentRepository.AddAsync(objUserDocument);
                        await _unitOfWork.SaveChangesAsync();
                    } 
                } 
            }

            return DBOperation.Success;
        }

        public async Task<List<MasterResourceTypeModel>> GetResourceTypeList()
        { 
            var lstStf = EltizamDBHelper.ExecuteMappedReader<MasterResourceTypeModel>(ProcedureMetastore.usp_ResourceType_AllList,
             DatabaseConnection.ConnString, CommandType.StoredProcedure, null);

            return lstStf;
        }
        public async Task<List<MasterRoleModel>> GetRoleList()
        {
            var lId = _helper.GetLoggedInUser()?.UserId;

            var lstStf = EltizamDBHelper.ExecuteMappedReader<MasterRoleModel>(ProcedureMetastore.usp_Role_AllList,
             DatabaseConnection.ConnString, CommandType.StoredProcedure, null);

            return lstStf;
        }

        public async Task<DBOperation> Delete(int id)
        {
            var entityUser = _repository.Get(x => x.Id == id);
            if (entityUser == null)
                return DBOperation.NotFound;
            else
            {
                var entityLocation = _addressRepository.Get(x => x.TableKeyId == id && x.TableName == "Master_User");
                if (entityLocation != null)
                    _addressRepository.Remove(entityLocation);

                var entityContact = _documentRepository.Get(x => x.TableKeyId == id && x.TableName == "Master_User");
                if (entityContact != null)
                    _documentRepository.Remove(entityContact);

                _repository.Remove(entityUser);

                await _unitOfWork.SaveChangesAsync();

                // Return a success operation indicating successful deletion.
                return DBOperation.Success;
            }
        }

        public async Task<DBOperation> ChangePassword(ChangePasswordModel entityUser)
        {   
            if (entityUser.UserId >= 0 && entityUser.NewPassword == entityUser.ConfirmPassword)
            {
                entityUser.NewPassword = Utility.Utility.UtilityHelper.GenerateSHA256String(entityUser.NewPassword);
                entityUser.ConfirmPassword = entityUser.NewPassword;
            }

            MasterUser objUser;
            if (entityUser.UserId > 0)
            {
                objUser = _repository.Get(entityUser.UserId);
                var OldObjUser = objUser;
                if (objUser != null)
                {
                    objUser.Password = entityUser.NewPassword;

                    objUser.ModifiedBy = _LoginUserId;
                    objUser.ModifiedDate = AppConstants.DateTime;
                    _repository.UpdateAsync(objUser);
                   // _repository.UpdateGraph(objUser, EntityState.Modified);

                    await _unitOfWork.SaveChangesAsync();
                }
                else
                {
                    return DBOperation.NotFound;
                }
            }
            
            return DBOperation.Success;
        }

        public async Task<List<MasterUserListModel>> GetApproverList(int id, string roleName)
        {
            DbParameter[] osqlParameter1 = 
            {
                 new DbParameter("UserId", id, SqlDbType.Int),
                 new DbParameter("RoleName", roleName, SqlDbType.VarChar)
            };

            var lstStf = EltizamDBHelper.ExecuteMappedReader<MasterUserListModel>(ProcedureMetastore.usp_Approver_AllList,
                         DatabaseConnection.ConnString, CommandType.StoredProcedure, osqlParameter1);

            return lstStf;
        }

        /// <summary>
        /// Get Footer by Table Name, Key
        /// </summary>
        /// <param name="TableKeyId"></param>
        /// <param name="TableName"></param>
        /// <returns></returns>
        public async Task<GlobalAuditFields?> GetGlobalAuditFields(int TableKeyId, string TableName)
        {
            DbParameter[] p1 =
            {
                 new DbParameter(AppConstants.TableKeyId, TableKeyId, SqlDbType.Int),
                 new DbParameter(AppConstants.TableName, TableName, SqlDbType.VarChar)
            };

            var data = EltizamDBHelper.ExecuteSingleMappedReader<GlobalAuditFields>(ProcedureMetastore.usp_GetPageFooterDetails,
                       DatabaseConnection.ConnString, CommandType.StoredProcedure, p1);
            data.TableName = TableName;

            return data;
        }

        public async Task<List<MasterUserModel>> GetAllUserList()
        {

            var lstStf = EltizamDBHelper.ExecuteMappedReader<MasterUserModel>(ProcedureMetastore.usp_User_AllList,
             DatabaseConnection.ConnString, CommandType.StoredProcedure, null);

            return lstStf;
        }

        public async Task<DBOperation> DeleteDocument(int id)
        {
            if(id > 0){
               
                var entityDoc = _documentRepository.Get(id);
                if (entityDoc != null)
                {
                    _documentRepository.Remove(entityDoc);
                    await _unitOfWork.SaveChangesAsync();
                }
            }
            // Return a success operation indicating successful deletion.
            return DBOperation.Success;
        }

    }
}