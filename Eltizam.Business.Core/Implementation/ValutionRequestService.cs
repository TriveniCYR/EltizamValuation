﻿using Eltizam.Business.Core.Interface;
using Eltizam.Business.Core.ModelMapper;
using Eltizam.Business.Models;
using Eltizam.Data.DataAccess.Core.Repositories;
using Eltizam.Data.DataAccess.Core.UnitOfWork;
using Eltizam.Data.DataAccess.Entity;
using Eltizam.Data.DataAccess.Helper;
using Eltizam.Resource;
using Eltizam.Utility.Utility;
using Microsoft.Extensions.Localization;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Eltizam.Business.Core.Implementation
{
    public class ValutionRequestService: IValutionRequestService
    {
        #region Properties
        private readonly IUnitOfWork _unitOfWork;
        private readonly IMapperFactory _mapperFactory;
        private readonly IStringLocalizer<Errors> _stringLocalizerError;
        private readonly Microsoft.Extensions.Configuration.IConfiguration configuration;
        private IRepository<ValuationRequest> _repository { get; set; }
        //private IRepository<MasterPropertySubType> _subrepository { get; set; }
        private readonly IHelper _helper;
        #endregion Properties

        #region Constructor
        public ValutionRequestService(IUnitOfWork unitOfWork, IMapperFactory mapperFactory, IStringLocalizer<Errors> stringLocalizerError,
          IHelper helper,
           Microsoft.Extensions.Configuration.IConfiguration _configuration)
        {
            _unitOfWork = unitOfWork;
            _mapperFactory = mapperFactory;

            _repository = _unitOfWork.GetRepository<ValuationRequest>();
            configuration = _configuration;
            _helper = helper;
        }
        #endregion Constructor
        public async Task<DataTableResponseModel> GetAll(DataTableAjaxPostModel model, string? userName, string? clientName, int countryId, int stateId, int cityId, string? fromDate, string? toDate)
        {
            string ColumnName = model.order.Count > 0 ? model.columns[model.order[0].column].data : string.Empty;
            //string SortDir = model.order[0]?.dir;
            string SortDir = "asc";

            SqlParameter[] osqlParameter =
            {
                new SqlParameter(AppConstants.P_CurrentPageNumber,  model.start),
                new SqlParameter(AppConstants.P_PageSize,           model.length),
                new SqlParameter(AppConstants.P_SortColumn,         ColumnName),
                new SqlParameter(AppConstants.P_SortDirection,      SortDir),
                new SqlParameter(AppConstants.P_SearchText,         model.search?.value),
                new SqlParameter("UserName",                        userName),
                 new SqlParameter("ClientName",                     clientName),
                new SqlParameter("CountryId",                       countryId),
                new SqlParameter("StateId",                         stateId),
                new SqlParameter("CityId",                          cityId),
                new SqlParameter("FromDate",                        fromDate),
                new SqlParameter("ToDate",                          toDate),
               
            };

            var Results = await _repository.GetBySP(ProcedureMetastore.usp_Valution_GetValuationList, CommandType.StoredProcedure, osqlParameter);

            //Get Pagination information
            var res = UtilityHelper.GetPaginationInfo(Results);

            DataTableResponseModel oDataTableResponseModel = new DataTableResponseModel(model.draw, res.Item1, res.Item1, Results.DataTableToList<ValutionRequestListModel>());

            return oDataTableResponseModel;
        }
    }
}
