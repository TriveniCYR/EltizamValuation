using Eltizam.Business.Core.Interface;
using Eltizam.Business.Core.ModelMapper;
using Eltizam.Business.Models;
using Eltizam.Data.DataAccess.Core.Repositories;
using Eltizam.Data.DataAccess.Core.UnitOfWork;
using Eltizam.Data.DataAccess.Entity;
using Eltizam.Data.DataAccess.Helper;
using Eltizam.Resource;
using Eltizam.Utility;
using Eltizam.Utility.Enums;
using Microsoft.EntityFrameworkCore.Metadata.Internal;
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
       private readonly Microsoft.Extensions.Configuration.IConfiguration configuration;
        private IRepository<ValuationQuotation> _repository { get; set; }
        private IRepository<MasterDocument> _repositoryDocument { get; set; }
        private readonly IHelper _helper;
        private readonly int? _LoginUserId;
        #endregion Properties

        #region Constructor
        public ValuationQuatationService(IUnitOfWork unitOfWork, IMapperFactory mapperFactory,
          IHelper helper,
           Microsoft.Extensions.Configuration.IConfiguration _configuration)
        {
            _unitOfWork = unitOfWork;
            _mapperFactory = mapperFactory;
            _repository = _unitOfWork.GetRepository<ValuationQuotation>();
            _repositoryDocument = _unitOfWork.GetRepository<MasterDocument>();
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
            var tableName = Enum.GetName(TableNameEnum.ValuationQuotation);

            var _quatationEntity = new ValuationQuatationListModel();
            _quatationEntity = _mapperFactory.Get<ValuationQuotation, ValuationQuatationListModel>(await _repository.GetAsync(id));
            if (_quatationEntity != null)
            {
                DbParameter[] osqlParameter2 =
                {
                    new DbParameter(AppConstants.TableKeyId, id, SqlDbType.Int),
                    new DbParameter(AppConstants.TableName,  tableName, SqlDbType.VarChar),
                };

                var quatationDocuments = EltizamDBHelper.ExecuteMappedReader<MasterDocumentModel>(ProcedureMetastore.usp_Document_GetDocumentByTableKeyId,
                                    DatabaseConnection.ConnString, System.Data.CommandType.StoredProcedure, osqlParameter2);
                if (quatationDocuments != null)
                {
                    _quatationEntity.Documents = quatationDocuments;
                }
            }
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
            MasterDocument objDocument;

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
                    objQuatation.ModifiedDate = AppConstants.DateTime;
                    objQuatation.ModifiedBy = entityQuatation.ModifiedBy;
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
                objQuatation.CreatedBy = entityQuatation.CreatedBy ?? 1;
                _repository.AddAsync(objQuatation);
            }
            await _unitOfWork.SaveChangesAsync();
            if (objQuatation.Id == 0)
                return DBOperation.Error;
            else
            {
                if (entityQuatation.uploadDocument != null)
                {
                    foreach (var doc in entityQuatation.uploadDocument)
                    {
                        objDocument = _mapperFactory.Get<MasterDocumentModel, MasterDocument>(doc);
                        objDocument.IsActive = doc.IsActive;
                        objDocument.TableKeyId = objQuatation.Id;
                        objDocument.TableName = Enum.GetName(TableNameEnum.ValuationQuotation);
                        objDocument.DocumentName = doc.DocumentName;
                        objDocument.FileName = doc.FileName;
                        objDocument.FilePath = doc.FilePath;
                        objDocument.FileType = doc.FileType;
                        objDocument.CreatedBy = doc.CreatedBy;

                        _repositoryDocument.AddAsync(objDocument);
                        await _unitOfWork.SaveChangesAsync();
                    }
                }
            }
            return DBOperation.Success;
        }
    }
}
