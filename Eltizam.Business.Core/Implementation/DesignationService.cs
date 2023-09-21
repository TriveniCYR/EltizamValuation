using Eltizam.Business.Core.Interface;
using Eltizam.Business.Core.ModelMapper;
using Eltizam.Business.Models;
using Eltizam.Data.DataAccess.Core.Repositories;
using Eltizam.Data.DataAccess.Core.UnitOfWork;
using Eltizam.Data.DataAccess.Entity;
using Eltizam.Resource;
using EmcureNPD.Utility.Utility;
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
    public class DesignationService : IDesignationService
    {

        private readonly IUnitOfWork _unitOfWork;
        private readonly IMapperFactory _mapperFactory;
        private readonly IStringLocalizer<Errors> _stringLocalizerError;
        private readonly Microsoft.Extensions.Configuration.IConfiguration configuration;

        private IRepository<Master_Designation> _repository { get; set; }
        private readonly IHelper _helper;
        public DesignationService(IUnitOfWork unitOfWork, IMapperFactory mapperFactory, IStringLocalizer<Errors> stringLocalizerError,
                                  IHelper helper,
                                 Microsoft.Extensions.Configuration.IConfiguration _configuration)
        {
            _unitOfWork = unitOfWork;
            _mapperFactory = mapperFactory;

            _repository = _unitOfWork.GetRepository<Master_Designation>();
            configuration = _configuration;
            _helper = helper;
        }

        // get all recoreds from Designation list with sorting and pagination
        public async Task<DataTableResponseModel> GetAll(DataTableAjaxPostModel model)
        {
            string ColumnName = (model.order.Count > 0 ? model.columns[model.order[0].column].data : string.Empty);
            string SortDir = (model.order.Count > 0 ? model.order[0].dir : string.Empty);

            SqlParameter[] osqlParameter = {
                new SqlParameter("@DesignationId", 0),
                new SqlParameter("@CurrentPageNumber", model.start),
                new SqlParameter("@PageSize", model.length),
                new SqlParameter("@SortColumn", ColumnName),
                new SqlParameter("@SortDirection", SortDir),
                new SqlParameter("@SearchText", model.search.value)
            };

            var DesignationList = await _repository.GetBySP("stp_npd_GetDesignationList", System.Data.CommandType.StoredProcedure, osqlParameter);

            var TotalRecord = (DesignationList != null && DesignationList.Rows.Count > 0 ? Convert.ToInt32(DesignationList.Rows[0]["TotalRecord"]) : 0);
            var TotalCount = (DesignationList != null && DesignationList.Rows.Count > 0 ? Convert.ToInt32(DesignationList.Rows[0]["TotalCount"]) : 0);

            DataTableResponseModel oDataTableResponseModel = new DataTableResponseModel(model.draw, TotalRecord, TotalCount, DesignationList.DataTableToList<MasterDesignationEntity>());

            return oDataTableResponseModel;
        }

        // get master designation detail by id
        public async Task<MasterDesignationEntity> GetById(int id)
        {
            var _DesignationEntity = new MasterDesignationEntity();
            _DesignationEntity = _mapperFactory.Get<Master_Designation, MasterDesignationEntity>(await _repository.GetAsync(id));

            return _DesignationEntity;
        }

        // this method is called when inserting and updating master Designation detail
        public async Task<DBOperation> Upsert(MasterDesignationEntity entityDesignation)
        {

            Master_Designation objDesignation;

            if (entityDesignation.Id > 0)
            {
                objDesignation = _repository.Get(entityDesignation.Id);
                var OldObjDesignation = objDesignation;
                if (objDesignation != null)
                {
                    objDesignation.Designation = entityDesignation.Designation;
                    objDesignation.IsActive = entityDesignation.IsActive;
                    objDesignation.ModifiedOn = DateTime.Now;
                    objDesignation.ModifiedBy = entityDesignation.CreatedBy;
                    _repository.UpdateAsync(objDesignation);
                }
                else
                {
                    return DBOperation.NotFound;
                }
            }
            else
            {
                objDesignation = _mapperFactory.Get<MasterDesignationEntity, Master_Designation>(entityDesignation);
                objDesignation.CreatedOn = DateTime.Now;
                objDesignation.CreatedBy = entityDesignation.CreatedBy;
                objDesignation.ModifiedOn = DateTime.Now;
                objDesignation.ModifiedBy = entityDesignation.CreatedBy;
                _repository.AddAsync(objDesignation);
            }
            await _unitOfWork.SaveChangesAsync();
            if (objDesignation.Id == 0)
                return DBOperation.Error;

            return DBOperation.Success;
        }

        // this is for delete master Designation detail by id
        public async Task<DBOperation> Delete(int id)
        {
            var entityDesignation = _repository.Get(x => x.Id == id);

            if (entityDesignation == null)
                return DBOperation.NotFound;

            _repository.Remove(entityDesignation);

            await _unitOfWork.SaveChangesAsync();

            return DBOperation.Success;
        }
    }
}
