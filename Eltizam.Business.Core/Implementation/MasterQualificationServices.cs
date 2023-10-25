using Eltizam.Business.Core.Interface;
using Eltizam.Business.Core.ModelMapper;
using Eltizam.Business.Models;
using Eltizam.Data.DataAccess.Core.Repositories;
using Eltizam.Data.DataAccess.Core.UnitOfWork;
using Eltizam.Data.DataAccess.Entity;
using Eltizam.Data.DataAccess.Helper;
using Eltizam.Resource;
using Eltizam.Utility.Utility;
using Microsoft.Extensions.Localization;
using System.Data.SqlClient;
using static Eltizam.Utility.Enums.GeneralEnum;

namespace Eltizam.Business.Core.Implementation
{
    public class MasterQualificationServices : IMasterQualificationServices
    {
        #region Properties
        private readonly IUnitOfWork _unitOfWork;
        private readonly IMapperFactory _mapperFactory;
        private readonly IStringLocalizer<Errors> _stringLocalizerError;
        private readonly Microsoft.Extensions.Configuration.IConfiguration configuration;
        private IRepository<Master_Qualification> _repository { get; set; }
        private readonly IHelper _helper;
        private readonly int _LoginUserId
        #endregion Properties

        #region Constructor
        public MasterQualificationServices(IUnitOfWork unitOfWork, IMapperFactory mapperFactory, IStringLocalizer<Errors> stringLocalizerError,
                IHelper helper, Microsoft.Extensions.Configuration.IConfiguration _configuration)
        {
            _unitOfWork = unitOfWork;
            _mapperFactory = mapperFactory;

            _repository = _unitOfWork.GetRepository<Master_Qualification>();
            configuration = _configuration;
            _helper = helper;

            _LoginUserId = _helper.GetLoggedInUser().UserId;
        }

        #endregion Constructor

        #region API Methods

        /// <summary>
        /// Description - To Login Qualification and return JWT Token String
        /// </summary>
        /// <param name="Qualification"></param>
        /// <returns></returns>
        /// <response code="200">OK</response>
        /// <response code="400">Bad Request</response>
        /// <response code="403">Forbidden</response>
        /// <response code="404">Not Found</response>
        /// <response code="405">Method Not Allowed</response>
        /// <response code="415">Unsupported Media Type</response>
        /// <response code="500">Internal Server</response>
        /// 

        public async Task<Master_QualificationModel> GetMasterQualificationByIdAsync(int id)
        {
            // Create a new Master_QualificationModel instance.
            var _QualificationEntity = new Master_QualificationModel();

            // Use a mapper to map the data from the repository to the model asynchronously.
            _QualificationEntity = _mapperFactory.Get<Master_Qualification, Master_QualificationModel>(await _repository.GetAsync(id));

            // Return the mapped entity.
            return _QualificationEntity;
        }

        public async Task<DataTableResponseModel> GetAll(DataTableAjaxPostModel model)
        {
            // Get the column name and sort direction for DataTable sorting.
            string ColumnName = (model.order.Count > 0 ? model.columns[model.order[0].column].data : string.Empty);
            string SortDir = (model.order.Count > 0 ? model.order[0].dir : string.Empty);

            // Create an array of SQL parameters for a stored procedure call.
            SqlParameter[] osqlParameter =
            {
                new SqlParameter("@Id", 0),
                new SqlParameter("@CurrentPageNumber", model.start),
                new SqlParameter("@PageSize", model.length),
                new SqlParameter("@SortColumn", ColumnName),
                new SqlParameter("@SortDirection", SortDir),
                new SqlParameter("@SearchText", model.search.value)
            };

            // Call a stored procedure to get a list of Master_Qualification entities.
            var QualificationList = await _repository.GetBySP("usp_Qualification_GetMasterQualificationList", System.Data.CommandType.StoredProcedure, osqlParameter);

            // Extract total record and total count information from the result.
            var TotalRecord = (QualificationList != null && QualificationList.Rows.Count > 0 ? Convert.ToInt32(QualificationList.Rows[0]["TotalRecord"]) : 0);
            var TotalCount = (QualificationList != null && QualificationList.Rows.Count > 0 ? Convert.ToInt32(QualificationList.Rows[0]["TotalCount"]) : 0);

            // Create a DataTableResponseModel with the extracted data.
            DataTableResponseModel oDataTableResponseModel = new DataTableResponseModel(model.draw, TotalRecord, TotalCount, QualificationList.DataTableToList<Master_QualificationModel>());

            // Return the response model.
            return oDataTableResponseModel;
        }

        public async Task<DBOperation> AddUpdateQualification(Master_QualificationModel entityqualification)
        {
            // Create a Master_Qualification object.
            Master_Qualification objQualification;

            // Check if the entity has an ID greater than 0 (indicating an update).
            if (entityqualification.Id > 0)
            {
                // Get the existing entity from the repository.
                objQualification = _repository.Get(entityqualification.Id);

                // If the entity exists, update its properties.
                if (objQualification != null)
                {
                    objQualification.Qualification = entityqualification.Qualification;
                    objQualification.Subject = entityqualification.Subject;
                    objQualification.Institute = entityqualification.Institute;
                    objQualification.Grade = entityqualification.Grade;
                    objQualification.YearOfInstitute = entityqualification.YearOfInstitute;
                    objQualification.IsActive = entityqualification.IsActive;
                    objQualification.ModifiedDate = AppConstants.DateTime;
                    objQualification.ModifiedBy = _CreatedUserId;

                    // Update the entity in the repository asynchronously.
                    _repository.UpdateAsync(objQualification);
                }
                else
                {
                    // Return a not found operation if the entity does not exist.
                    return DBOperation.NotFound;
                }
            }
            else
            {
                // Create a new Master_Qualification entity from the model for insertion.
                objQualification = _mapperFactory.Get<Master_QualificationModel, Master_Qualification>(entityqualification);
                objQualification.CreatedDate = AppConstants.DateTime;
                objQualification.CreatedBy = _CreatedUserId;
                objQualification.ModifiedBy = _CreatedUserId;
                objQualification.ModifiedDate = AppConstants.DateTime;

                // Insert the new entity into the repository asynchronously.
                _repository.AddAsync(objQualification);
            }

            // Save changes to the database asynchronously.
            await _unitOfWork.SaveChangesAsync();

            // Return an appropriate operation result.
            if (objQualification.Id == 0)
                return DBOperation.Error;

            return DBOperation.Success;
        }

        public async Task<DBOperation> DeleteQualification(int id)
        {
            // Get the entity to be deleted from the repository.
            var entityQualification = _repository.Get(x => x.Id == id);

            // If the entity does not exist, return a not found operation.
            if (entityQualification == null)
                return DBOperation.NotFound;

            // Remove the entity from the repository.
            _repository.Remove(entityQualification);

            // Save changes to the database asynchronously.
            await _unitOfWork.SaveChangesAsync();

            // Return a success operation indicating successful deletion.
            return DBOperation.Success;
        }

        #endregion API Methods
    }
}
