using Eltizam.Business.Core.Interface;
using Eltizam.Business.Core.ModelMapper;
using Eltizam.Business.Models;
using Eltizam.Data.DataAccess.Core.Repositories;
using Eltizam.Data.DataAccess.Core.UnitOfWork;
using Eltizam.Data.DataAccess.Entity;
using Eltizam.Data.DataAccess.Helper;
using Eltizam.Utility;
using Eltizam.Utility.Enums;
using Eltizam.Utility.Utility;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Security.Policy;
using System.Text;
using System.Threading.Tasks;
using static Eltizam.Utility.Enums.GeneralEnum;

namespace Eltizam.Business.Core.Implementation
{
    public class ValuationAssessmentService: IValuationAssessmentService
    {
        private readonly IUnitOfWork _unitOfWork;
        private readonly IMapperFactory _mapperFactory;
        private readonly Microsoft.Extensions.Configuration.IConfiguration configuration;
        private IRepository<ComparableEvidence> _repository { get; set; }
        private IRepository<ValuationAssesment> _valutionrepository { get; set; }
        private IRepository<SiteDescription> _siteRepository { get; set; }
        private IRepository<MasterAddress> _addressRepository { get; set; }

        private IRepository<MasterDocument> _documentRepository { get; set; }

        private readonly IAuditLogService _auditLogService;
        private readonly IHelper _helper;
        private readonly int? _LoginUserId;

        public ValuationAssessmentService(IUnitOfWork unitOfWork, IMapperFactory mapperFactory, IAuditLogService auditLogService,
                               IHelper helper, Microsoft.Extensions.Configuration.IConfiguration _configuration)
        {
            _unitOfWork = unitOfWork;
            _mapperFactory = mapperFactory;


            _repository = _unitOfWork.GetRepository<ComparableEvidence>();
            _siteRepository = _unitOfWork.GetRepository<SiteDescription>();
            _valutionrepository = _unitOfWork.GetRepository<ValuationAssesment>();
            _addressRepository = _unitOfWork.GetRepository<MasterAddress>();

            _documentRepository = _unitOfWork.GetRepository<MasterDocument>();
            configuration = _configuration;
            _helper = helper;
            _auditLogService = auditLogService;
        }


