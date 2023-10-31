using Eltizam.Business.Core.ModelMapper;
using Eltizam.Business.Models;
using Eltizam.Data.DataAccess.Core.Repositories;
using Eltizam.Data.DataAccess.Core.UnitOfWork;
using Eltizam.Data.DataAccess.Entity;
using Eltizam.Data.DataAccess.Helper;
using Eltizam.Resource;
using Eltizam.Utility.Utility;
using Eltizam.Utility;
using Microsoft.Extensions.Localization;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using static Eltizam.Utility.Enums.GeneralEnum;
using Eltizam.Business.Core.Interface;
using System.Data.SqlClient;

namespace Eltizam.Business.Core.Implementation
{
    public class MasterPropertyService : IMasterPropertyService
    {
        #region Properties

        private readonly IUnitOfWork _unitOfWork;
        private readonly IMapperFactory _mapperFactory;
        private readonly IStringLocalizer<Errors> _stringLocalizerError;
        private readonly Microsoft.Extensions.Configuration.IConfiguration _configuration;
        private readonly IHelper _helper;
        private readonly int? _LoginUserId;


        private IRepository<MasterProperty> _repository { get; set; }
        private IRepository<MasterPropertyLocation> _detailrepository { get; set; }
        private IRepository<MasterPropertyAmenity> _amenityrepository { get; set; }

        #endregion Properties

        #region Constructor
        public MasterPropertyService(IUnitOfWork unitOfWork, IMapperFactory mapperFactory, IStringLocalizer<Errors> stringLocalizerError,
                                     IHelper helper, Microsoft.Extensions.Configuration.IConfiguration configuration)
        {
            _unitOfWork = unitOfWork;
            _mapperFactory = mapperFactory;

            _repository = _unitOfWork.GetRepository<MasterProperty>();
            _detailrepository = _unitOfWork.GetRepository<MasterPropertyLocation>();
            _amenityrepository = _unitOfWork.GetRepository<MasterPropertyAmenity>();
            _configuration = configuration;
            _helper = helper;

            _LoginUserId = _helper.GetLoggedInUser()?.UserId;
        }
        #endregion Constructor


        #region API Methods

        /// <summary>
        /// Description - To Login User and return JWT Token String
        /// </summary>
        /// <param name="MasterProperty"></param>
        /// <returns></returns>
        /// <response code="200">OK</response>
        /// <response code="400">Bad Request</response>
        /// <response code="403">Forbidden</response>
        /// <response code="404">Not Found</response>
        /// <response code="405">Method Not Allowed</response>
        /// <response code="415">Unsupported Media Type</response>
        /// <response code="500">Internal Server</response>
        /// 

        public async Task<MasterPropertyModel> GetMasterPropertyByIdAsync(int id)
        {
            // Create a new Master_PropertyTypeModel instance.
            var _userEntity = new MasterPropertyModel();

            // Return the mapped entity.
            _userEntity = _mapperFactory.Get<MasterProperty, MasterPropertyModel>(await _repository.GetAsync(id));

            if (_userEntity != null)
            {
                DbParameter[] osqlParameter =
                {
                    new DbParameter("PropertyId", id, SqlDbType.Int),
                };
                var amenityList = EltizamDBHelper.ExecuteMappedReader<MasterAmenityListModel>(ProcedureMetastore.usp_Amenity_GetAmenityByPropertyId, DatabaseConnection.ConnString, System.Data.CommandType.StoredProcedure, osqlParameter);

                if (amenityList != null)
                {
                    _userEntity.AmenityList = amenityList;
                }

                DbParameter[] osqlParameter1 =
                {
                    new DbParameter("PropertyId", id, SqlDbType.Int),
                };
                var detailLocation = EltizamDBHelper.ExecuteSingleMappedReader<MasterPropertyDetailModel>(ProcedureMetastore.usp_PropertyLocation_GetLocationByPropertyId, DatabaseConnection.ConnString, System.Data.CommandType.StoredProcedure, osqlParameter1);

                if (detailLocation != null)
                {
                    _userEntity.PropertyDetail = detailLocation;
                }

                /*
                    DbParameter[] p =
                    {
                        new DbParameter("PropertyId", id, SqlDbType.Int),
                    };
                    var resultSet = EltizamDBHelper.ExecuteMultiReader(ProcedureMetastore.usp_PropertyLocation_GetLocationByPropertyId, DatabaseConnection.ConnString, CommandType.StoredProcedure, p);
                    if (resultSet != null && resultSet.Tables.Count > 0)
                    { 
                        //To read list 
                        _userEntity.AmenityList = new List<MasterAmenityListModel>(); 

                        if (resultSet.Tables[0] != null)
                            DataTableHelper.FillCollectionFromDataView<MasterAmenityListModel>(_userEntity.AmenityList, resultSet.Tables[0].DefaultView);

                        if (resultSet.Tables[1] != null)
                        {
                            _userEntity.PropertyDetail = resultSet.Tables[0].DefaultView.FillObjectFromDataView<MasterPropertyDetailModel>(); 
                        }
                    }
                */
            }

            return _userEntity;
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

            var Results = await _repository.GetBySP(ProcedureMetastore.usp_Property_Search_GetPropertyList, System.Data.CommandType.StoredProcedure, osqlParameter);

            var res = UtilityHelper.GetPaginationInfo(Results);
            DataTableResponseModel oDataTableResponseModel = new DataTableResponseModel(model.draw, res.Item1, res.Item1, Results.DataTableToList<MasterPropertyListModel>());

            return oDataTableResponseModel;
        }

