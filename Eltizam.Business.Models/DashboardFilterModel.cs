﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Eltizam.Business.Models
{
    public class DashboardFilterModel
    {
        public int PropertyId { get; set; }
        public int ClientId { get; set; }
        public string? FromDate { get; set; }
        public string? ToDate { get; set; }
    }
}
