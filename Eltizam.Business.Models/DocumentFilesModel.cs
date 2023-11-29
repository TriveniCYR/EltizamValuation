using Microsoft.AspNetCore.Http;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Eltizam.Business.Models
{
    public class DocumentFilesModel
    {
        [StringLength(250, MinimumLength = 1)]
        public string? DocumentName { get; set; }
        public List<IFormFile>? Files { get; set; }
    }
}