        public async Task<DBOperation> ValuationAssesmentUpsert(ValuationAssesmentActionModel model)
        {
          
            SiteDescription objUser;

            ComparableEvidence comparable;
            ValuationAssesment objUser1;
            MasterDocument objUserDocument;
            objUser = _siteRepository.GetAll().Where(x => x.ValuationRequestId == model.SiteDescription.ValuationRequestId).FirstOrDefault();

           


            //User details
            if (objUser!=null)
            {
                string MainTableName = Enum.GetName(TableNameEnum.SiteDescription);
                int MainTableKey = objUser.Id;
                //Get current Entiry --AUDITLOGUSER
                SiteDescription OldEntity = null;
                OldEntity = _siteRepository.GetNoTracking(objUser.Id);
                objUser = _siteRepository.Get(objUser.Id);



                if (objUser != null)
                {
                    objUser.Location = model.SiteDescription.Location;
                    objUser.InternalArea = model.SiteDescription.InternalArea;
                    objUser.ExternalArea = model.SiteDescription.ExternalArea;
                    objUser.Floor = model.SiteDescription.Floor;
                    objUser.Room = model.SiteDescription.Room;
                    objUser.Bedrooms = model.SiteDescription.Bedrooms;
                    objUser.Storage = model.SiteDescription.Storage;
                    objUser.Quantity = model.SiteDescription.Quantity;
                    objUser.AdditionComment = model.SiteDescription.AdditionComment;
                    objUser.PropertyCondition = model.SiteDescription.PropertyCondition;
                    objUser.AdditionalNotes = model.SiteDescription.AdditionalNotes;
                    objUser.Others = model.SiteDescription.Others;

                    objUser.ModifiedBy = model.SiteDescription.ModifiedBy;


                    _siteRepository.UpdateAsync(objUser);
                    //_siteRepository.UpdateGraph(objUser, EntityState.Modified);
                    await _unitOfWork.SaveChangesAsync();

                    //Do Audit Log --AUDITLOGUSER
                    await _auditLogService.CreateAuditLog<SiteDescription>(AuditActionTypeEnum.Update, OldEntity, objUser, MainTableName, MainTableKey);
                }
            }
            else
            {
                objUser = _mapperFactory.Get<SiteDescriptionModel, SiteDescription>(model.SiteDescription);

                objUser.CreatedBy = model.SiteDescription.CreatedBy;

                _siteRepository.AddAsync(objUser);
                await _unitOfWork.SaveChangesAsync();
            }


            if (objUser.Id == 0)
                return DBOperation.Error;
            else
            {
                if (model.SiteDescription.uploadDocument != null)
                {
                    foreach (var doc in model.SiteDescription.uploadDocument)
                    {
                        objUserDocument = _mapperFactory.Get<MasterDocumentModel, MasterDocument>(doc);
                        objUserDocument.IsActive = doc.IsActive;
                        objUserDocument.TableKeyId = objUser.Id;
                        objUserDocument.TableName = Enum.GetName(TableNameEnum.SiteDescription);
                        objUserDocument.DocumentName = doc.DocumentName;
                        objUserDocument.FileName = doc.FileName;
                        objUserDocument.FilePath = doc.FilePath;
                        objUserDocument.FileType = doc.FileType;
                        objUserDocument.CreatedBy = model.SiteDescription.CreatedBy;

                        _documentRepository.AddAsync(objUserDocument);
                        await _unitOfWork.SaveChangesAsync();
                    }
                }
            }


            comparable = _repository.GetAll().Where(x => x.RequestId == model.comparableEvidenceModel.RequestId).FirstOrDefault();

            if (comparable != null)
            {
                int MaincomparableTableKey = comparable.Id;
                string MaincomparableTableName = Enum.GetName(TableNameEnum.Comparable_Evidence);

                //Get current Entiry --AUDITLOGUSER
                ComparableEvidence OldEntity = null;
                OldEntity = _repository.GetNoTracking(comparable.Id);

                comparable = _repository.Get(comparable.Id);

                if (comparable != null)
                {
                    comparable.Type = model.comparableEvidenceModel.Type;
                    comparable.Size = model.comparableEvidenceModel.Size;
                    comparable.Remarks = model.comparableEvidenceModel.Remarks;
                    comparable.Price = model.comparableEvidenceModel.Price;

                    comparable.ModifiedBy = model.comparableEvidenceModel.ModifiedBy;


                    _repository.UpdateAsync(comparable);
                    //_repository.UpdateGraph(comparable, EntityState.Modified);
                    await _unitOfWork.SaveChangesAsync();

                    //Do Audit Log --AUDITLOGUSER
                    await _auditLogService.CreateAuditLog<ComparableEvidence>(AuditActionTypeEnum.Update, OldEntity, comparable, MaincomparableTableName, MaincomparableTableKey);
                }
            }
            else
            {
                comparable = _mapperFactory.Get<ComparableEvidenceModel, ComparableEvidence>(model.comparableEvidenceModel);

                comparable.CreatedBy = model.comparableEvidenceModel.CreatedBy;
                comparable.IsActive = model.comparableEvidenceModel.IsActive;

                _repository.AddAsync(comparable);
                await _unitOfWork.SaveChangesAsync();
            }


            if (objUser.Id == 0)
                return DBOperation.Error;
            else
            {

                if (model.comparableEvidenceModel.uploadDocument != null)
                {
                    foreach (var doc in model.comparableEvidenceModel.uploadDocument)
                    {
                        objUserDocument = _mapperFactory.Get<MasterDocumentModel, MasterDocument>(doc);
                        objUserDocument.IsActive = doc.IsActive;
                        objUserDocument.TableKeyId = comparable.Id;
                        objUserDocument.TableName = Enum.GetName(TableNameEnum.Comparable_Evidence);
                        objUserDocument.DocumentName = doc.DocumentName;
                        objUserDocument.FileName = doc.FileName;
                        objUserDocument.FilePath = doc.FilePath;
                        objUserDocument.FileType = doc.FileType;
                        objUserDocument.CreatedBy = model.comparableEvidenceModel.CreatedBy;

                        _documentRepository.AddAsync(objUserDocument);
                        await _unitOfWork.SaveChangesAsync();
                    }
                }
            }

            objUser1 = _valutionrepository.GetAll().Where(x => x.RequestId == model.valuationAssessementModel.RequestId).FirstOrDefault();
         
            if (objUser1 != null)
            {
                string MainAssesmentTableName = Enum.GetName(TableNameEnum.Valuation_Assessement);
                int MainTableAssesmentKey = objUser1.Id;

                //Get current Entiry --AUDITLOGUSER
                ValuationAssesment OldEntity = null;
                OldEntity = _valutionrepository.GetNoTracking(objUser1.Id);

                objUser1 = _valutionrepository.Get(objUser1.Id);

                if (objUser1 != null)
                {
                    objUser1.MarketValue = model.valuationAssessementModel.MarketValue;
                    objUser1.MarketRate = model.valuationAssessementModel.MarketRate;
                    objUser1.LifeOfBuilding = model.valuationAssessementModel.LifeOfBuilding;
                    objUser1.AnnualMaintainceCost = model.valuationAssessementModel.AnnualMaintainceCost;
                    objUser1.Insuarance = model.valuationAssessementModel.Insuarance;
                    objUser1.InsuranceDetails = model.valuationAssessementModel.InsuranceDetails;
                    objUser1.ModifiedBy = model.valuationAssessementModel.ModifiedBy;


                    _valutionrepository.UpdateAsync(objUser1);
                    //_valutionrepository.UpdateGraph(objUser1, EntityState.Modified);
                    await _unitOfWork.SaveChangesAsync();

                    //Do Audit Log --AUDITLOGUSER
                    await _auditLogService.CreateAuditLog<ValuationAssesment>(AuditActionTypeEnum.Update, OldEntity, objUser1, MainAssesmentTableName, MainTableAssesmentKey);
                }
            }
            else
            {
                objUser1 = _mapperFactory.Get<ValuationAssessementModel, ValuationAssesment>(model.valuationAssessementModel);

                objUser1.CreatedBy = model.valuationAssessementModel.CreatedBy;

                _valutionrepository.AddAsync(objUser1);
                await _unitOfWork.SaveChangesAsync();
            }


            if (objUser1.Id == 0)
                return DBOperation.Error;
            else
            {

                if (model.valuationAssessementModel.uploadDocument != null)
                {
                    foreach (var doc in model.valuationAssessementModel.uploadDocument)
                    {
                        objUserDocument = _mapperFactory.Get<MasterDocumentModel, MasterDocument>(doc);
                        objUserDocument.IsActive = doc.IsActive;
                        objUserDocument.TableKeyId = objUser1.Id;
                        objUserDocument.TableName = Enum.GetName(TableNameEnum.Valuation_Assessement);
                        objUserDocument.DocumentName = doc.DocumentName;
                        objUserDocument.FileName = doc.FileName;
                        objUserDocument.FilePath = doc.FilePath;
                        objUserDocument.FileType = doc.FileType;
                        objUserDocument.CreatedBy = model.valuationAssessementModel.CreatedBy;

                        _documentRepository.AddAsync(objUserDocument);
                        await _unitOfWork.SaveChangesAsync();
                    }
                }
            }




            return DBOperation.Success;
        }

