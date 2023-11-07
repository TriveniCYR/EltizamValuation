﻿using Eltizam.Business.Core.Interface;
using Eltizam.Business.Core.ModelMapper;
using Eltizam.Business.Models;
using Eltizam.Data.DataAccess.Core.Repositories;
using Eltizam.Data.DataAccess.Core.UnitOfWork;
using Eltizam.Data.DataAccess.Entity;
using Eltizam.Resource;
using Microsoft.Extensions.Localization;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using static Eltizam.Utility.Enums.GeneralEnum;

namespace Eltizam.Business.Core.Implementation
{
    public class ValuationInvoiceService : IValuationInvoiceService
    {
        #region Properties
        private readonly IUnitOfWork _unitOfWork;
        private readonly IMapperFactory _mapperFactory;
        private readonly IStringLocalizer<Errors> _stringLocalizerError;
        private readonly Microsoft.Extensions.Configuration.IConfiguration configuration;
        private IRepository<ValuationInvoice> _repository;
        private readonly IHelper _helper;
        private readonly int? _LoginUserId;
        #endregion Properties

        #region Constructor
        public ValuationInvoiceService(IUnitOfWork unitOfWork, IMapperFactory mapperFactory, IStringLocalizer<Errors> stringLocalizerError,
          IHelper helper,
           Microsoft.Extensions.Configuration.IConfiguration _configuration)
        {
            _unitOfWork = unitOfWork;
            _mapperFactory = mapperFactory;
            _repository = _unitOfWork.GetRepository<ValuationInvoice>();
            configuration = _configuration;
            _helper = helper;
            _LoginUserId = _helper.GetLoggedInUser()?.UserId;
        }
        #endregion Constructor


        public async Task<List<ValuationInvoiceListModel>> GetInvoiceList(int requestId)
        {
            var allList = _repository.GetAllAsync(x => x.ValuationRequestId == requestId).Result.ToList();
            return _mapperFactory.GetList<ValuationInvoice, ValuationInvoiceListModel>(allList);
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
