using Eltizam.Business.Core.Interface;
using Eltizam.Business.Core.ModelMapper;
using Eltizam.Business.Models;
using Eltizam.Data.DataAccess.Core.Repositories;
using Eltizam.Data.DataAccess.Core.UnitOfWork;
using Eltizam.Data.DataAccess.Entity;
using Eltizam.Data.DataAccess.Helper;
using Eltizam.Resource;
using Eltizam.Utility;
using Microsoft.Extensions.Localization;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using static Eltizam.Utility.Enums.GeneralEnum;

namespace Eltizam.Business.Core.Implementation
{
    public class MasterDictionaryService : IMasterDictionaryService
    {
        private readonly IUnitOfWork _unitOfWork;
        private readonly IMapperFactory _mapperFactory;
        private readonly IStringLocalizer<Errors> _stringLocalizerError;
        private readonly Microsoft.Extensions.Configuration.IConfiguration configuration;


        private IRepository<MasterDictionary> _repository { get; set; }
         private IRepository<MasterDictionaryDetail> _repositoryDetail { get; set; }
        private readonly IHelper _helper;
        public MasterDictionaryService(IUnitOfWork unitOfWork, IMapperFactory mapperFactory, IStringLocalizer<Errors> stringLocalizerError,
                                 IHelper helper,
                                Microsoft.Extensions.Configuration.IConfiguration _configuration)
        {
            _unitOfWork = unitOfWork;
            _mapperFactory = mapperFactory;

            _repository = _unitOfWork.GetRepository<MasterDictionary>();
            _repositoryDetail = _unitOfWork.GetRepository<MasterDictionaryDetail>();
            configuration = _configuration;
            _helper = helper;
        }

        // get all recoreds from Location list with sorting and pagination
        public async Task<DataTableResponseModel> GetAll(DataTableAjaxPostModel model)
        {
            var _dbParams = new[]
             {
                 //new DbParameter("Id", 0,SqlDbType.Int),
                 new DbParameter("PageSize", model.length, SqlDbType.Int),
                 new DbParameter("PageNumber", model.start, SqlDbType.Int),
                 new DbParameter("OrderClause", "LocationName", SqlDbType.VarChar),
                 new DbParameter("ReverseSort", 1, SqlDbType.Int)
             };

            int _count = 0;
            //var lstdict = EltizamDBHelper.ExecuteMappedReaderWithOutputParameter<MasterDictionaryEntity>(ProcedureMetastore.usp_Dictionary_SearchAllList,
            //DatabaseConnection.ConnString, out _count, CommandType.StoredProcedure, _dbParams);
            var lstdict = EltizamDBHelper.ExecuteMappedReader<MasterDictionaryEntity>(ProcedureMetastore.usp_Dictionary_SearchAllList, DatabaseConnection.ConnString, CommandType.StoredProcedure, _dbParams);


            DataTableResponseModel oDataTableResponseModel = new DataTableResponseModel(model.draw, _count, 0, lstdict);
            return oDataTableResponseModel;
        }
        public async Task<List<MasterDictionaryDetailById>> GetDictionaryDetailsByIdAsync(int id,string description)
        {
        //   var _DictionaryEntity = new List<MasterDictionaryDetailById>();            
                DbParameter[] osqlParameter = {
                 new DbParameter("Id", id, SqlDbType.Int),
                 new DbParameter("Description",description,SqlDbType.VarChar),
                };
                //_DictionaryEntity = EltizamDBHelper.ExecuteSingleMappedReader<MasterDictionaryDetailById>(ProcedureMetastore.usp_Dictionary_GetById, DatabaseConnection.ConnString, System.Data.CommandType.StoredProcedure, osqlParameter);
           var _Dictionary = EltizamDBHelper.ExecuteMappedReader<MasterDictionaryDetailById>(ProcedureMetastore.usp_Dictionary_GetById, DatabaseConnection.ConnString, System.Data.CommandType.StoredProcedure, osqlParameter);


            return _Dictionary;
        }
        //public async Task<MasterDictionaryDetailById> GetDictionaryDetailsByIdAsync(int id)
        //{
        //    var _DictionaryEntity = new MasterDictionaryDetailById();
        //    _DictionaryEntity = _mapperFactory.Get<MasterDictionary, MasterDictionaryDetailById>(await _repository.GetAsync(id));

