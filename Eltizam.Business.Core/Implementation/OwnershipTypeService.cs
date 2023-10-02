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
    public class OwnershipTypeService : IOwnershipTypeService
    {
        private readonly IUnitOfWork _unitOfWork;
        private readonly IMapperFactory _mapperFactory;
        private readonly IStringLocalizer<Errors> _stringLocalizerError;
        private readonly Microsoft.Extensions.Configuration.IConfiguration configuration;


        private IRepository<MasterOwnershipType> _repository { get; set; }
        private readonly IHelper _helper;
        public OwnershipTypeService(IUnitOfWork unitOfWork, IMapperFactory mapperFactory, IStringLocalizer<Errors> stringLocalizerError,
                                  IHelper helper,
                                 Microsoft.Extensions.Configuration.IConfiguration _configuration)
        {
            _unitOfWork = unitOfWork;
            _mapperFactory = mapperFactory;

            _repository = _unitOfWork.GetRepository<MasterOwnershipType>();
            configuration = _configuration;
            _helper = helper;
        }

        // get all recoreds from OwnershipType list with sorting and pagination
        public async Task<DataTableResponseModel> GetAll(DataTableAjaxPostModel model)
        {
            string ColumnName = (model.order.Count > 0 ? model.columns[model.order[0].column].data : string.Empty);
            string SortDir = (model.order.Count > 0 ? model.order[0].dir : string.Empty);

            SqlParameter[] osqlParameter = {
                new SqlParameter("@OwnershipTypeId", 0),
                new SqlParameter("@CurrentPageNumber", model.start),
                new SqlParameter("@PageSize", model.length),
                new SqlParameter("@SortColumn", ColumnName),
                new SqlParameter("@SortDirection", SortDir),
                new SqlParameter("@SearchText", model.search.value)
            };

            var ownershipTypeList = await _repository.GetBySP("stp_npd_GetOwnershipTypeList", System.Data.CommandType.StoredProcedure, osqlParameter);

            var TotalRecord = (ownershipTypeList != null && ownershipTypeList.Rows.Count > 0 ? Convert.ToInt32(ownershipTypeList.Rows[0]["TotalRecord"]) : 0);
            var TotalCount = (ownershipTypeList != null && ownershipTypeList.Rows.Count > 0 ? Convert.ToInt32(ownershipTypeList.Rows[0]["TotalCount"]) : 0);

            DataTableResponseModel oDataTableResponseModel = new DataTableResponseModel(model.draw, TotalRecord, TotalCount, ownershipTypeList.DataTableToList<MasterOwnershipTypeEntity>());

            return oDataTableResponseModel;
        }
        public async Task<MasterOwnershipTypeEntity> GetById(int id)
        {
            var _OwnershipTypeEntity = new MasterOwnershipTypeEntity();
            _OwnershipTypeEntity = _mapperFactory.Get<MasterOwnershipType, MasterOwnershipTypeEntity>(await _repository.GetAsync(id));

            return _OwnershipTypeEntity;
        }
        public async Task<DBOperation> Upsert(MasterOwnershipTypeEntity entityOwnershipType)
        {

            MasterOwnershipType objOwnershipType;

            if (entityOwnershipType.Id > 0)
            {
                objOwnershipType = _repository.Get(entityOwnershipType.Id);
                var OldObjOwnershipType = objOwnershipType;
                if (objOwnershipType != null)
                {
                    objOwnershipType.OwnershipType = entityOwnershipType.OwnershipType;
                    objOwnershipType.IsActive = entityOwnershipType.IsActive;
                    objOwnershipType.ModifiedDate = DateTime.Now;
                    objOwnershipType.ModifiedBy = entityOwnershipType.CreatedBy;
                    _repository.UpdateAsync(objOwnershipType);
                }
                else
                {
                    return DBOperation.NotFound;
                }
            }
            else
            {
                objOwnershipType = _mapperFactory.Get<MasterOwnershipTypeEntity, MasterOwnershipType>(entityOwnershipType);
                objOwnershipType.CreatedDate = DateTime.Now;
                objOwnershipType.CreatedBy = entityOwnershipType.CreatedBy;
                objOwnershipType.ModifiedDate = DateTime.Now;
                objOwnershipType.ModifiedBy = entityOwnershipType.CreatedBy;
                _repository.AddAsync(objOwnershipType);
            }
            await _unitOfWork.SaveChangesAsync();
            if (objOwnershipType.Id == 0)
                return DBOperation.Error;

            return DBOperation.Success;
        }

        public async Task<DBOperation> Delete(int id)
        {
            var entityOwnershipType = _repository.Get(x => x.Id == id);

            if (entityOwnershipType == null)
                return DBOperation.NotFound;

            _repository.Remove(entityOwnershipType);

            await _unitOfWork.SaveChangesAsync();

            return DBOperation.Success;
        }
    }
}