        public async Task<SiteDescriptionModel> GetSiteDescriptionList(int requestId)
        {
            DbParameter[] osqlParameter2 =
            {
                    new DbParameter("RequestId", requestId, SqlDbType.Int),
                };

            var quottationList = EltizamDBHelper.ExecuteSingleMappedReader<SiteDescriptionModel>(ProcedureMetastore.usp_Site_GetSiteDescriptionByRequestId,
                                DatabaseConnection.ConnString, System.Data.CommandType.StoredProcedure, osqlParameter2);

            return quottationList;
            //var allList = _repository.GetAllAsync(x => x.ValuationRequestId == requestId).Result.ToList();
            //return _mapperFactory.GetList<ValuationQuotation, ValuationQuatationListModel>(allList);
        }

        public async Task<DBOperation> SideDescriptionUpsert(SiteDescriptionModel model)
        {

            SiteDescription objUser;
            MasterDocument objUserDocument;

            string MainTableName = Enum.GetName(TableNameEnum.SiteDescription);
            int MainTableKey = model.Id;

            //User details
            if (model.Id > 0)
            {
                //Get current Entiry --AUDITLOGUSER
                SiteDescription OldEntity = null;
                OldEntity = _siteRepository.GetNoTracking(model.Id);

                objUser = _siteRepository.Get(model.Id);

                if (objUser != null)
                {
                    objUser.Location = model.Location;
                    objUser.InternalArea = model.InternalArea;
                    objUser.ExternalArea = model.ExternalArea;
                    objUser.Floor = model.Floor;
                    objUser.Room = model.Room;
                    objUser.Bedrooms = model.Bedrooms;
                    objUser.Storage = model.Storage;
                    objUser.Quantity = model.Quantity;
                    objUser.AdditionComment = model.AdditionComment;
                    objUser.PropertyCondition = model.PropertyCondition;
                    objUser.AdditionalNotes = model.AdditionalNotes;
                    objUser.Others = model.Others;

                    objUser.ModifiedBy = model.ModifiedBy;


                    _siteRepository.UpdateAsync(objUser);
                    //_siteRepository.UpdateGraph(objUser, EntityState.Modified);
                    await _unitOfWork.SaveChangesAsync();

                    //Do Audit Log --AUDITLOGUSER
                    await _auditLogService.CreateAuditLog<SiteDescription>(AuditActionTypeEnum.Update, OldEntity, objUser, MainTableName, MainTableKey);
                }
            }
            else
            {
                objUser = _mapperFactory.Get<SiteDescriptionModel, SiteDescription>(model);

                objUser.CreatedBy = model.CreatedBy;

                _siteRepository.AddAsync(objUser);
                await _unitOfWork.SaveChangesAsync();
            }


            if (objUser.Id == 0)
                return DBOperation.Error;
            else
            {
                if (model.uploadDocument != null)
                {
                    foreach (var doc in model.uploadDocument)
                    {
                        objUserDocument = _mapperFactory.Get<MasterDocumentModel, MasterDocument>(doc);
                        objUserDocument.IsActive = doc.IsActive;
                        objUserDocument.TableKeyId = objUser.Id;
                        objUserDocument.TableName = Enum.GetName(TableNameEnum.SiteDescription);
                        objUserDocument.DocumentName = doc.DocumentName;
                        objUserDocument.FileName = doc.FileName;
                        objUserDocument.FilePath = doc.FilePath;
                        objUserDocument.FileType = doc.FileType;
                        objUserDocument.CreatedBy = model.CreatedBy;

                        _documentRepository.AddAsync(objUserDocument);
                        await _unitOfWork.SaveChangesAsync();
                    }
                }
            }

            return DBOperation.Success;
        }
        public async Task<DBOperation> EvidenceUpsert(ComparableEvidenceModel evidence)
        {

            ComparableEvidence objUser;
            MasterAddress objUserAddress;
            MasterQualification objUserQualification;
            MasterDocument objUserDocument;

            string MainTableName = Enum.GetName(TableNameEnum.Comparable_Evidence);
            int MainTableKey = evidence.Id;

            //User details
            if (evidence.Id > 0)
            {
                //Get current Entiry --AUDITLOGUSER
                ComparableEvidence OldEntity = null;
                OldEntity = _repository.GetNoTracking(evidence.Id);

                objUser = _repository.Get(evidence.Id);

                if (objUser != null)
                {
                    objUser.Type = evidence.Type;
                    objUser.Size = evidence.Size;
                    objUser.Remarks = evidence.Remarks;
                    objUser.RateSqFt = evidence.RateSqFt;
                    objUser.Price = evidence.Price;

                    objUser.ModifiedBy = evidence.ModifiedBy;


                    _repository.UpdateAsync(objUser);
                    //_repository.UpdateGraph(objUser, EntityState.Modified);
                    await _unitOfWork.SaveChangesAsync();

                    //Do Audit Log --AUDITLOGUSER
                    await _auditLogService.CreateAuditLog<ComparableEvidence>(AuditActionTypeEnum.Update, OldEntity, objUser, MainTableName, MainTableKey);
                }
            }
            else
            {
                objUser = _mapperFactory.Get<ComparableEvidenceModel, ComparableEvidence>(evidence);

                objUser.CreatedBy = evidence.CreatedBy;
                objUser.IsActive = evidence.IsActive;

                _repository.AddAsync(objUser);
                await _unitOfWork.SaveChangesAsync();
            }


            if (objUser.Id == 0)
                return DBOperation.Error;
            else
            {
               
                if (evidence.uploadDocument != null)
                {
                    foreach (var doc in evidence.uploadDocument)
                    {
                        objUserDocument = _mapperFactory.Get<MasterDocumentModel, MasterDocument>(doc);
                        objUserDocument.IsActive = doc.IsActive;
                        objUserDocument.TableKeyId = objUser.Id;
                        objUserDocument.TableName = Enum.GetName(TableNameEnum.Comparable_Evidence);
                        objUserDocument.DocumentName = doc.DocumentName;
                        objUserDocument.FileName = doc.FileName;
                        objUserDocument.FilePath = doc.FilePath;
                        objUserDocument.FileType = doc.FileType;
                        objUserDocument.CreatedBy = evidence.CreatedBy;

                        _documentRepository.AddAsync(objUserDocument);
                        await _unitOfWork.SaveChangesAsync();
                    }
                }
            }

            return DBOperation.Success;
        }

