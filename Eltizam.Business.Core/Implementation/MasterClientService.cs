using Eltizam.Business.Core.Interface;
using Eltizam.Business.Core.ModelMapper;
using Eltizam.Business.Models;
using Eltizam.Data.DataAccess.Core.Repositories;
using Eltizam.Data.DataAccess.Core.UnitOfWork;
using Eltizam.Data.DataAccess.Entity;
using Eltizam.Data.DataAccess.Helper;
using Eltizam.Resource;
using Eltizam.Utility;
using Eltizam.Utility.Utility;
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
        private IRepository<MasterDocument> _repositoryDocument { get; set; }
        private readonly IHelper _helper;
        private readonly string _dbConnection;
        #endregion Properties

        #region Constructor
        public MasterClientService(IUnitOfWork unitOfWork, IMapperFactory mapperFactory, IStringLocalizer<Errors> stringLocalizerError,
          IHelper helper,
           Microsoft.Extensions.Configuration.IConfiguration _configuration)
        {
            _unitOfWork = unitOfWork;
            _mapperFactory = mapperFactory;

            _repository = _unitOfWork.GetRepository<MasterClient>();
            _repositoryAddress = _unitOfWork.GetRepository<MasterAddress>();
            _repositoryDocument = _unitOfWork.GetRepository<MasterDocument>();
            configuration = _configuration;
            _helper = helper;

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
           
            if (_clientEntity != null)
            {
                DbParameter[] osqlParameter =
                {
                     new DbParameter(AppConstants.TableKeyId, id, SqlDbType.Int),
                     new DbParameter(AppConstants.TableName,  TableName.Master_Client, SqlDbType.VarChar),
                };
                var UserAddress = EltizamDBHelper.ExecuteSingleMappedReader<MasterAddressEntity>(ProcedureMetastore.usp_Address_GetAddressByTableKeyId, _dbConnection, System.Data.CommandType.StoredProcedure, osqlParameter);
                
                if (UserAddress != null) 
                    _clientEntity.Address = UserAddress;   

                DbParameter[] osqlParameter2 = 
                {
                 new DbParameter(AppConstants.TableKeyId, id, SqlDbType.Int),
                 new DbParameter(AppConstants.TableName, TableName.Master_Client, SqlDbType.VarChar),
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
            // Create MasterClient and MasterClientContact objects.
            MasterClient objClient;
            MasterAddress objAddress;
            MasterDocument objDocument;

            // Check if the entity has an ID greater than 0 (indicating an update).
            if (master_ClientModel.Id > 0)
            {
                // Get the existing entity from the repository.
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
                    objClient.ModifiedBy = master_ClientModel.CreatedBy;

                    // Update the entity in the repository asynchronously.
                    _repository.UpdateAsync(objClient);
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
                objClient.CreatedBy = master_ClientModel.CreatedBy;
                objClient.ModifiedDate = AppConstants.DateTime;
                objClient.ModifiedBy = master_ClientModel.CreatedBy;

                // Insert the new entity into the repository asynchronously.
                _repository.AddAsync(objClient);
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

            // Check if objClient.Id is 0, which would indicate an error in saving.
            if (objClient.Id == 0)
            {
                return DBOperation.Error;
            }
            else
            {

                if (master_ClientModel.Address.Id > 0)
                {
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
                        objAddress.StateId = entityAddress.StateId; ;
                        objAddress.CityId = entityAddress.CityId;
                        objAddress.PinNo = entityAddress.PinNo;
                        objAddress.Email = entityAddress.Email;
                        objAddress.AlternateEmail = entityAddress.AlternateEmail;
                        objAddress.Phone = entityAddress.Phone;
                        objAddress.AlternatePhone = entityAddress.AlternatePhone;
                        objAddress.Landlinephone = entityAddress.Landlinephone;
                        objAddress.IsActive = entityAddress.IsActive;
                        objAddress.ModifiedBy = entityAddress.CreatedBy;
                        objAddress.ModifiedDate = AppConstants.DateTime;
                        _repositoryAddress.UpdateAsync(entityAddress);
                    }
                }
                else
                {
                    // Create a new MasterClientContact entity from the model for insertion.
                    objAddress = _mapperFactory.Get<MasterAddressEntity, MasterAddress>(master_ClientModel.Address);
                    objAddress.TableKeyId = objClient.Id; // Associate with the MasterClient entity.
                    objAddress.TableName = TableName.Master_Client;
                    objAddress.CreatedDate = AppConstants.DateTime;
                    objAddress.CreatedBy = master_ClientModel.CreatedBy;
                    objAddress.ModifiedDate = AppConstants.DateTime;
                    objAddress.ModifiedBy = master_ClientModel.CreatedBy;
                    _repositoryAddress.AddAsync(objAddress);
                }
                // Insert the new entity into the repository asynchronously.
                await _unitOfWork.SaveChangesAsync();

                if (master_ClientModel.uploadDocument != null)
                {
                    foreach (var doc in master_ClientModel.uploadDocument)
                    {
                        objDocument = _mapperFactory.Get<MasterDocumentModel, MasterDocument>(doc);
                        objDocument.IsActive = doc.IsActive;
                        objDocument.TableKeyId = master_ClientModel.Id;
                        objDocument.TableName = TableName.Master_Client;
                        objDocument.DocumentName = doc.DocumentName;
                        objDocument.FileName = doc.FileName;
                        objDocument.FilePath = doc.FilePath;
                        objDocument.FileType = doc.FileType;
                        objDocument.CreatedBy = master_ClientModel.CreatedBy;
                        objDocument.CreatedDate = AppConstants.DateTime;
                        objDocument.ModifiedBy = master_ClientModel.CreatedBy;
                        objDocument.ModifiedDate = AppConstants.DateTime;
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
                 new DbParameter(AppConstants.TableName,  TableName.Master_Client, SqlDbType.VarChar),
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
