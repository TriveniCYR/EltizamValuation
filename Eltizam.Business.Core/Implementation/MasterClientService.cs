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
        private IRepository<MasterContact> _repositoryContact { get; set; }
        private readonly IHelper _helper;
        #endregion Properties

        #region Constructor
        public MasterClientService(IUnitOfWork unitOfWork, IMapperFactory mapperFactory, IStringLocalizer<Errors> stringLocalizerError,
          IHelper helper,
           Microsoft.Extensions.Configuration.IConfiguration _configuration)
        {
            _unitOfWork = unitOfWork;
            _mapperFactory = mapperFactory;

            _repository = _unitOfWork.GetRepository<MasterClient>();
            _repositoryContact = _unitOfWork.GetRepository<MasterContact>();
            configuration = _configuration;
            _helper = helper;
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

        public async Task<Master_ClientModel> GetMasterClientByIdAsync(int id)
        {
            // Create a new Master_PropertyTypeModel instance.
            var _clientEntity = new Master_ClientModel();
            _clientEntity = _mapperFactory.Get<MasterClient, Master_ClientModel>(await _repository.GetAsync(id));
            if (_clientEntity != null)
            {
                DbParameter[] osqlParameter = {
                 new DbParameter("TableKeyId", id, SqlDbType.Int),
                 new DbParameter("TableName", "Master_Client", SqlDbType.VarChar),
                };

                var clientContact = EltizamDBHelper.ExecuteSingleMappedReader<Master_ClientContactModel>("usp_User_GetContactByUserId", DatabaseConnection.EltizamDatabaseConnection, System.Data.CommandType.StoredProcedure, osqlParameter);
                if (clientContact != null)
                {
                    _clientEntity.Contacts = clientContact;

                }
            }
            return _clientEntity;
        }

        public async Task<DataTableResponseModel> GetAll(DataTableAjaxPostModel model)
        {
            // Get the column name and sort direction for data table sorting.
            var _dbParams = new[]
             {
                 new DbParameter("ClientId", 0,SqlDbType.Int),
                 new DbParameter("PageSize", model.length, SqlDbType.Int),
                 new DbParameter("PageNumber", model.start, SqlDbType.Int),
                 new DbParameter("OrderClause", "ClientName", SqlDbType.VarChar),
                 new DbParameter("ReverseSort", 1, SqlDbType.Int)
             };

            int _count = 0;
            var lstStf = EltizamDBHelper.ExecuteMappedReaderWithOutputParameter<Master_ClientModel>(ProcedureNameCall.usp_Client_SearchAllList,

             DatabaseConnection.EltizamDatabaseConnection, out _count, CommandType.StoredProcedure, _dbParams);


            DataTableResponseModel oDataTableResponseModel = new DataTableResponseModel(model.draw, _count, 0, lstStf);

            return oDataTableResponseModel;
        }

        public async Task<DBOperation> AddUpdateMasterClient(Master_ClientModel master_ClientModel)
        {
            // Create MasterClient and MasterClientContact objects.
            MasterClient objClient;
            MasterContact objContact;

            // Check if the entity has an ID greater than 0 (indicating an update).
            if (master_ClientModel.Id > 0)
            {
                // Get the existing entity from the repository.
                objClient = _repository.Get(master_ClientModel.Id);

                // If the entity exists, update its properties.
                if (objClient != null)
                {
                    objClient = _mapperFactory.Get<Master_ClientModel, MasterClient>(master_ClientModel);
                    objClient.FirstName = master_ClientModel.FirstName;
                    objClient.MiddleName = master_ClientModel.MiddleName;
                    objClient.LastName = master_ClientModel.LastName;
                    objClient.ClientTypeId = master_ClientModel.ClientTypeId;
                    objClient.Company = master_ClientModel.Company;
                    objClient.Address1 = master_ClientModel.Address1;
                    objClient.Address2 = master_ClientModel.Address2;
                    objClient.PinNo = master_ClientModel.PinNo;
                    objClient.CountryId = master_ClientModel.CountryId;
                    objClient.StateId = master_ClientModel.StateId;
                    objClient.CityId = master_ClientModel.CityId;
                    objClient.Trnnumber = master_ClientModel.Trnnumber;
                    objClient.TrnexpiryDate = master_ClientModel.TrnexpiryDate;
                    objClient.LicenseNumber = master_ClientModel.LicenseNumber;
                    objClient.IsActive = master_ClientModel.IsActive;
                    objClient.Logo = master_ClientModel.Logo;             
                    objClient.ModifiedDate = DateTime.Now;
                    objClient.ModidiedBy = master_ClientModel.ModidiedBy;

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
                objClient = _mapperFactory.Get<Master_ClientModel, MasterClient>(master_ClientModel);
                objClient.CreatedDate = DateTime.Now;
                objClient.CreatedBy = master_ClientModel.CreatedBy;
                objClient.ModifiedDate = DateTime.Now;
                objClient.ModidiedBy = master_ClientModel.ModidiedBy;

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

                if (master_ClientModel.Contacts.Id > 0)
                {
                    objContact = _repositoryContact.Get(master_ClientModel.Contacts.Id);
                    if (objContact != null)
                    {
                        var entityAddress = _mapperFactory.Get<Master_ClientContactModel, MasterContact>(master_ClientModel.Contacts);
                        objContact.ContactPersonName = entityAddress.ContactPersonName;
                        objContact.Department = entityAddress.Department;
                        objContact.Designation = entityAddress.Designation;
                        objContact.Email = entityAddress.Email;
                        objContact.Mobile = entityAddress.Mobile;
                        objContact.Status = entityAddress.Status;
                        objContact.ModifiedBy = entityAddress.CreatedBy;
                        objContact.ModifiedDate = DateTime.Now;
                        _repositoryContact.UpdateAsync(entityAddress);
                    }
                }
                else
                {
                    // Create a new MasterClientContact entity from the model for insertion.
                    objContact = _mapperFactory.Get<Master_ClientContactModel, MasterContact>(master_ClientModel.Contacts);
                    objContact.TableKeyId = objClient.Id; // Associate with the MasterClient entity.
                    objContact.TableName = "Master_Client";
                    objContact.CreatedDate = DateTime.Now;
                    objContact.CreatedBy = master_ClientModel.CreatedBy;
                    objContact.ModifiedDate = DateTime.Now;
                    objContact.ModifiedBy = master_ClientModel.ModidiedBy;
                    _repositoryContact.AddAsync(objContact);
                }
                // Insert the new entity into the repository asynchronously.
                await _unitOfWork.SaveChangesAsync();

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
                DbParameter[] osqlParameter = {
                 new DbParameter("TableKeyId", id, SqlDbType.Int),
                 new DbParameter("TableName", "Master_User", SqlDbType.VarChar),
                };

                int result = EltizamDBHelper.ExecuteSingleMappedReader<int>("usp_Client_DeleteContactByClientId", DatabaseConnection.EltizamDatabaseConnection, System.Data.CommandType.StoredProcedure, osqlParameter);
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


        #endregion API Methods
    }
}
