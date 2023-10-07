using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Eltizam.Business.Models
{
    public class SmartTableParam<T> where T : class
    {
        public T? Search { get; set; }
        public PaginationModel? paging { get; set; }
    }
}
