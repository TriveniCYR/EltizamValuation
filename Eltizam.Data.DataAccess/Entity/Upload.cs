using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Eltizam.Data.DataAccess.Entity
{
    public class Upload
    {
        public int Id { get; set; }
        public string FileName { get; set; }
        //public byte[] FileData { get; set; }
        public string ContentType { get; set; }
        public DateTime CreatedDate { get; set; }
        public string FileType { get; set; }
    }
}
