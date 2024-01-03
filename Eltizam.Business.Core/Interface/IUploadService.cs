using Eltizam.Data.DataAccess.Entity;
using Microsoft.AspNetCore.Http;
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
