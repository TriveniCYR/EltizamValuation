using Eltizam.Business.Core.Interface;
using Eltizam.Business.Core.ModelMapper;
using Eltizam.Business.Models;
using Eltizam.Data.DataAccess.Core.Repositories;
using Eltizam.Data.DataAccess.Core.UnitOfWork;
using Eltizam.Data.DataAccess.Entity;
using Eltizam.Data.DataAccess.Helper;
using Eltizam.Resource;
using Eltizam.Utility;
using Microsoft.EntityFrameworkCore.Metadata.Internal;
using Microsoft.Extensions.Localization;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using static Eltizam.Utility.Enums.GeneralEnum;

namespace Eltizam.Business.Core.Implementation
{
    public class ValuationQuatationService : IValuationQuatationService
    {
        #region Properties
        private readonly IUnitOfWork _unitOfWork;
        private readonly IMapperFactory _mapperFactory;
        private readonly IStringLocalizer<Errors> _stringLocalizerError;
        private readonly Microsoft.Extensions.Configuration.IConfiguration configuration;
        private IRepository<ValuationQuotation> _repository { get; set; }
        private readonly IHelper _helper;
        private readonly int? _LoginUserId;
        #endregion Properties

        #region Constructor
        public ValuationQuatationService(IUnitOfWork unitOfWork, IMapperFactory mapperFactory, IStringLocalizer<Errors> stringLocalizerError,
          IHelper helper,
           Microsoft.Extensions.Configuration.IConfiguration _configuration)
        {
            _unitOfWork = unitOfWork;
            _mapperFactory = mapperFactory;
            _repository = _unitOfWork.GetRepository<ValuationQuotation>();
            configuration = _configuration;
            _helper = helper;
            _LoginUserId = _helper.GetLoggedInUser()?.UserId;
        }
        #endregion Constructor


        public async Task<List<ValuationQuatationListModel>> GetQuatationList(int requestId)
        {
            DbParameter[] osqlParameter2 =
            {
                    new DbParameter("RequestId", requestId, SqlDbType.Int),
                };

            var quottationList = EltizamDBHelper.ExecuteMappedReader<ValuationQuatationListModel>(ProcedureMetastore.usp_Quotation_GetQuotationByRequestId,
                                DatabaseConnection.ConnString, System.Data.CommandType.StoredProcedure, osqlParameter2);

            return quottationList;
            //var allList = _repository.GetAllAsync(x => x.ValuationRequestId == requestId).Result.ToList();
            //return _mapperFactory.GetList<ValuationQuotation, ValuationQuatationListModel>(allList);
        }

        public async Task<ValuationQuatationListModel> GetQuatationById(int id)
        {
            var _quatationEntity = new ValuationQuatationListModel();
            _quatationEntity = _mapperFactory.Get<ValuationQuotation, ValuationQuatationListModel>(await _repository.GetAsync(id));

            return _quatationEntity;
        }
        public async Task<DBOperation> QuatationDelete(int id)
        {
            var entityQuatation = _repository.Get(x => x.Id == id);

            if (entityQuatation == null)
                return DBOperation.NotFound;

            _repository.Remove(entityQuatation);

            await _unitOfWork.SaveChangesAsync();

            return DBOperation.Success;
        }
        public async Task<DBOperation> Upsert(ValuationQuatationListModel entityQuatation)
        {

            ValuationQuotation objQuatation;

            if (entityQuatation.Id > 0)
            {
                objQuatation = _repository.Get(entityQuatation.Id);

                var OldObjDepartment = objQuatation;
                if (objQuatation != null)
                {
                    objQuatation.ReferenceNo = entityQuatation.ReferenceNo;
                    objQuatation.ValuationRequestId = entityQuatation.ValuationRequestId;
                    objQuatation.ValuationFee = entityQuatation.ValuationFee;
                    objQuatation.Vat = entityQuatation.Vat;
                    objQuatation.OtherCharges = entityQuatation.OtherCharges;
                    objQuatation.InstructorCharges = entityQuatation.InstructorCharges;
                    objQuatation.Discount = entityQuatation.Discount;
                    objQuatation.TotalFee = entityQuatation.TotalFee;
                    objQuatation.StatusId = entityQuatation.StatusId;
                    objQuatation.ModifyDate = AppConstants.DateTime;
                    objQuatation.ModifyBy = 1;
                    _repository.UpdateAsync(objQuatation);
                }
                else
                {
                    return DBOperation.NotFound;
                }
            }
            else
            {
                objQuatation = _mapperFactory.Get<ValuationQuatationListModel, ValuationQuotation>(entityQuatation);
                objQuatation.CreatedDate = AppConstants.DateTime;
                objQuatation.CreatedBy = 1;
                _repository.AddAsync(objQuatation);
            }
            await _unitOfWork.SaveChangesAsync();
            if (objQuatation.Id == 0)
                return DBOperation.Error;

            return DBOperation.Success;
        }
    }
}
