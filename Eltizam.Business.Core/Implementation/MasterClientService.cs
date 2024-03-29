﻿using Eltizam.Business.Core.Interface;
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
    public class MasterClientService : IMasterClientService
    {
        #region Properties
        private readonly IUnitOfWork _unitOfWork;
        private readonly IMapperFactory _mapperFactory;
        private readonly IStringLocalizer<Errors> _stringLocalizerError;
        private readonly Microsoft.Extensions.Configuration.IConfiguration configuration;
        private IRepository<MasterClient> _repository { get; set; }
        private IRepository<MasterAddress> _repositoryAddress { get; set; }
        private IRepository<MasterContact> _repositoryContact { get; set; }
        private IRepository<MasterDocument> _repositoryDocument { get; set; }
        private readonly IAuditLogService _auditLogService;
        private readonly IHelper _helper;
        private readonly string _dbConnection;
        #endregion Properties

        #region Constructor
        public MasterClientService(IUnitOfWork unitOfWork, IMapperFactory mapperFactory, IStringLocalizer<Errors> stringLocalizerError, IAuditLogService auditLogService,
          IHelper helper,
           Microsoft.Extensions.Configuration.IConfiguration _configuration)
        {
            _unitOfWork = unitOfWork;
            _mapperFactory = mapperFactory;

            _repository = _unitOfWork.GetRepository<MasterClient>();
            _repositoryAddress = _unitOfWork.GetRepository<MasterAddress>();
            _repositoryContact = _unitOfWork.GetRepository<MasterContact>();
            _repositoryDocument = _unitOfWork.GetRepository<MasterDocument>();
            configuration = _configuration;
            _helper = helper;
            _auditLogService = auditLogService;

            _dbConnection = DatabaseConnection.ConnString;
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

        public async Task<MasterClientModel> GetMasterClientByIdAsync(int id)
        {
            // Create a new Master_PropertyTypeModel instance.
            var _clientEntity = new MasterClientModel();
            _clientEntity = _mapperFactory.Get<MasterClient, MasterClientModel>(await _repository.GetAsync(id));
            var tableName = Enum.GetName(TableNameEnum.Master_Client);

            if (_clientEntity != null)
            {
                DbParameter[] osqlParameter =
                {
                     new DbParameter(AppConstants.TableKeyId, id, SqlDbType.Int),
                     new DbParameter(AppConstants.TableName,  tableName, SqlDbType.VarChar),
                };
                var UserAddress = EltizamDBHelper.ExecuteSingleMappedReader<MasterAddressEntity>(ProcedureMetastore.usp_Address_GetAddressByTableKeyId, _dbConnection, System.Data.CommandType.StoredProcedure, osqlParameter);
                
                if (UserAddress != null) 
                    _clientEntity.Address = UserAddress;


                DbParameter[] osqlParameter1 =
                {
                 new DbParameter(AppConstants.TableKeyId, id, SqlDbType.Int),
                 new DbParameter(AppConstants.TableName, tableName, SqlDbType.VarChar),
                };

                var contacts = EltizamDBHelper.ExecuteSingleMappedReader<MasterContactModel>(ProcedureMetastore.usp_Contact_GetContactByTableKeyId, DatabaseConnection.ConnString, System.Data.CommandType.StoredProcedure, osqlParameter1);
                if (contacts != null)
                {
                    _clientEntity.Contact = contacts;
                }

                DbParameter[] osqlParameter2 = 
                {
                 new DbParameter(AppConstants.TableKeyId, id, SqlDbType.Int),
                 new DbParameter(AppConstants.TableName,  tableName, SqlDbType.VarChar),
                };

                var UserDocuments = EltizamDBHelper.ExecuteMappedReader<MasterDocumentModel>(ProcedureMetastore.usp_Document_GetDocumentByTableKeyId, _dbConnection, System.Data.CommandType.StoredProcedure, osqlParameter2);
                if (UserDocuments != null) 
                    _clientEntity.Documents = UserDocuments;  
            }

            return _clientEntity;
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

            var Results = await _repository.GetBySP(ProcedureMetastore.usp_Client_Search_GetClientList, System.Data.CommandType.StoredProcedure, osqlParameter);

            var res = UtilityHelper.GetPaginationInfo(Results);
            DataTableResponseModel oDataTableResponseModel = new DataTableResponseModel(model.draw, res.Item1, res.Item1, Results.DataTableToList<MasterClientListModel>());

            return oDataTableResponseModel;
            // Get the column name and sort direction for data table sorting.
            //var _dbParams = new[]
            // {
            //     new DbParameter("ClientId", 0,SqlDbType.Int),
            //     new DbParameter("PageSize", model.length, SqlDbType.Int),
            //     new DbParameter("PageNumber", model.start, SqlDbType.Int),
            //     new DbParameter("OrderClause", "ClientName", SqlDbType.VarChar),
            //     new DbParameter("ReverseSort", 1, SqlDbType.Int)
            // };

            //int _count = 0;
            //var lstStf = FJDBHelper.ExecuteMappedReaderWithOutputParameter<Master_ClientModel>(ProcedureNameCall.usp_Client_SearchAllList,

            // DatabaseConnection.EltizamDatabaseConnection, out _count, CommandType.StoredProcedure, _dbParams);


            //DataTableResponseModel oDataTableResponseModel = new DataTableResponseModel(model.draw, _count, 0, lstStf);

            //return oDataTableResponseModel;
        }

        public async Task<DBOperation> AddUpdateMasterClient(MasterClientModel master_ClientModel)
        {
            var By = _helper.GetLoggedInUser().UserId;
            // Create MasterClient and MasterClientContact objects.
            MasterClient objClient;
            MasterAddress objAddress;
            MasterContact objContact;
            MasterDocument objDocument;

            string MainTableName = Enum.GetName(TableNameEnum.Master_Client);
            int MainTableKey = master_ClientModel.Id;

            // Check if the entity has an ID greater than 0 (indicating an update).
            if (master_ClientModel.Id > 0)
            {
                // Get the existing entity from the repository.
                MasterClient OldEntity = null;
                OldEntity = _repository.GetNoTracking(master_ClientModel.Id);

                objClient = _repository.Get(master_ClientModel.Id);

                // If the entity exists, update its properties.
                if (objClient != null)
                {
                    objClient = _mapperFactory.Get<MasterClientModel, MasterClient>(master_ClientModel);
                    objClient.FirstName = master_ClientModel.FirstName;
                    objClient.MiddleName = master_ClientModel.MiddleName;
                    objClient.LastName = master_ClientModel.LastName;
                    objClient.ClientTypeId = master_ClientModel.ClientTypeId;
                    objClient.Trnnumber = master_ClientModel.Trnnumber;
                    objClient.TrnexpiryDate = master_ClientModel.TrnexpiryDate;
                    objClient.LicenseNumber = master_ClientModel.LicenseNumber;
                    objClient.IsActive = master_ClientModel.IsActive;
                    objClient.Logo = master_ClientModel.Logo;
                    objClient.ModifiedDate = AppConstants.DateTime; 
                    objClient.ModifiedBy = master_ClientModel.ModifiedBy ?? By;

                    // Update the entity in the repository asynchronously.
                    _repository.UpdateAsync(objClient);

                    _repository.UpdateGraph(objClient, EntityState.Modified);
                    await _unitOfWork.SaveChangesAsync();
                    //Do Audit Log --AUDITLOGUSER
                    await _auditLogService.CreateAuditLog<MasterClient>(AuditActionTypeEnum.Update, OldEntity, objClient);
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
                objClient = _mapperFactory.Get<MasterClientModel, MasterClient>(master_ClientModel);
                objClient.CreatedDate = AppConstants.DateTime;
                objClient.ModifiedBy = master_ClientModel.CreatedBy ?? By; 

                // Insert the new entity into the repository asynchronously.
                _repository.AddAsync(objClient);
                await _unitOfWork.SaveChangesAsync();
            }

            // Check if objClient.Id is 0, which would indicate an error in saving.
            if (objClient.Id == 0)
            {
                return DBOperation.Error;
            }
            else
            {

                if (master_ClientModel.Address.Id > 0)
                {
                    //Get current Entiry --AUDITLOGUSER
                    var OldEntity = _repositoryAddress.GetNoTracking(master_ClientModel.Address.Id);

                    objAddress = _repositoryAddress.Get(master_ClientModel.Address.Id);
                    if (objAddress != null)
                    {
                        var entityAddress = _mapperFactory.Get<MasterAddressEntity, MasterAddress>(master_ClientModel.Address);
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
                        objAddress.Phone = entityAddress.Phone;
                        objAddress.AlternatePhone = entityAddress.AlternatePhone;
                        objAddress.Landlinephone = entityAddress.Landlinephone;
                        objAddress.IsActive = entityAddress.IsActive;
                        objAddress.ModifiedBy = master_ClientModel.ModifiedBy ?? By;
                        _repositoryAddress.UpdateAsync(objAddress);

                        _repositoryAddress.UpdateGraph(objAddress, EntityState.Modified);
                        await _unitOfWork.SaveChangesAsync();

                        //Do Audit Log --AUDITLOGUSER
                        await _auditLogService.CreateAuditLog<MasterAddress>(AuditActionTypeEnum.Update, OldEntity, objAddress, MainTableName, MainTableKey);
                    }
                }
                else
                {
                    // Create a new MasterClientContact entity from the model for insertion.
                    objAddress = _mapperFactory.Get<MasterAddressEntity, MasterAddress>(master_ClientModel.Address);
                    objAddress.TableKeyId = objClient.Id; // Associate with the MasterClient entity.
                    objAddress.TableName = Enum.GetName(TableNameEnum.Master_Client);
                    objAddress.CreatedBy = master_ClientModel.CreatedBy ?? By;
                    _repositoryAddress.AddAsync(objAddress);
                    // Insert the new entity into the repository asynchronously.
                    await _unitOfWork.SaveChangesAsync();

                }

                if (master_ClientModel.Contact.Id > 0)
                {
                    var OldEntity = _repositoryContact.GetNoTracking(master_ClientModel.Contact.Id);

                    objContact = _repositoryContact.Get(master_ClientModel.Contact.Id);
                    if (objContact != null)
                    {
                        var entityAddress = _mapperFactory.Get<MasterContactModel, MasterContact>(master_ClientModel.Contact);

                        objContact.ContactPersonName = entityAddress.ContactPersonName;
                        objContact.DepartmentId = entityAddress.DepartmentId;
                        objContact.DesignationId = entityAddress.DesignationId;
                        objContact.Email = entityAddress.Email;
                        objContact.Mobile = entityAddress.Mobile;
                        objContact.Status = entityAddress.Status;
                        objContact.ModifiedBy = master_ClientModel.ModifiedBy ?? By;
                        _repositoryContact.UpdateAsync(objContact);
                        _repositoryContact.UpdateGraph(objContact, EntityState.Modified);
                        await _unitOfWork.SaveChangesAsync();

                        //Do Audit Log --AUDITLOGUSER
                        await _auditLogService.CreateAuditLog<MasterContact>(AuditActionTypeEnum.Update, OldEntity, objContact, MainTableName, MainTableKey);
                    }
                }
                else
                {
                    // Create a new MasterClientContact entity from the model for insertion.
                    objContact = _mapperFactory.Get<MasterContactModel, MasterContact>(master_ClientModel.Contact);
                    objContact.CreatedDate = AppConstants.DateTime;
                    objContact.TableKeyId = objClient.Id;
                    objContact.TableName = Enum.GetName(TableNameEnum.Master_Client);
                    objContact.ModifiedBy = master_ClientModel.CreatedBy ?? By;
                    _repositoryContact.AddAsync(objContact);
                    // Insert the new entity into the repository asynchronously.
                    await _unitOfWork.SaveChangesAsync();
                }
                if (master_ClientModel.uploadDocument != null)
                {
                    foreach (var doc in master_ClientModel.uploadDocument)
                    {
                        objDocument = _mapperFactory.Get<MasterDocumentModel, MasterDocument>(doc);
                        objDocument.IsActive = doc.IsActive;
                        objDocument.TableKeyId = master_ClientModel.Id;
                        objDocument.TableName = Enum.GetName(TableNameEnum.Master_Client);
                        objDocument.DocumentName = doc.DocumentName;
                        objDocument.FileName = doc.FileName;
                        objDocument.FilePath = doc.FilePath;
                        objDocument.FileType = doc.FileType;
                        objDocument.CreatedBy = master_ClientModel.CreatedBy ?? By;
                        _repositoryDocument.AddAsync(objDocument);
                    }
                    await _unitOfWork.SaveChangesAsync();
                }
                try
                {
                    // Save changes to the database asynchronously.
                    await _unitOfWork.SaveChangesAsync();
                }
                catch (Exception ex)
                {
                    throw ex;
                }
            }

            return DBOperation.Success;
        }


        public async Task<DBOperation> DeleteClient(int id)
        {
            // Get the entity to be deleted from the repository.
            var entityUser = _repository.Get(x => x.Id == id);

            // If the entity does not exist, return a not found operation.
            if (entityUser == null)
                return DBOperation.NotFound;
            else
            {
                DbParameter[] osqlParameter = 
                {
                 new DbParameter(AppConstants.TableKeyId, id,                      SqlDbType.Int),
                 new DbParameter(AppConstants.TableName,  Enum.GetName(TableNameEnum.Master_Client), SqlDbType.VarChar),
                };

                int result = EltizamDBHelper.ExecuteSingleMappedReader<int>(ProcedureMetastore.usp_Client_DeleteContactByClientId, _dbConnection, System.Data.CommandType.StoredProcedure, osqlParameter);
                if (result > 0)
                {

                }
            }
            // Remove the entity from the repository.
            _repository.Remove(entityUser);

            // Save changes to the database asynchronously.
            await _unitOfWork.SaveChangesAsync();

            // Return a success operation indicating successful deletion.
            return DBOperation.Success;
        }

        public async Task<List<MasterClientModel>> GetMasterClientByClientTypeIdAsync(int ClientTypeId)
        {
            // Create a new Master_PropertyTypeModel instance.
            var _Clients = new List<MasterClientModel>();

            var res = _repository.GetAllAsync(x => x.ClientTypeId == ClientTypeId && x.IsActive == true).Result.ToList();

            // Use a mapper to map the data from the repository to the model asynchronously.
            _Clients = _mapperFactory.GetList<MasterClient, MasterClientModel>(res);

            // Return the mapped entity.
            return _Clients;
        }

        #endregion API Methods
    }
}
