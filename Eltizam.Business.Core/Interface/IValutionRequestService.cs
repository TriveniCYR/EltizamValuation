﻿using Eltizam.Business.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using static Eltizam.Utility.Enums.GeneralEnum;

namespace Eltizam.Business.Core.Interface
{
    public interface IValutionRequestService
    {
        Task<DataTableResponseModel> GetAll(DataTableAjaxPostModel model, string? userName, string? clientName, string? propertyName, int requestStatusId, int resourceId, int propertyTypeId, int countryId, int stateId, int cityId, string fromDate, string toDate);
        Task<DBOperation> AssignApprover(AssignApprovorRequestModel model);
        Task<DBOperation> AssignApproverStatus(ApprovorStatusRequestModel model);
        Task<List<ValuationMethod>> GetAllValuationMethod();
        Task<DBOperation> Upsert(ValuationRequestModel entityUser);
        Task<ValuationRequestModel> GetById(int id);
        Task<DBOperation> Delete(int id);
    }
}
