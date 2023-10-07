﻿using System;
using System.Collections.Generic;

namespace EltizamValuation.Api.Entity
{
    public partial class MasterLocation
    {
        public int Id { get; set; }
        public string LocationName { get; set; } = null!;
        public int CountryId { get; set; }
        public int StateId { get; set; }
        public int CityId { get; set; }
        public string? Sector { get; set; }
        public int? Status { get; set; }
        public string? Latitude { get; set; }
        public string? Longitude { get; set; }
        public DateTime? CreatedDate { get; set; }
        public int? CreatedBy { get; set; }
        public DateTime? ModifiedDate { get; set; }
        public int? ModifiedBy { get; set; }

        public virtual MasterCity City { get; set; } = null!;
        public virtual MasterCountry Country { get; set; } = null!;
        public virtual MasterState State { get; set; } = null!;
    }
}
