using Eltizam.Business.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Eltizam.Business.Core.Interface
{
    public interface IFileUploadService
    {
         Task<bool> UploadFilesAsync(int tableKeyId, string tableName, List<MasterDocumentModel> uploadDocuments, int? createdBy);
        
    }
}
