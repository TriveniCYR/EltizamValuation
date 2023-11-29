using Microsoft.AspNetCore.Http;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Eltizam.Business.Models
{
    public class MasterDocumentModel
    {
        public int? Id { get; set; }
        public int? UserId { get; set; }
        [StringLength(250, MinimumLength = 1)]
        public string? DocumentName { get; set; }
        public string? FileName { get; set; }
        public string? FileType { get; set; }
        public string? FilePath { get; set; }
        public int? IsActive { get; set; }
        public int? CreatedBy { get; set; }
        public string? CreatedName { get; set; }
        public DateTime? CreatedDate { get; set; }
    }
}
