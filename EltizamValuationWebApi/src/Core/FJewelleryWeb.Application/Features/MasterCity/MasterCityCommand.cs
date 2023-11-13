using Eltizam.Business.Models;
using MediatR;
using static Eltizam.Utility.Enums.GeneralEnum;

namespace ValuationWeb.Application.Features
{
    public class MasterCityCommand
    {
       
    }

    /// <summary>
    /// /
    /// </summary>
    public class MasterCityGetAllCommand : IRequest<DataTableResponseModel>
    {
        public int draw { get; set; }
        public int length { get; set; }
        public int start { get; set; }
        public string searchText { get; set; }
    }

    public class MasterCityGetByIdCommand : IRequest<MasterCityEntity>
    {
        public int Id { get; set; } 
    }

    public class MasterCityDeleteCommand : IRequest<bool>
    {
        public int Id { get; set; }
    }


    public class MasterCityUpsertCommand : IRequest<DBOperation>
    {
        public int Id { get; set; }
        public string CityName { get; set; }
        public int CountryId { get; set; }
        public string CountryName { get; set; }
        public int StateId { get; set; }
        public string StateName { get; set; }
        public string STDCode { get; set; }
        public int IsActive { get; set; }
        public DateTime CreatedOn { get; set; }
        public int CreatedBy { get; set; }
    }
}