        //    return _DictionaryEntity;
        //}
        public async Task<MasterDictionaryDetailById> GetDictionaryDetailsByIdAsync(int id)
        {
            try
            {
                var masterDictionary = await _repositoryDetail.GetAsync(id);
                if (masterDictionary == null)
                {
                    // Log that the data with the specified ID was not found.
                    // You can add proper logging here.
                    return null;
                }

                var _DictionaryEntity = _mapperFactory.Get<MasterDictionaryDetail, MasterDictionaryDetailById>(masterDictionary);
                return _DictionaryEntity;
            }
            catch (Exception ex)
            {
                // Handle exceptions, log them, or rethrow as needed.
                // You should log the exception details for debugging.
                // Logging should be implemented to record errors.
                return null;
            }
        }
        public async Task<DBOperation> AddUpdateMasterDictionary(MasterDictionaryDetailById entitydictionary)
        {

            MasterDictionaryDetail objDicitonary;

            if (entitydictionary.Id > 0)
            {
                objDicitonary = _repositoryDetail.Get(entitydictionary.Id);
                var OldObjLocation = objDicitonary;
                if (objDicitonary != null)
                {
                    //   objLocation.LocationName = entityLocation.LocationName;
                    objDicitonary.Description = entitydictionary.Description;
                    objDicitonary.Sort = entitydictionary.Sort;
                    objDicitonary.IsActive = entitydictionary.IsActive;

                    //objLocation.LocationName = entityLocation.LocationName;
                    //objLocation.ModifiedDate = DateTime.Now;
                    //objLocation.ModifiedBy = entityLocation.CreatedBy;

                    _repositoryDetail.UpdateAsync(objDicitonary);
                }
                else
                {
                    return DBOperation.NotFound;
                }
            }
            else
            {
                objDicitonary = _mapperFactory.Get<MasterDictionaryDetailById, MasterDictionaryDetail>(entitydictionary);
                objDicitonary.Description = entitydictionary.Description;
              //  objDicitonary.DictionaryId = entitydictionary.DictionaryId;
               // objDicitonary.Sort = entitydictionary.Sort;
                objDicitonary.IsActive = entitydictionary.IsActive;
                //objLocation.Sector = entityLocation.Sector;
                //objLocation.Latitude = entityLocation.Latitude;
                //objLocation.Longitude = entityLocation.Longitude;
                //objLocation.HomeCurrencyId = entityLocation.HomeCurrencyId;
                //objLocation.ForeignCurrencyId = entityLocation.ForeignCurrencyId;
                //objLocation.Status = entityLocation.Status;
                //objLocation.CreatedDate = DateTime.Now;
                //objLocation.CreatedBy = entityLocation.CreatedBy;
                //objLocation.ModifiedDate = DateTime.Now;
                //objLocation.ModifiedBy = entityLocation.CreatedBy;
                _repositoryDetail.AddAsync(objDicitonary);
            }
            await _unitOfWork.SaveChangesAsync();
            if (objDicitonary.Id == 0)
                return DBOperation.Error;

            return DBOperation.Success;
        }
        public async Task<DBOperation> Delete(int id)
        {
            var entityDictionary = _repositoryDetail.Get(x => x.Id == id);

            if (entityDictionary == null)
                return DBOperation.NotFound;

            _repositoryDetail.Remove(entityDictionary);

            await _unitOfWork.SaveChangesAsync();

            return DBOperation.Success;
        }
    }
}
