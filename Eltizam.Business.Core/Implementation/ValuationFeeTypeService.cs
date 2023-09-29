using Eltizam.Business.Core.Interface;
using Eltizam.Business.Core.ModelMapper;
using Eltizam.Business.Models;
using Eltizam.Data.DataAccess.Core.Repositories;
using Eltizam.Data.DataAccess.Core.UnitOfWork;
using Eltizam.Data.DataAccess.Entity;
using Eltizam.Resource;
using Eltizam.Utility;
using Microsoft.Extensions.Localization;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using Eltizam.Utility.Utility;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using static Eltizam.Utility.Enums.GeneralEnum;

namespace Eltizam.Business.Core.Implementation
{
    internal class ValuationFeeTypeService : IValuationFeeTypeService
    {
        private readonly IUnitOfWork _unitOfWork;
        private readonly IMapperFactory _mapperFactory;
        private readonly IStringLocalizer<Errors> _stringLocalizerError;
        private readonly Microsoft.Extensions.Configuration.IConfiguration configuration;
        private readonly string _dbConnection;

        private IRepository<MasterValuationFeeType> _repository { get; set; }
        private readonly IHelper _helper;
        public ValuationFeeTypeService(IUnitOfWork unitOfWork, IMapperFactory mapperFactory, IStringLocalizer<Errors> stringLocalizerError,
                                  IHelper helper,
                                 Microsoft.Extensions.Configuration.IConfiguration _configuration)
        {
            _unitOfWork = unitOfWork;
            _mapperFactory = mapperFactory;

            _repository = _unitOfWork.GetRepository<MasterValuationFeeType>();
            configuration = _configuration;
            _helper = helper;
            _dbConnection = DatabaseConnection.EltizamDatabaseConnection;
        }

        // get all recoreds from ValuationFeeType list with sorting and pagination
        public async Task<DataTableResponseModel> GetAll(DataTableAjaxPostModel model)
        {
            //int _count = 0;
            //dynamic lstStf = FJDBHelper.ExecuteMappedReaderWithOutputParameter<dynamic>("usp_Staff_SearchPageWise",

            // _dbConnection, out _count, CommandType.StoredProcedure,
            // dbParameters: new[]
            // {
            //     new DbParameter("Id", 0,SqlDbType.Int),
            //     new DbParameter("PageSize", model.length, SqlDbType.Int),
            //     new DbParameter("PageNumber", model.start, SqlDbType.Int),
            //     new DbParameter("OrderClause", "ValuationFeeTypeName", SqlDbType.VarChar),
            //     new DbParameter("ReverseSort", SortDir? 0 : 1, FieldTypeEnum.FieldTypeBoolean)
            // });

            string ColumnName = (model.order.Count > 0 ? model.columns[model.order[0].column].data : string.Empty);
            string SortDir = (model.order.Count > 0 ? model.order[0].dir : string.Empty);

            SqlParameter[] osqlParameter = {
                new SqlParameter("@ValuationFeeTypeId", 0),
                new SqlParameter("@CurrentPageNumber", model.start),
                new SqlParameter("@PageSize", model.length),
                new SqlParameter("@SortColumn", ColumnName),
                new SqlParameter("@SortDirection", SortDir),
                new SqlParameter("@SearchText", model.search.value)
            };

            var ValuationFeeTypeList = await _repository.GetBySP("stp_npd_GetValuationFeeTypeList", System.Data.CommandType.StoredProcedure, osqlParameter);

            var TotalRecord = (ValuationFeeTypeList != null && ValuationFeeTypeList.Rows.Count > 0 ? Convert.ToInt32(ValuationFeeTypeList.Rows[0]["TotalRecord"]) : 0);
            var TotalCount = (ValuationFeeTypeList != null && ValuationFeeTypeList.Rows.Count > 0 ? Convert.ToInt32(ValuationFeeTypeList.Rows[0]["TotalCount"]) : 0);

            DataTableResponseModel oDataTableResponseModel = new DataTableResponseModel(model.draw, TotalRecord, TotalCount, ValuationFeeTypeList.DataTableToList<MasterValuationFeeTypeModel>());

            return oDataTableResponseModel;
        }
        public async Task<MasterValuationFeeTypeModel> GetById(int id)
        {
            var _ValuationFeeTypeEntity = new MasterValuationFeeTypeModel();
            _ValuationFeeTypeEntity = _mapperFactory.Get<MasterValuationFeeType, MasterValuationFeeTypeModel>(await _repository.GetAsync(id));

            return _ValuationFeeTypeEntity;
        }
        public async Task<DBOperation> Upsert(MasterValuationFeeTypeModel entityValuationFeeType)
        {

            MasterValuationFeeType objValuationFeeType;

            if (entityValuationFeeType.Id > 0)
            {
                objValuationFeeType = _repository.Get(entityValuationFeeType.Id);
                var OldObjValuationFeeType = objValuationFeeType;
                if (objValuationFeeType != null)
                {
                    objValuationFeeType.ValuationFeeType = entityValuationFeeType.ValuationFeeType;
                    objValuationFeeType.IsActive = entityValuationFeeType.IsActive;
                    objValuationFeeType.ModifiedDate = DateTime.Now;
                    objValuationFeeType.ModifiedBy = entityValuationFeeType.CreatedBy;
                    _repository.UpdateAsync(objValuationFeeType);
                }
                else
                {
                    return DBOperation.NotFound;
                }
            }
            else
            {
                objValuationFeeType = _mapperFactory.Get<MasterValuationFeeTypeModel, MasterValuationFeeType>(entityValuationFeeType);

                objValuationFeeType.ValuationFeeType = entityValuationFeeType.ValuationFeeType;
                objValuationFeeType.IsActive = entityValuationFeeType.IsActive;
                objValuationFeeType.CreatedDate = DateTime.Now;
                objValuationFeeType.CreatedBy = entityValuationFeeType.CreatedBy;
                objValuationFeeType.ModifiedDate = DateTime.Now;
                objValuationFeeType.ModifiedBy = entityValuationFeeType.CreatedBy;
                _repository.AddAsync(objValuationFeeType);
            }
            await _unitOfWork.SaveChangesAsync();
            if (objValuationFeeType.Id == 0)
                return DBOperation.Error;

            return DBOperation.Success;
        }

        public async Task<DBOperation> Delete(int id)
        {
            var entityValuationFeeType = _repository.Get(x => x.Id == id);

            if (entityValuationFeeType == null)
                return DBOperation.NotFound;

            _repository.Remove(entityValuationFeeType);

            await _unitOfWork.SaveChangesAsync();

            return DBOperation.Success;
        }
    }
}
