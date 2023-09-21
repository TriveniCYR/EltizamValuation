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
    public class DepartmentService : IDepartmentService
    {
        private readonly IUnitOfWork _unitOfWork;
        private readonly IMapperFactory _mapperFactory;
        private readonly IStringLocalizer<Errors> _stringLocalizerError;
        private readonly Microsoft.Extensions.Configuration.IConfiguration configuration;

        private IRepository<Master_Department> _repository { get; set; }
        private readonly IHelper _helper;
        public DepartmentService(IUnitOfWork unitOfWork, IMapperFactory mapperFactory, IStringLocalizer<Errors> stringLocalizerError,
                                  IHelper helper,
                                 Microsoft.Extensions.Configuration.IConfiguration _configuration)
        {
            _unitOfWork = unitOfWork;
            _mapperFactory = mapperFactory;

            _repository = _unitOfWork.GetRepository<Master_Department>();
            configuration = _configuration;
            _helper = helper;
        }

        // get all recoreds from Department list with sorting and pagination
        public async Task<DataTableResponseModel> GetAll(DataTableAjaxPostModel model)
        {
            string ColumnName = (model.order.Count > 0 ? model.columns[model.order[0].column].data : string.Empty);
            string SortDir = (model.order.Count > 0 ? model.order[0].dir : string.Empty);

            SqlParameter[] osqlParameter = {
                new SqlParameter("@DepartmentId", 0),
                new SqlParameter("@CurrentPageNumber", model.start),
                new SqlParameter("@PageSize", model.length),
                new SqlParameter("@SortColumn", ColumnName),
                new SqlParameter("@SortDirection", SortDir),
                new SqlParameter("@SearchText", model.search.value)
            };

            var DepartmentList = await _repository.GetBySP("stp_npd_GetDepartmentList", System.Data.CommandType.StoredProcedure, osqlParameter);

            var TotalRecord = (DepartmentList != null && DepartmentList.Rows.Count > 0 ? Convert.ToInt32(DepartmentList.Rows[0]["TotalRecord"]) : 0);
            var TotalCount = (DepartmentList != null && DepartmentList.Rows.Count > 0 ? Convert.ToInt32(DepartmentList.Rows[0]["TotalCount"]) : 0);

            DataTableResponseModel oDataTableResponseModel = new DataTableResponseModel(model.draw, TotalRecord, TotalCount, DepartmentList.DataTableToList<MasterDepartmentEntity>());

            return oDataTableResponseModel;
        }
        public async Task<MasterDepartmentEntity> GetById(int id)
        {
            var _DepartmentEntity = new MasterDepartmentEntity();
            _DepartmentEntity = _mapperFactory.Get<Master_Department, MasterDepartmentEntity>(await _repository.GetAsync(id));

            return _DepartmentEntity;
        }
        public async Task<DBOperation> Upsert(MasterDepartmentEntity entityDepartment)
        {
            
            Master_Department objDepartment;

            if (entityDepartment.Id > 0)
            {
                objDepartment = _repository.Get(entityDepartment.Id);
                var OldObjDepartment = objDepartment;
                if (objDepartment != null)
                {
                    objDepartment.Department = entityDepartment.Department;
                    objDepartment.IsActive = entityDepartment.IsActive;
                    objDepartment.ModifiedOn = DateTime.Now;
                    objDepartment.ModifiedBy = entityDepartment.CreatedBy;
                    _repository.UpdateAsync(objDepartment);
                }
                else
                {
                    return DBOperation.NotFound;
                }
            }
            else
            {
                objDepartment = _mapperFactory.Get<MasterDepartmentEntity, Master_Department>(entityDepartment);
                objDepartment.CreatedOn = DateTime.Now;
                objDepartment.CreatedBy = entityDepartment.CreatedBy;
                objDepartment.ModifiedOn = DateTime.Now;
                objDepartment.ModifiedBy = entityDepartment.CreatedBy;
                _repository.AddAsync(objDepartment);
            }
            await _unitOfWork.SaveChangesAsync();
            if (objDepartment.Id == 0)
                return DBOperation.Error;

            return DBOperation.Success;
        }

        public async Task<DBOperation> Delete(int id)
        {
            var entityDepartment = _repository.Get(x => x.Id == id);

            if (entityDepartment == null)
                return DBOperation.NotFound;

            _repository.Remove(entityDepartment);

            await _unitOfWork.SaveChangesAsync();

            return DBOperation.Success;
        }
    }
}