        public async Task<List<MasterAmenityListModel>> GetPropertyAmenityList()
        {
            DbParameter[] osqlParameter =
            {
                new DbParameter("PropertyId", 0, SqlDbType.Int),
            };

            var amenityList = EltizamDBHelper.ExecuteMappedReader<MasterAmenityListModel>(ProcedureMetastore.usp_Amenity_GetAmenityByPropertyId, DatabaseConnection.ConnString, System.Data.CommandType.StoredProcedure, osqlParameter);
            return amenityList;
        }

        public async Task<DBOperation> AddUpdateMasterProperty(MasterPropertyModel masterproperty)
        {
            // Create a Master_PropertyType object.
            MasterProperty objProperty;
            MasterPropertyLocation objLocation;
            MasterPropertyAmenity objAmenity;

            if (masterproperty.Id > 0)
            {
                objProperty = _repository.Get(masterproperty.Id);
                if (objProperty != null)
                {

                    objProperty.PropertyName = masterproperty.PropertyName;
                    objProperty.PropertyTypeId = masterproperty.PropertyTypeId;
                    objProperty.PropertySubTypeId = masterproperty.PropertySubTypeId;
                    objProperty.OwnershipTypeId = masterproperty.OwnershipTypeId;
                    objProperty.UnitType = masterproperty.UnitType;
                    objProperty.AdditionalUnits = masterproperty.AdditionalUnits;
                    objProperty.Furnished = masterproperty.Furnished;
                    objProperty.ValuationPurpose = masterproperty.ValuationPurpose;
                    objProperty.BuildUpAreaSqFt = masterproperty.BuildUpAreaSqFt;
                    objProperty.BuildUpAreaSqMtr = masterproperty.BuildUpAreaSqMtr;
                    objProperty.AgeOfConstruction = masterproperty.AgeOfConstruction;
                    objProperty.IsActive = masterproperty.IsActive;
                    objProperty.Parking = masterproperty.Parking;
                    objProperty.ParkingBayNo = masterproperty.ParkingBayNo;
                    objProperty.Description = masterproperty.Description;
                    objProperty.ModifiedBy = _LoginUserId;
                    objProperty.ModifiedDate = AppConstants.DateTime;
                    _repository.UpdateAsync(objProperty);
                }
                else
                    return DBOperation.NotFound;
            }
            else
            {
                objProperty = _mapperFactory.Get<MasterPropertyModel, MasterProperty>(masterproperty);
                objProperty.IsActive = masterproperty.IsActive;
                objProperty.CreatedBy = _LoginUserId;
                objProperty.CreatedDate = AppConstants.DateTime;
                objProperty.ModifiedBy = _LoginUserId;
                objProperty.ModifiedDate = AppConstants.DateTime;
                _repository.AddAsync(objProperty);
            }
            await _unitOfWork.SaveChangesAsync();

            if (objProperty.Id == 0)
                return DBOperation.Error;

            else
            {
                if (masterproperty.PropertyDetail != null)
                {
                    if (masterproperty.PropertyDetail.Id > 0)
                    {
                        objLocation = _detailrepository.Get(masterproperty.PropertyDetail.Id);
                        if (objLocation != null)
                        {
                            var entityLocation = _mapperFactory.Get<MasterPropertyDetailModel, MasterPropertyLocation>(masterproperty.PropertyDetail);
                            objLocation.CountryId = entityLocation.CountryId;
                            objLocation.StateId = entityLocation.StateId;
                            objLocation.CityId = entityLocation.CityId;
                            objLocation.Zone = entityLocation.Zone;
                            objLocation.BuildingProject = entityLocation.BuildingProject;
                            objLocation.Latitude = entityLocation.Latitude;
                            objLocation.Longitude = entityLocation.Longitude;
                            objLocation.Address1 = entityLocation.Address1;
                            objLocation.Address2 = entityLocation.Address2;
                            objLocation.Pincode = entityLocation.Pincode;
                            objLocation.Landmark = entityLocation.Landmark;
                            objLocation.ModifiedBy = _LoginUserId;
                            objLocation.ModifiedDate = AppConstants.DateTime;
                            _detailrepository.UpdateAsync(objLocation);
                        }
                    }
                    else
                    {
                        objLocation = _mapperFactory.Get<MasterPropertyDetailModel, MasterPropertyLocation>(masterproperty.PropertyDetail);
                        objLocation.PropertyId = objProperty.Id;
                        objLocation.CreatedBy = _LoginUserId;
                        objLocation.CreatedDate = AppConstants.DateTime;
                        objLocation.ModifiedBy = _LoginUserId;
                        objLocation.ModifiedDate = AppConstants.DateTime;
                        _detailrepository.AddAsync(objLocation);
                    }
                    await _unitOfWork.SaveChangesAsync();
                }

                if (masterproperty.AmenityList != null && masterproperty.AmenityList.Count > 0)
                {
                    foreach (var doc in masterproperty.AmenityList)
                    {
                        if (doc.Id > 0)
                        {
                            objAmenity = _amenityrepository.Get(doc.Id);
                            if (objAmenity != null)
                            {
                                objAmenity = _mapperFactory.Get<MasterAmenityListModel, MasterPropertyAmenity>(doc);
                                objAmenity.PropertyId = objProperty.Id;
                                objAmenity.AmenityId = doc.AmenityId;
                                objAmenity.IsActive = doc.IsActive;
                                objAmenity.CreatedBy = _LoginUserId;
                                objAmenity.CreatedDate = AppConstants.DateTime;
                                objAmenity.ModifiedBy = _LoginUserId;
                                objAmenity.ModifiedDate = AppConstants.DateTime;
                                _amenityrepository.UpdateAsync(objAmenity);
                            }
                        }
                        else
                        {
                            objAmenity = new MasterPropertyAmenity();
                            objAmenity.PropertyId = objProperty.Id;
                            objAmenity.AmenityId = doc.AmenityId;
                            objAmenity.IsActive = doc.IsActive;
                            objAmenity.CreatedBy = _LoginUserId;
                            objAmenity.CreatedDate = AppConstants.DateTime;
                            objAmenity.ModifiedBy = _LoginUserId;
                            objAmenity.ModifiedDate = AppConstants.DateTime;
                            _amenityrepository.AddAsync(objAmenity);
                        }
                        await _unitOfWork.SaveChangesAsync();
                    }
                }
            }

            return DBOperation.Success;
        }

