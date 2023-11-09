using Eltizam.Resource.Resources;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Eltizam.Business.Models
{
    public class ValutionRequestListModel
    {
        public int Id { get; set; }
       
        public string? ClientName { get; set; }
        public string? ClientType { get; set; }

        public string? Location { get; set; }

        public string? PropertyName { get; set; }

        public DateTime? ValuationDate { get; set; }
        public string? ValuationPurpose { get; set; }

        public string? StatusName { get; set; }

        public string? Approver { get; set; }

        public string? Requestor { get; set; }
        public string? Valuator { get; set; }
        public string? MethodOfValution { get; set; }

        public string? ColorCode { get; set; }

        public string? BackGroundColor { get; set; }

        public string? ReferenceNO { get; set; }

        public int? CountryId { get; set; }
        public int? StateId { get; set; }
        public int? CityId { get; set; }

        public string? CountryName { get; set; }
       
        public string? StateName { get; set; }

        public string? UserName { get; set; }

        public string? CityName { get; set; }
        public int? PropertyTypeId { get; set; }

        public string? RequestStatusId { get; set; }
        public int? ResourceId { get; set; } 
        public string? FromDate { get; set; }
        public string? ToDate { get; set; } 
    }
}
