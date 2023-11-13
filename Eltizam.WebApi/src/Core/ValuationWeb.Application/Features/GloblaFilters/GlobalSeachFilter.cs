using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ValuationWeb.Application.Features.GloblaFilters
{
    /// <summary>
    /// Added by YReddy on 08/15/2022
    /// Class used to hold global search filter inputs
    /// </summary>
    public class GlobalSeachFilter
    {
        public int? PageNumber { get; set; }
        public int? PageSize { get; set; }
        public string? OrderClause { get; set; }
        public int? ReverseSort { get; set; }
    }

    /// <summary>
    /// Added by YReddy on 08/15/2022
    /// Class used to hold global search response
    /// </summary>
    public class GlobalSeachResponse : GlobalSeachFilter
    {
        public int? TotalRecords { get; set; }
        public dynamic dataresults { get; set; }
    }
}
