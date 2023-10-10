using Microsoft.AspNetCore.Http;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Eltizam.Business.Models
{
    public class MasterDocumentModel
    {
        public int? Id { get; set; }
        public int? UserId { get; set; }
        public string? DocumentName { get; set; }
        public string? FileName { get; set; }
        public string? FileType { get; set; }
        public string? FilePath { get; set; }
        public int? IsActive { get; set; }
    }
}
