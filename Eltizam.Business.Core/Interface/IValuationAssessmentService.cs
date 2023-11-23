using Eltizam.Business.Models;
using Eltizam.Data.DataAccess.Entity;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using static Eltizam.Utility.Enums.GeneralEnum;

namespace Eltizam.Business.Core.Interface
{
    public interface IValuationAssessmentService
    {
        Task<DBOperation> ValuationAssesmentUpsert(ValuationAssesmentActionModel model);
        //Task<DBOperation> SideDescriptionUpsert(SiteDescriptionModel model);
        //Task<DBOperation> EvidenceUpsert(ComparableEvidenceModel entityUser);
        //Task<DBOperation> AssesmentUpsert(ValuationAssessementModel assesment);
        Task<SiteDescriptionModel> GetSiteDescriptionList(int requestId);
        Task<DBOperation> DeleteDocument(int id);
    }
}
