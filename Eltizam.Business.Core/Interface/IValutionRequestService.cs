﻿using Eltizam.Business.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Eltizam.Business.Core.Interface
{
    public interface IValutionRequestService
    {
        Task<DataTableResponseModel> GetAll(DataTableAjaxPostModel model, string? userName, string? clientName, int countryId, int stateId, int cityId, string fromDate, string toDate);
    }
}
