using Eltizam.Business.Core.Interface;
using Eltizam.Business.Core.ModelMapper;
using Eltizam.Business.Models;
using Eltizam.Data.DataAccess.Core.Repositories;
using Eltizam.Data.DataAccess.Core.UnitOfWork;
using Eltizam.Data.DataAccess.Entity;
using Eltizam.Data.DataAccess.Helper;
using Eltizam.Resource;
using Eltizam.Utility;
using Eltizam.Utility.Enums;
using Eltizam.Utility.Utility;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Internal;
using Microsoft.Extensions.Localization;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using static Eltizam.Utility.Enums.GeneralEnum;

namespace Eltizam.Business.Core.Implementation
{
    public class MasterVendorService : IMasterVendorService
    {
        #region Properties
        private readonly IUnitOfWork _unitOfWork;
        private readonly IMapperFactory _mapperFactory;
        private readonly Microsoft.Extensions.Configuration.IConfiguration configuration;
        private IRepository<MasterVendor> _repository { get; set; }
        private IRepository<MasterContact> _repositoryContact { get; set; }
        private IRepository<MasterAddress> _repositoryAddress { get; set; }
        private IRepository<MasterDocument> _documentRepository { get; set; }
        private readonly IAuditLogService _auditLogService;
        private readonly IHelper _helper;
        private readonly string _dbConnection;
        #endregion Properties

        #region Constructor
        public MasterVendorService(IUnitOfWork unitOfWork, IMapperFactory mapperFactory, IAuditLogService auditLogService,
          IHelper helper,
           Microsoft.Extensions.Configuration.IConfiguration _configuration)
        {
            _unitOfWork = unitOfWork;
            _mapperFactory = mapperFactory;

            _repository = _unitOfWork.GetRepository<MasterVendor>();
            _repositoryContact = _unitOfWork.GetRepository<MasterContact>();
            _repositoryAddress = _unitOfWork.GetRepository<MasterAddress>();
            configuration = _configuration;
            _helper = helper;
            _auditLogService = auditLogService;
            _dbConnection = DatabaseConnection.ConnString;
            _documentRepository = _unitOfWork.GetRepository<MasterDocument>();
        }
        #endregion Constructor


        #region API Methods

        /// <summary>
        /// Description - To Login User and return JWT Token String
        /// </summary>
        /// <param name="User"></param>
        /// <returns></returns>
        /// <response code="200">OK</response>
        /// <response code="400">Bad Request</response>
        /// <response code="403">Forbidden</response>
        /// <response code="404">Not Found</response>
        /// <response code="405">Method Not Allowed</response>
        /// <response code="415">Unsupported Media Type</response>
        /// <response code="500">Internal Server</response>
        /// 


        public async Task<MasterVendorModel> GetMasterVendorByIdAsync(int id)
        {
            // Use a mapper to map the data from the repository to the model asynchronously.
            var masterVendor = new MasterVendorModel();
            masterVendor = _mapperFactory.Get<MasterVendor, MasterVendorModel>(await _repository.GetAsync(id));
            var tableName = Enum.GetName(TableNameEnum.Master_Vendor);

            if (masterVendor != null)
            {
                DbParameter[] osqlParameter = 
                {
                 new DbParameter(AppConstants.TableKeyId, id, SqlDbType.Int),
                 new DbParameter(AppConstants.TableName, tableName, SqlDbType.VarChar),
                };

                var Address = EltizamDBHelper.ExecuteMappedReader<MasterAddressEntity>(ProcedureMetastore.usp_Address_GetAddressByTableKeyId, DatabaseConnection.ConnString, System.Data.CommandType.StoredProcedure, osqlParameter);
                if (Address != null)
                {
                    masterVendor.Addresses = Address;

                }

                DbParameter[] osqlParameter1 = 
                {
                 new DbParameter(AppConstants.TableKeyId, id, SqlDbType.Int),
                 new DbParameter(AppConstants.TableName, tableName, SqlDbType.VarChar),
                };


                var contacts = EltizamDBHelper.ExecuteMappedReader<MasterContactModel>(ProcedureMetastore.usp_Contact_GetContactByTableKeyId, DatabaseConnection.ConnString, System.Data.CommandType.StoredProcedure, osqlParameter1);
                if (contacts != null)
                {
                    masterVendor.Contacts = contacts; 
                }

                if (masterVendor.ProfileAttachmentId != null && masterVendor.ProfileAttachmentId > 0)
                {
                    var profile = _documentRepository.Get(masterVendor.ProfileAttachmentId);
                    if (profile != null)
                    {
                        masterVendor.ProfilePath = profile.FilePath;
                    }
                }
            }

            // Return all objects as a tuple.
            return masterVendor;
        }



