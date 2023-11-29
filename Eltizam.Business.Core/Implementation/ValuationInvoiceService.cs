using Eltizam.Business.Core.Interface;
using Eltizam.Business.Core.ModelMapper;
using Eltizam.Business.Models;
using Eltizam.Data.DataAccess.Core.Repositories;
using Eltizam.Data.DataAccess.Core.UnitOfWork;
using Eltizam.Data.DataAccess.Entity;
using Eltizam.Data.DataAccess.Helper;
using Eltizam.Utility;
using Eltizam.Utility.Enums;
using System.Data;
using static Eltizam.Utility.Enums.GeneralEnum;

namespace Eltizam.Business.Core.Implementation
{
    public class ValuationInvoiceService : IValuationInvoiceService
    {
        #region Properties
        private readonly IUnitOfWork _unitOfWork;
        private readonly IMapperFactory _mapperFactory;
        private readonly Microsoft.Extensions.Configuration.IConfiguration _configuration;
        private IRepository<ValuationInvoice> _repository;
        private readonly IHelper _helper;
        //private readonly int? _LoginUserId;

        private readonly IAuditLogService _auditLogService;
        #endregion Properties

        #region Constructor
        public ValuationInvoiceService(IUnitOfWork unitOfWork, IMapperFactory mapperFactory, IHelper helper, IAuditLogService auditLogService)
        {
            _unitOfWork = unitOfWork;
            _mapperFactory = mapperFactory;
            _repository = _unitOfWork.GetRepository<ValuationInvoice>();
            //_configuration = configuration;

            _helper = helper;
           // _LoginUserId = _helper.GetLoggedInUser()?.UserId;
            _auditLogService = auditLogService; 
        }
        #endregion Constructor


        public async Task<List<ValuationInvoiceListModel>> GetInvoiceList(int requestId)
        {
            DbParameter[] osqlParameter2 =
            {
                    new DbParameter("RequestId", requestId, SqlDbType.Int),
                };

            var invoiceList = EltizamDBHelper.ExecuteMappedReader<ValuationInvoiceListModel>(ProcedureMetastore.usp_Invoice_GetInvoiceByRequestId,
                                DatabaseConnection.ConnString, System.Data.CommandType.StoredProcedure, osqlParameter2);

            return invoiceList; 
        }

        public async Task<DBOperation> Upsert(ValuationInvoiceListModel entityInvoice)
        { 
            ValuationInvoice objInvoice;
            string MainTableName = Enum.GetName(TableNameEnum.ValuationInvoice);
            int MainTableKey = entityInvoice.Id;

            if (entityInvoice.Id > 0)
            { 
                ValuationInvoice OldEntity = null;
                OldEntity = _repository.GetNoTracking(entityInvoice.Id);

                objInvoice = _repository.Get(entityInvoice.Id);

                if (objInvoice != null)
                {
                    objInvoice.ReferenceNo = entityInvoice.ReferenceNo;
                    objInvoice.ValuationRequestId = entityInvoice.ValuationRequestId;
                    objInvoice.TransactionModeId = entityInvoice.TransactionModeId;
                    objInvoice.TransactionStatusId = entityInvoice.TransactionStatusId;
                    objInvoice.Amount = entityInvoice.Amount;
                    objInvoice.CheckNumer = entityInvoice.CheckNumer;
                    objInvoice.CheckBankName = entityInvoice.CheckBankName;
                    objInvoice.CheckDate = entityInvoice.CheckDate;
                    objInvoice.CardNumber = entityInvoice.CardNumber;
                    objInvoice.CardBankName = entityInvoice.CardBankName;
                    objInvoice.CardHolderName = entityInvoice.CardHolderName;
                    objInvoice.ExpireDate = entityInvoice.ExpireDate;
                    objInvoice.AccountBankName = entityInvoice.AccountBankName;
                    objInvoice.AccountHolderName = entityInvoice.AccountHolderName;
                    objInvoice.Note = entityInvoice.Note;
                    objInvoice.ModifiedDate = AppConstants.DateTime;
                    objInvoice.ModifiedBy = entityInvoice.ModifiedBy; 

                    _repository.UpdateAsync(objInvoice);
                    await _unitOfWork.SaveChangesAsync();

                    //Do Audit Log --AUDITLOGUSER
                    await _auditLogService.CreateAuditLog<ValuationInvoice>(AuditActionTypeEnum.Update, OldEntity, objInvoice, MainTableName, MainTableKey);
                }
                else
                {
                    return DBOperation.NotFound;
                }
            }
            else
            {
                objInvoice = _mapperFactory.Get<ValuationInvoiceListModel, ValuationInvoice>(entityInvoice);


                var lastReq = _repository.GetAll().OrderByDescending(a => a.Id).FirstOrDefault();
                objInvoice.ReferenceNo = string.Format("{0}{1}", AppConstants.ID_InvoiceRequest, lastReq?.Id);

                objInvoice.CreatedDate = AppConstants.DateTime;
                objInvoice.CreatedBy = entityInvoice.CreatedBy ?? 1;

                _repository.AddAsync(objInvoice);
                await _unitOfWork.SaveChangesAsync();
            } 

            if (objInvoice.Id == 0)
                return DBOperation.Error;

            return DBOperation.Success;
        }

        public async Task<ValuationInvoiceListModel> GetInvoiceById(int id)
        {
            var _quatationEntity = new ValuationInvoiceListModel();
            _quatationEntity = _mapperFactory.Get<ValuationInvoice, ValuationInvoiceListModel>(await _repository.GetAsync(id));

            return _quatationEntity;
        }

        public async Task<DBOperation> InvoiceDelete(int id)
        {
            var entityInvoice = _repository.Get(x => x.Id == id);

            if (entityInvoice == null)
                return DBOperation.NotFound;

            _repository.Remove(entityInvoice);

            await _unitOfWork.SaveChangesAsync();

            return DBOperation.Success;
        }
    }
}
