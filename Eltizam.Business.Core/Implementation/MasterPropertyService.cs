using Eltizam.Business.Core.Interface;
using Eltizam.Business.Core.ModelMapper;
using Eltizam.Business.Models;
using Eltizam.Data.DataAccess.Core.Repositories;
using Eltizam.Data.DataAccess.Core.UnitOfWork;
using Eltizam.Data.DataAccess.Entity;
using Eltizam.Resource;
using Eltizam.Utility.Utility;
using Microsoft.Extensions.Localization;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using static Eltizam.Utility.Enums.GeneralEnum;

namespace Eltizam.Business.Core.Implementation
{
    public class MasterPropertyService : IMasterPropertyService
    {
        #region Properties
        private readonly IUnitOfWork _unitOfWork;
        private readonly IMapperFactory _mapperFactory;
        private readonly IStringLocalizer<Errors> _stringLocalizerError;
        private readonly Microsoft.Extensions.Configuration.IConfiguration configuration;
        private IRepository<Master_PropertyType> _repository { get; set; }
        private readonly IHelper _helper;
        #endregion Properties

        #region Constructor
        public MasterPropertyService(IUnitOfWork unitOfWork, IMapperFactory mapperFactory, IStringLocalizer<Errors> stringLocalizerError,
          IHelper helper,
           Microsoft.Extensions.Configuration.IConfiguration _configuration)
        {
            _unitOfWork = unitOfWork;
            _mapperFactory = mapperFactory;

            _repository = _unitOfWork.GetRepository<Master_PropertyType>();
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

        public async Task<Master_PropertyTypeModel> GetMasterPropertyByIdAsync(int id)
        {
            // Create a new Master_PropertyTypeModel instance.
            var _userEntity = new Master_PropertyTypeModel();

            // Use a mapper to map the data from the repository to the model asynchronously.
            _userEntity = _mapperFactory.Get<Master_PropertyType, Master_PropertyTypeModel>(await _repository.GetAsync(id));

            // Return the mapped entity.
            return _userEntity;
        }

        public async Task<DataTableResponseModel> GetAll(DataTableAjaxPostModel model)
        {
            // Get the column name and sort direction for data table sorting.
            string ColumnName = (model.order.Count > 0 ? model.columns[model.order[0].column].data : string.Empty);
            string SortDir = (model.order.Count > 0 ? model.order[0].dir : string.Empty);

            // Create an array of SQL parameters for a stored procedure call.
            SqlParameter[] osqlParameter = {
        new SqlParameter("@UserId", 0),
        new SqlParameter("@CurrentPageNumber", model.start),
        new SqlParameter("@PageSize", model.length),
        new SqlParameter("@SortColumn", ColumnName),
        new SqlParameter("@SortDirection", SortDir),
        new SqlParameter("@SearchText", model.search.value)
    };

            // Call a stored procedure to get a list of Master_PropertyType entities.
            var QualificationList = await _repository.GetBySP("usp_Property__GetMasterPropertyList", System.Data.CommandType.StoredProcedure, osqlParameter);

            // Extract total record and total count information from the result.
            var TotalRecord = (QualificationList != null && QualificationList.Rows.Count > 0 ? Convert.ToInt32(QualificationList.Rows[0]["TotalRecord"]) : 0);
            var TotalCount = (QualificationList != null && QualificationList.Rows.Count > 0 ? Convert.ToInt32(QualificationList.Rows[0]["TotalCount"]) : 0);

            // Create a DataTableResponseModel with the extracted data.
            DataTableResponseModel oDataTableResponseModel = new DataTableResponseModel(model.draw, TotalRecord, TotalCount, QualificationList.DataTableToList<Master_PropertyTypeModel>());

            // Return the response model.
            return oDataTableResponseModel;
        }

        public async Task<DBOperation> AddUpdateMasterProperty(Master_PropertyTypeModel entityqualification)
        {
            // Create a Master_PropertyType object.
            Master_PropertyType objUser;

            // Check if the entity has an ID greater than 0 (indicating an update).
            if (entityqualification.Id > 0)
            {
                // Get the existing entity from the repository.
                objUser = _repository.Get(entityqualification.Id);

                // If the entity exists, update its properties.
                if (objUser != null)
                {
                    objUser.PropertyType = entityqualification.PropertyType;
                    objUser.IsActive = entityqualification.IsActive;
                    objUser.CreatedOn = DateTime.Now;
                    objUser.CreatedBy = entityqualification.CreatedBy;
                    objUser.ModifiedOn = DateTime.Now;
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
                objUser = _mapperFactory.Get<Master_PropertyTypeModel, Master_PropertyType>(entityqualification);
                objUser.CreatedOn = DateTime.Now;

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

        public async Task<DBOperation> DeleteProperty(int id)
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