        public async Task<DataTableResponseModel> GetAll(DataTableAjaxPostModel model)
        {
            string ColumnName = (model.order.Count > 0 ? model.columns[model.order[0].column].data : string.Empty);
            string SortDir = (model.order.Count > 0 ? model.order[0].dir : string.Empty);  

            SqlParameter[] osqlParameter =
            {
                new SqlParameter(AppConstants.P_CurrentPageNumber,  model.start),
                new SqlParameter(AppConstants.P_PageSize,           model.length),
                new SqlParameter(AppConstants.P_SortColumn,         ColumnName),
                new SqlParameter(AppConstants.P_SortDirection,      SortDir),
                new SqlParameter(AppConstants.P_SearchText,         model.search?.value)
            };

            var Results = await _repository.GetBySP(ProcedureMetastore.usp_Vendor_Search_GetVendorList, CommandType.StoredProcedure, osqlParameter); 

            //Get Pagination information
            var res = UtilityHelper.GetPaginationInfo(Results); 

            DataTableResponseModel oDataTableResponseModel = new DataTableResponseModel(model.draw, res.Item1, res.Item1, Results.DataTableToList<VendorListModel>());

            return oDataTableResponseModel;
        }

        public async Task<DBOperation> AddUpdateMasterVendor(MasterVendorModel masterVendortModel)
        {
           // Create MasterClient and MasterClientContact objects.
            MasterVendor objVendor;
            MasterAddress objAddress;
            MasterContact objContact;
            MasterDocument objUserDocument;

            string MainTableName = Enum.GetName(TableNameEnum.Master_Vendor);
            int MainTableKey = masterVendortModel.Id;

            // Check if the entity has an ID greater than 0 (indicating an update).
            if (masterVendortModel.Id > 0)
            {
                // Get the existing entity from the repository.
                MasterVendor OldEntity = null;
                OldEntity = _repository.GetNoTracking(masterVendortModel.Id);

                objVendor = _repository.Get(masterVendortModel.Id);

                // If the entity exists, update its properties.
                if (objVendor != null)
                {
                    objVendor = _mapperFactory.Get<MasterVendorModel, MasterVendor>(masterVendortModel);
                    objVendor.VendorName = masterVendortModel.VendorName;
                    objVendor.CompanyName = masterVendortModel.CompanyName;
                    objVendor.EstimattionDate = masterVendortModel.EstimattionDate;
                    objVendor.BusinessType = masterVendortModel.BusinessType;
                    objVendor.CompanyDescription = masterVendortModel.CompanyDescription;
                    objVendor.Status = masterVendortModel.Status;
                    objVendor.ModifiedBy = masterVendortModel.ModifiedBy;

                    // Update the entity in the repository asynchronously.
                    _repository.UpdateAsync(objVendor);

                    //_repository.UpdateGraph(objVendor, EntityState.Modified);
                    await _unitOfWork.SaveChangesAsync();
                    //Do Audit Log --AUDITLOGUSER
                    await _auditLogService.CreateAuditLog<MasterVendor>(AuditActionTypeEnum.Update, OldEntity, objVendor, MainTableName, MainTableKey);
                }
              
                else
                {
                    // Return a not found operation if the entity does not exist.
                    return DBOperation.NotFound;
                }
            }
            else
            {
                
                // Create a new MasterClient entity from the model for insertion.
                objVendor = _mapperFactory.Get<MasterVendorModel, MasterVendor>(masterVendortModel);
                objVendor.CreatedDate = AppConstants.DateTime;
                objVendor.CreatedBy = masterVendortModel.CreatedBy;
                // Insert the new entity into the repository asynchronously.
                _repository.AddAsync(objVendor);
                // Save changes to the database asynchronously.
                await _unitOfWork.SaveChangesAsync();
            }

            // Check if objClient.Id is 0, which would indicate an error in saving.
            if (objVendor.Id == 0)
                return DBOperation.Error;

            else
            {

                if (masterVendortModel.uploadProfile != null)
                {
                    objUserDocument = _mapperFactory.Get<MasterDocumentModel, MasterDocument>(masterVendortModel.uploadProfile);
                    objUserDocument.IsActive = masterVendortModel.uploadProfile.IsActive;
                    objUserDocument.TableKeyId = objVendor.Id;
                    objUserDocument.TableName = "Vendor_Master";
                    objUserDocument.DocumentName = masterVendortModel.uploadProfile.DocumentName;
                    objUserDocument.FileName = masterVendortModel.uploadProfile.FileName;
                    objUserDocument.FilePath = masterVendortModel.uploadProfile.FilePath;
                    objUserDocument.FileType = masterVendortModel.uploadProfile.FileType;
                    objUserDocument.CreatedBy = masterVendortModel.uploadProfile.CreatedBy;

                    _documentRepository.AddAsync(objUserDocument);
                    await _unitOfWork.SaveChangesAsync();



                    var user = _repository.Get(objVendor.Id);
                    user.ProfileAttachmentId = objUserDocument.Id;

                    _repository.UpdateAsync(user);
                    await _unitOfWork.SaveChangesAsync();
                }
                if (masterVendortModel.Addresses.Count > 0)
                {
                    foreach (var address in masterVendortModel.Addresses)
                    {
                        if (address.Id > 0)
                        {
                            var OldEntity = _repositoryAddress.GetNoTracking(address.Id);

                            objAddress = _repositoryAddress.Get(address.Id);
                            if (objAddress != null)
                            {
                                var entityAddress = _mapperFactory.Get<MasterAddressEntity, MasterAddress>(address);
                                objAddress.Address1 = entityAddress.Address1;
                                objAddress.Address1 = entityAddress.Address1;
                                objAddress.Address2 = entityAddress.Address2;
                                objAddress.Address3 = entityAddress.Address3;
                                objAddress.Landmark = entityAddress.Landmark;
                                objAddress.PinNo = entityAddress.PinNo;
                                objAddress.CountryId = entityAddress.CountryId;
                                objAddress.StateId = entityAddress.StateId;
                                objAddress.CityId = entityAddress.CityId;
                                objAddress.PinNo = entityAddress.PinNo;
                                objAddress.Email = entityAddress.Email;
                                objAddress.AlternateEmail = entityAddress.AlternateEmail;
                                objAddress.PhoneExt = entityAddress.PhoneExt;
                                objAddress.Phone = entityAddress.Phone;
                                objAddress.AlternatePhone = entityAddress.AlternatePhone;
                                objAddress.AlternatePhoneExt = entityAddress.AlternatePhoneExt;
                                objAddress.Landlinephone = entityAddress.Landlinephone;
                                objAddress.IsActive = entityAddress.IsActive;
                                objAddress.ModifiedBy = masterVendortModel.ModifiedBy;
                                _repositoryAddress.UpdateAsync(objAddress);
                                //_repositoryAddress.UpdateGraph(objAddress, EntityState.Modified);
                                await _unitOfWork.SaveChangesAsync();

                                //Do Audit Log --AUDITLOGUSER
                                await _auditLogService.CreateAuditLog<MasterAddress>(AuditActionTypeEnum.Update, OldEntity, objAddress, MainTableName, MainTableKey);
                            }
                        }
                        else
                        {
                            objAddress = _mapperFactory.Get<MasterAddressEntity, MasterAddress>(address);
                            //objAddress.IsActive = masterVendortModel.IsActive;
                            objAddress.TableKeyId = objVendor.Id;
                            objAddress.TableName = "Master_Vendor";
                            objAddress.CreatedBy = masterVendortModel.CreatedBy;
                            _repositoryAddress.AddAsync(objAddress);
                            await _unitOfWork.SaveChangesAsync();

                        }
                    }
                }
                if (masterVendortModel.Contacts.Count > 0)
                {
                    foreach (var contact in masterVendortModel.Contacts)
                    {
                        if (contact.Id > 0)
                        {
                            var OldEntity = _repositoryContact.GetNoTracking(contact.Id);

                            objContact = _repositoryContact.Get(contact.Id);
                            if (objContact != null)
                            {
                                var entityAddress = _mapperFactory.Get<MasterContactModel, MasterContact>(contact);

                                objContact.ContactPersonName = entityAddress.ContactPersonName;
                                objContact.DepartmentId = entityAddress.DepartmentId;
                                objContact.DesignationId = entityAddress.DesignationId;
                                objContact.Email = entityAddress.Email;
                                objContact.MobileExt = entityAddress.MobileExt;
                                objContact.Mobile = entityAddress.Mobile;
                                objContact.Status = entityAddress.Status;
                                objContact.ModifiedBy = masterVendortModel.ModifiedBy;
                                _repositoryContact.UpdateAsync(objContact);
                                //_repositoryContact.UpdateGraph(objContact, EntityState.Modified);
                                await _unitOfWork.SaveChangesAsync();

                                //Do Audit Log --AUDITLOGUSER
                                await _auditLogService.CreateAuditLog<MasterContact>(AuditActionTypeEnum.Update, OldEntity, objContact, MainTableName, MainTableKey);
                            }
                        }
                        else
                        {
                            // Create a new MasterClientContact entity from the model for insertion.
                            objContact = _mapperFactory.Get<MasterContactModel, MasterContact>(contact);
                            objContact.CreatedDate = AppConstants.DateTime;
                            objContact.TableKeyId = objVendor.Id;
                            objContact.TableName = "Master_Vendor";
                            objContact.ModifiedBy = masterVendortModel.CreatedBy;
                            _repositoryContact.AddAsync(objContact);
                            // Insert the new entity into the repository asynchronously.
                            await _unitOfWork.SaveChangesAsync();
                        }
                    }
                }
            }

            return DBOperation.Success;
        }


        public async Task<DBOperation> DeleteVendor(int id)
        {
            // Get the entity to be deleted from the repository.
            var entityUser = _repository.Get(x => x.Id == id);

            // If the entity does not exist, return a not found operation.
            if (entityUser == null)
                return DBOperation.NotFound;
            else
            {
                var entityLocation = _repositoryAddress.GetAll().Where(x => x.TableKeyId == id && x.TableName == "Master_Client").ToList();
                if (entityLocation.Count > 0)
                {
                    foreach (var addrs in entityLocation)
                    {
                        _repositoryAddress.Remove(addrs);
                    }
                }
                var entityContact = _repositoryContact.GetAll().Where(x => x.TableKeyId == id && x.TableName == "Master_Client").ToList();
                if (entityContact.Count > 0)
                {
                    foreach (var contct in entityContact)
                    {
                        _repositoryContact.Remove(contct);
                    }
                }

                _repository.Remove(entityUser);

                await _unitOfWork.SaveChangesAsync();

                // Return a success operation indicating successful deletion.
                return DBOperation.Success;
            }
        }


        #endregion API Methods
    }
}
