using AutoMapper;
using Eltizam.Business.Models;
using Eltizam.Data.DataAccess.Core.UnitOfWork;
using Eltizam.Data.DataAccess.Entity;
using Eltizam.Data.DataAccess.Helper;
using MediatR;
using Microsoft.Extensions.Logging;
using ValuationWeb.Application.Contracts.Persistence;
using static Eltizam.Utility.Enums.GeneralEnum;

namespace ValuationWeb.Application.Features
{
    public class MasterCityGetAllCommandHandler : IRequestHandler<MasterCityGetAllCommand, DataTableResponseModel>
    {
        private readonly IMasterCityRepository _cityRepository;
        private readonly IMapper _mapper;
        private readonly ILogger _logger;
       // private readonly IUnitOfWork _unitOfWork;
        public MasterCityGetAllCommandHandler(IMapper mapper, IMasterCityRepository cityRepository, ILogger<MasterCityGetAllCommandHandler> logger)
                //, IUnitOfWork unitOfWork)
        {
            _cityRepository = cityRepository;
            //_unitOfWork = unitOfWork;
        }

        public async Task<DataTableResponseModel> Handle(MasterCityGetAllCommand request, CancellationToken cancellationToken)
        {
            var dd = new DataTableAjaxPostModel()
            {
                draw = 1,
                length = 10
            };

            var alldata = await _cityRepository.GetAll(dd);  
            return alldata;
        }
    }

    public class MasterCityGetByIdCommandHandler : IRequestHandler<MasterCityGetByIdCommand, MasterCityEntity>
    {
        private readonly IMasterCityRepository _cityRepository;
        private readonly IMapper _mapper;
        private readonly ILogger _logger;
        public MasterCityGetByIdCommandHandler(IMapper mapper, IMasterCityRepository cityRepository, ILogger<MasterCityGetByIdCommandHandler> logger)
        {
            _cityRepository = cityRepository;
            _mapper = mapper;
        }

        public async Task<MasterCityEntity> Handle(MasterCityGetByIdCommand request, CancellationToken cancellationToken)
        {
            var ddd = await _cityRepository.GetByIdAsync(request.Id); 
            var d = _mapper.Map<MasterCityEntity>(ddd);

            return d;
        }
    } 

    public class MasterCityDeleteCommandHandler : IRequestHandler<MasterCityDeleteCommand, bool>
    {
        private readonly IMasterCityRepository _cityRepository;
        private readonly IMapper _mapper;
        private readonly ILogger _logger;
        public MasterCityDeleteCommandHandler(IMapper mapper, IMasterCityRepository cityRepository, ILogger<MasterCityDeleteCommandHandler> logger)
        {
            _cityRepository = cityRepository;
        }

        public async Task<bool> Handle(MasterCityDeleteCommand request, CancellationToken cancellationToken)
        {
            var city = await _cityRepository.GetByIdAsync(request.Id);

            await _cityRepository.DeleteAsync(city);
            return true;
        }
    }


    /// <summary> 
    /// Added by YReddy on 08/17/2022 dsd sds
    /// Class used to take care for Update user action
    /// </summary>
    public class MasterCityUpsertCommandHandler : IRequestHandler<MasterCityUpsertCommand, DBOperation>
    {
        private readonly IMasterCityRepository _cityRepository;
        private readonly IMapper _mapper;
        private readonly ILogger _logger;

        public MasterCityUpsertCommandHandler(IMapper mapper, IMasterCityRepository cityRepository, ILogger<MasterCityUpsertCommandHandler> logger)
        {
            _mapper = mapper;
            _cityRepository = cityRepository;
        }

        public async Task<DBOperation> Handle(MasterCityUpsertCommand request, CancellationToken cancellationToken)
        { 
            var existUser = await _cityRepository.GetByIdAsync(request.Id); 
            
            {
                MasterCity objCity = await _cityRepository.GetByIdAsync(request.Id);
                MasterCity OldObjCity = null;
                OldObjCity = await _cityRepository.GetByIdAsync(request.Id);

                if (objCity != null)
                {  
                    if (objCity != null)
                    {
                        objCity.CityName = request.CityName;
                        objCity.CountryId = request.CountryId;
                        objCity.StateId = request.StateId;
                        objCity.Stdcode = request.STDCode;
                        objCity.IsActive = request.IsActive;
                        objCity.ModifiedDate = AppConstants.DateTime;
                        objCity.ModifiedBy = request.CreatedBy;

                        await _cityRepository.UpdateAsync(objCity);
                    }
                    else
                    {
                        return DBOperation.NotFound;
                    }
                }
                else
                {
                    objCity = new MasterCity();

                    objCity.CityName = request.CityName;
                    objCity.CountryId = request.CountryId;
                    objCity.StateId = request.StateId;
                    objCity.Stdcode = request.STDCode;
                    objCity.IsActive = request.IsActive;
                    objCity.CreatedDate = AppConstants.DateTime;
                    objCity.CreatedBy = request.CreatedBy;
                    objCity.ModifiedDate = AppConstants.DateTime;
                    objCity.ModifiedBy = request.CreatedBy;

                    await _cityRepository.AddAsync(objCity);
                }
                //await _unitOfWork.SaveChangesAsync();

                if (objCity.Id == 0)
                    return DBOperation.Error;

                return DBOperation.Success;
            } 
        }
    }
}