        public async Task<DBOperation> AssesmentUpsert(ValuationAssessementModel assesment)
        {

            ValuationAssesment objUser1;
            MasterAddress objUserAddress;
            MasterQualification objUserQualification;
            MasterDocument objUserDocument;

            string MainTableName = Enum.GetName(TableNameEnum.Valuation_Assessement);
            int MainTableKey = assesment.Id;

            //User details
            if (assesment.Id > 0)
            {
                //Get current Entiry --AUDITLOGUSER
                ValuationAssesment OldEntity = null;
                OldEntity = _valutionrepository.GetNoTracking(assesment.Id);

                objUser1 = _valutionrepository.Get(assesment.Id);

                if (objUser1 != null)
                {
                    objUser1.MarketValue = assesment.MarketValue;
                    objUser1.MarketRate = assesment.MarketRate;
                    objUser1.LifeOfBuilding = assesment.LifeOfBuilding;
                    objUser1.AnnualMaintainceCost = assesment.AnnualMaintainceCost;
                    objUser1.Insuarance = assesment.Insuarance;

                    objUser1.ModifiedBy = assesment.ModifiedBy;


                    _valutionrepository.UpdateAsync(objUser1);
                    //_valutionrepository.UpdateGraph(objUser1, EntityState.Modified);
                    await _unitOfWork.SaveChangesAsync();

                    //Do Audit Log --AUDITLOGUSER
                    await _auditLogService.CreateAuditLog<ValuationAssesment>(AuditActionTypeEnum.Update, OldEntity, objUser1, MainTableName, MainTableKey);
                }
            }
            else
            {
                objUser1 = _mapperFactory.Get<ValuationAssessementModel, ValuationAssesment>(assesment);

                objUser1.CreatedBy = assesment.CreatedBy;

                _valutionrepository.AddAsync(objUser1);
                await _unitOfWork.SaveChangesAsync();
            }


            if (objUser1.Id == 0)
                return DBOperation.Error;
            else
            {

                if (assesment.uploadDocument != null)
                {
                    foreach (var doc in assesment.uploadDocument)
                    {
                        objUserDocument = _mapperFactory.Get<MasterDocumentModel, MasterDocument>(doc);
                        objUserDocument.IsActive = doc.IsActive;
                        objUserDocument.TableKeyId = objUser1.Id;
                        objUserDocument.TableName = Enum.GetName(TableNameEnum.Valuation_Assessement);
                        objUserDocument.DocumentName = doc.DocumentName;
                        objUserDocument.FileName = doc.FileName;
                        objUserDocument.FilePath = doc.FilePath;
                        objUserDocument.FileType = doc.FileType;
                        objUserDocument.CreatedBy = assesment.CreatedBy;

                        _documentRepository.AddAsync(objUserDocument);
                        await _unitOfWork.SaveChangesAsync();
                    }
                }
            }

            return DBOperation.Success;
        }


        public async Task<DBOperation> DeleteDocument(int id,int? by)
        {
            if (id > 0)
            {

                var entityDoc = _documentRepository.Get(id);
                if (entityDoc != null)
                {
                    _documentRepository.Remove(entityDoc);
                    await _unitOfWork.SaveChangesAsync();
                }
            }
            // Return a success operation indicating successful deletion.
            return DBOperation.Success;
        }



    }
}
