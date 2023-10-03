﻿using Eltizam.Business.Core.Interface;
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
    public class Master_ClientTypeService: IMaster_ClientTypeService
    {
        #region Properties
        private readonly IUnitOfWork _unitOfWork;
        private readonly IMapperFactory _mapperFactory;
        private readonly IStringLocalizer<Errors> _stringLocalizerError;
        private readonly Microsoft.Extensions.Configuration.IConfiguration configuration;
        private IRepository<MasterClientType> _repository { get; set; }
        private readonly IHelper _helper;
        #endregion Properties

        #region Constructor
        public Master_ClientTypeService(IUnitOfWork unitOfWork, IMapperFactory mapperFactory, IStringLocalizer<Errors> stringLocalizerError,
          IHelper helper,
           Microsoft.Extensions.Configuration.IConfiguration _configuration)
        {
            _unitOfWork = unitOfWork;
            _mapperFactory = mapperFactory;

            _repository = _unitOfWork.GetRepository<MasterClientType>();
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

        public async Task<Master_ClientTypeModel> GetMasterClientTypeByIdAsync(int id)
        {
            // Create a new Master_PropertyTypeModel instance.
            var _clientEntity = new Master_ClientTypeModel();

            // Use a mapper to map the data from the repository to the model asynchronously.
            _clientEntity = _mapperFactory.Get<MasterClientType, Master_ClientTypeModel>(await _repository.GetAsync(id));

            // Return the mapped entity.
            return _clientEntity;
        }

        
        public async Task<DataTableResponseModel> GetAll(DataTableAjaxPostModel model)
        {
            var _dbParams = new[]
             {
                 new DbParameter("Id", 0,SqlDbType.Int),
                 new DbParameter("PageSize", model.length, SqlDbType.Int),
                 new DbParameter("PageNumber", model.start, SqlDbType.Int),
                 new DbParameter("OrderClause", "ClientType", SqlDbType.VarChar),
                 new DbParameter("ReverseSort", 1, SqlDbType.Int)
             };

            int _count = 0;
            var lstStf = FJDBHelper.ExecuteMappedReaderWithOutputParameter<Master_ClientTypeModel>(ProcedureNameCall.usp_ClientType_SearchAllList,

             DatabaseConnection.EltizamDatabaseConnection, out _count, CommandType.StoredProcedure, _dbParams);


            DataTableResponseModel oDataTableResponseModel = new DataTableResponseModel(model.draw, _count, lstStf.Count, lstStf);

            return oDataTableResponseModel;
        }

        public async Task<DBOperation> AddUpdateMasterClientType(Master_ClientTypeModel entityqualification)
        {
            // Create a Master_PropertyType object.
            MasterClientType objUser;

            // Check if the entity has an ID greater than 0 (indicating an update).
            if (entityqualification.Id > 0)
            {
                // Get the existing entity from the repository.
                objUser = _repository.Get(entityqualification.Id);

                // If the entity exists, update its properties.
                if (objUser != null)
                {
                    objUser.ClientType = entityqualification.ClientType;
                    objUser.IsActive = entityqualification.IsActive;
                    //objUser.ModifiedDate = DateTime.Now;
                    objUser.ModifiedBy = entityqualification.ModifiedBy;

                    // Update the entity in the repository asynchronously.
                    _repository.UpdateAsync(objUser);
                }
                else
                {
                    // Return a not found operation if the entity does not exist.
                    return DBOperation.NotFound;
                }
            }
            else
            {
                // Create a new Master_PropertyType entity from the model for insertion.
                objUser = _mapperFactory.Get<Master_ClientTypeModel, MasterClientType>(entityqualification);
                objUser.CreatedDate = DateTime.Now;
                objUser.CreatedBy = entityqualification.CreatedBy;
                objUser.ModifiedDate = DateTime.Now;
                objUser.ModifiedBy = entityqualification.ModifiedBy;
                // Insert the new entity into the repository asynchronously.
                _repository.AddAsync(objUser);
            }

            // Save changes to the database asynchronously.
            await _unitOfWork.SaveChangesAsync();

            // Return an appropriate operation result.
            if (objUser.Id == 0)
                return DBOperation.Error;

            return DBOperation.Success;
        }

        public async Task<DBOperation> DeleteClientType(int id)
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