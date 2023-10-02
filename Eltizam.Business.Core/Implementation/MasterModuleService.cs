using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Eltizam.Business.Core.Interface;
using Eltizam.Business.Core.ModelMapper;
using Eltizam.Business.Models;
using Eltizam.Data.DataAccess.Core.Repositories;
using Eltizam.Data.DataAccess.Core.UnitOfWork;
using Eltizam.Data.DataAccess.Entity;

namespace Eltizam.Business.Core.Implementation
{
	public class MasterModuleService: IMasterModuleService
	{
		private readonly IUnitOfWork _unitOfWork;
		private readonly IMapperFactory _mapperFactory;
		
		public MasterModuleService(IUnitOfWork unitOfWork, IMapperFactory mapperFactory)
		{
			_unitOfWork = unitOfWork;
			_mapperFactory = mapperFactory;
			
		}

	

       

       
    }
}
