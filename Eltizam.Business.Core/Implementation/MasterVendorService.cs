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
    public class MasterVendorService : IMasterVendorService
    {
        #region Properties
        private readonly IUnitOfWork _unitOfWork;
        private readonly IMapperFactory _mapperFactory;
        private readonly IStringLocalizer<Errors> _stringLocalizerError;
        private readonly Microsoft.Extensions.Configuration.IConfiguration configuration;
        private IRepository<MasterVendor> _repository { get; set; }
        private IRepository<MasterContact> _repositoryContact { get; set; }
        private IRepository<MasterAddress> _repositoryAddress { get; set; }
        private readonly IHelper _helper;
        #endregion Properties

        #region Constructor
        public MasterVendorService(IUnitOfWork unitOfWork, IMapperFactory mapperFactory, IStringLocalizer<Errors> stringLocalizerError,
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
            if (masterVendor != null)
            {
                DbParameter[] osqlParameter = {
                 new DbParameter("TableKeyId", id, SqlDbType.Int),
                 new DbParameter("TableName", TableName.Master_Vendor, SqlDbType.VarChar),
                };
                var Address = EltizamDBHelper.ExecuteSingleMappedReader<MasterAddressEntity>(ProcedureMetastore.usp_Address_GetAddressByTableKeyId, DatabaseConnection.ConnString, System.Data.CommandType.StoredProcedure, osqlParameter);
                if (Address != null)
                {
                    masterVendor.Address = Address;

                }

                DbParameter[] osqlParameter1 = {
                 new DbParameter("TableKeyId", id, SqlDbType.Int),
                 new DbParameter("TableName", TableName.Master_Vendor, SqlDbType.VarChar),
                };
                var contacts = EltizamDBHelper.ExecuteSingleMappedReader<MasterContactModel>(ProcedureMetastore.usp_Contact_GetContactByTableKeyId, DatabaseConnection.ConnString, System.Data.CommandType.StoredProcedure, osqlParameter1);
                if (contacts != null)
                {
                    masterVendor.Contact = contacts;

                }
            }
            // Return all objects as a tuple.
            return masterVendor;
        }



        public async Task<DataTableResponseModel> GetAll(DataTableAjaxPostModel model)
        {
            string ColumnName = (model.order.Count > 0 ? model.columns[model.order[0].column].data : string.Empty);
            string SortDir = (model.order.Count > 0 ? model.order[0].dir : string.Empty);

            SqlParameter[] osqlParameter = {
                new SqlParameter("@VendorId", 0),
                new SqlParameter("@CurrentPageNumber", model.start),
                    new SqlParameter("@PageSize", model.length),
                    new SqlParameter("@SortColumn", ColumnName),
                    new SqlParameter("@SortDirection", SortDir),
                    new SqlParameter("@SearchText", model.search.value)
            };

            int _count = 0;
            var UserList = await _repository.GetBySP("usp_Vendor_Search_GetVendorList", System.Data.CommandType.StoredProcedure, osqlParameter);

            //DatabaseConnection.ConnString, out _count, CommandType.StoredProcedure, osqlParameter);

            var TotalRecord = (UserList != null && UserList.Rows.Count > 0 ? Convert.ToInt32(UserList.Rows[0]["TotalRecord"]) : 0);
            var TotalCount = (UserList != null && UserList.Rows.Count > 0 ? Convert.ToInt32(UserList.Rows[0]["TotalCount"]) : 0);

            DataTableResponseModel oDataTableResponseModel = new DataTableResponseModel(model.draw, TotalRecord, TotalCount, UserList.DataTableToList<VendorListModel>());

            return oDataTableResponseModel;
        }

        public async Task<DBOperation> AddUpdateMasterVendor(MasterVendorModel masterVendortModel)
        {
            // Create MasterClient and MasterClientContact objects.
            MasterVendor objVendor;
            MasterAddress objAddress;
            MasterContact objContact;

            // Check if the entity has an ID greater than 0 (indicating an update).
            if (masterVendortModel.Id > 0)
            {
                // Get the existing entity from the repository.
                objVendor = _repository.Get(masterVendortModel.Id);

                // If the entity exists, update its properties.
                if (objVendor != null)
                {
                    objVendor = _mapperFactory.Get<MasterVendorModel, MasterVendor>(masterVendortModel);
                    objVendor.VendorName = masterVendortModel.VendorName;
                    objVendor.CompanyName = masterVendortModel.CompanyName;
                    objVendor.EstimattionDate = masterVendortModel.EstimattionDate;
                    objVendor.BusinessTypeId = masterVendortModel.BusinessTypeId;
                    objVendor.CompanyDescription = masterVendortModel.CompanyDescription;
                    objVendor.Status = masterVendortModel.Status;
                    objVendor.ModifiedDate = DateTime.Now;
                    objVendor.ModifiedBy = masterVendortModel.CreatedBy;

                    // Update the entity in the repository asynchronously.
                    _repository.UpdateAsync(objVendor);
                }
                //else if (objVendor != null)
                //{
                //    objContact = _mapperFactory.Get<MasterContactModel, MasterContact>(masterVendortModel.masterContact);
                //    objContact.CreatedDate = DateTime.Now;
                //    objContact.CreatedBy = masterVendortModel.CreatedBy;
                //    objContact.ModifiedDate = DateTime.Now;
                //    objContact.ModifiedBy = masterVendortModel.ModifiedBy;
                //}
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
                objVendor.CreatedDate = DateTime.Now;
                objVendor.CreatedBy = masterVendortModel.CreatedBy;
                objVendor.ModifiedDate = DateTime.Now;
                objVendor.ModifiedBy = masterVendortModel.CreatedBy;
                // Insert the new entity into the repository asynchronously.
                _repository.AddAsync(objVendor);
            }

            // Save changes to the database asynchronously.
            await _unitOfWork.SaveChangesAsync();
            // Check if objClient.Id is 0, which would indicate an error in saving.
            if (objVendor.Id == 0)
                return DBOperation.Error;

            else
            {
                if (masterVendortModel.Address.Id > 0)
                {
                    objAddress = _repositoryAddress.Get(masterVendortModel.Address.Id);
                    if (objAddress != null)
                    {
                        var entityAddress = _mapperFactory.Get<MasterAddressEntity, MasterAddress>(masterVendortModel.Address);
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
                        objAddress.IsActive = entityAddress.IsActive;
                        objAddress.ModifiedBy = entityAddress.CreatedBy;
                        objAddress.ModifiedDate = DateTime.Now;
                        _repositoryAddress.UpdateAsync(objAddress);
                    }
                }
                else
                {
                    objAddress = _mapperFactory.Get<MasterAddressEntity, MasterAddress>(masterVendortModel.Address);
                    //objAddress.IsActive = masterVendortModel.IsActive;
                    objAddress.TableKeyId = objVendor.Id;
                    objAddress.TableName = "Master_Vendor";
                    objAddress.CreatedBy = masterVendortModel.CreatedBy;
                    objAddress.CreatedDate = DateTime.Now;
                    objAddress.ModifiedBy = masterVendortModel.CreatedBy;
                    objAddress.ModifiedDate = DateTime.Now;
                    _repositoryAddress.AddAsync(objAddress);
                }
                await _unitOfWork.SaveChangesAsync();

                if (masterVendortModel.Contact.Id > 0)
                {
                    objContact = _repositoryContact.Get(masterVendortModel.Contact.Id);
                    if (objContact != null)
                    {
                        var entityAddress = _mapperFactory.Get<MasterContactModel, MasterContact>(masterVendortModel.Contact);

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
                    objContact = _mapperFactory.Get<MasterContactModel, MasterContact>(masterVendortModel.Contact);
                    objContact.CreatedDate = DateTime.Now;
                    objContact.TableKeyId = objVendor.Id;
                    objContact.TableName = "Master_Vendor";
                    objContact.CreatedBy = masterVendortModel.CreatedBy;
                    objContact.CreatedDate = DateTime.Now;
                    objContact.ModifiedDate = DateTime.Now;
                    objContact.ModifiedBy = masterVendortModel.CreatedBy;
                    _repositoryContact.AddAsync(objContact);
                }
                // Insert the new entity into the repository asynchronously.
                await _unitOfWork.SaveChangesAsync();
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
