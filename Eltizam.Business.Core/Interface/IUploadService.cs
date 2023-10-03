using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Eltizam.Data.DataAccess.Entity;
using static Eltizam.Utility.Enums.GeneralEnum;

namespace Eltizam.Business.Core.Interface
{
    public interface IUploadService
    {
        Task<DBOperation> SaveFilesAsync(List<IFormFile> files);
        Task<IEnumerable<Upload>> GetAllUploadsAsync();

        Task<DBOperation> GetUploadByIdAsync(int id);
    }
}