        public async Task<DBOperation> DeleteProperty(int id)
        {
            var entityProperty = _repository.Get(id);
            var entityLocation = _detailrepository.Get(x => x.PropertyId == id);
            if (entityLocation != null)
                _detailrepository.Remove(entityLocation);

            var entityAmenity = _amenityrepository.GetAll().Where(x => x.PropertyId == id);
            foreach (var item in entityAmenity)
            {
                _amenityrepository.Remove(item);
            }
            _repository.Remove(entityProperty);

            await _unitOfWork.SaveChangesAsync();

            // Return a success operation indicating successful deletion.
            return DBOperation.Success;
        }

        public async Task<List<MasterPropertyModel>> GetMasterPropertyByFiltersAsync(int PropertyTypeId, int SubPropertyTypeId, int OwnershipTypeId)
        {
            // Create a new Master_PropertyTypeModel instance.
            var _PropertFilter = new List<MasterPropertyModel>();

            var res = _repository.GetAllAsync(x => x.PropertyTypeId == PropertyTypeId 
            && x.PropertySubTypeId == SubPropertyTypeId &&
            x.OwnershipTypeId == OwnershipTypeId && x.IsActive == true).Result.ToList();

            // Use a mapper to map the data from the repository to the model asynchronously.
            _PropertFilter = _mapperFactory.GetList<MasterProperty, MasterPropertyModel>(res);

            // Return the mapped entity.
            return _PropertFilter;
        }


        #endregion API Methods
    }
}
