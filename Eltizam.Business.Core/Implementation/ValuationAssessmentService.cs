using Eltizam.Business.Core.Interface;
using Eltizam.Business.Core.ModelMapper;
using Eltizam.Business.Models;
using Eltizam.Data.DataAccess.Core.Repositories;
using Eltizam.Data.DataAccess.Core.UnitOfWork;
using Eltizam.Data.DataAccess.Entity;
using Eltizam.Utility.Enums;
using Eltizam.Utility.Utility;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
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
                        _siteRepository.UpdateGraph(objUser, EntityState.Modified);
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
                    _repository.UpdateGraph(objUser, EntityState.Modified);
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
                //Address details
                //if (evidence.Address != null)
                //{
                //    if (evidence.Address.Id > 0)
                //    {
                //        //Get current Entiry --AUDITLOGUSER
                //        var OldEntity = _addressRepository.GetNoTracking(evidence.Address.Id);
                //        objUserAddress = _addressRepository.Get(evidence.Address.Id);

                //        if (objUserAddress != null)
                //        {
                //            var entityAddress = _mapperFactory.Get<MasterUserAddressModel, MasterAddress>(evidence.Address);

                //            objUserAddress.Address1 = entityAddress.Address1;
                //            objUserAddress.Address2 = entityAddress.Address2;
                //            objUserAddress.CountryId = entityAddress.CountryId;
                //            objUserAddress.StateId = entityAddress.StateId; ;
                //            objUserAddress.CityId = entityAddress.CityId;
                //            objUserAddress.PinNo = entityAddress.PinNo;
                //            objUserAddress.IsActive = entityAddress.IsActive;
                //            objUserAddress.ModifiedBy = evidence.ModifiedBy;

                //            _addressRepository.UpdateAsync(objUserAddress);
                //            _addressRepository.UpdateGraph(objUserAddress, EntityState.Modified);
                //            await _unitOfWork.SaveChangesAsync();

                //            //Do Audit Log --AUDITLOGUSER
                //            await _auditLogService.CreateAuditLog<MasterAddress>(AuditActionTypeEnum.Update, OldEntity, objUserAddress, MainTableName, MainTableKey);
                //        }
                //    }
                //    else
                //    {
                //        objUserAddress = _mapperFactory.Get<MasterUserAddressModel, MasterAddress>(evidence.Address);
                //        //objUserAddress.IsActive = evidence.IsActive;
                //        objUserAddress.TableKeyId = objUser.Id;
                //        objUserAddress.TableName = Enum.GetName(TableNameEnum.Comparable_Evidence);
                //        objUserAddress.CreatedBy = evidence.CreatedBy;

                //        _addressRepository.AddAsync(objUserAddress);
                //        await _unitOfWork.SaveChangesAsync();
                //    }
                //}


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
                    objUser1.MarkentRent = assesment.MarkentRent;
                    objUser1.LifeOfBuilding = assesment.LifeOfBuilding;
                    objUser1.AnnualMaintainceCost = assesment.AnnualMaintainceCost;
                    objUser1.Insuarance = assesment.Insuarance;

                    objUser1.ModifiedBy = assesment.ModifiedBy;


                    _valutionrepository.UpdateAsync(objUser1);
                    _valutionrepository.UpdateGraph(objUser1, EntityState.Modified);
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



    }
}
