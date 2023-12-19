using Eltizam.Business.Core.Interface;
using Eltizam.Business.Models;
using Eltizam.Data.DataAccess.Core.Repositories;
using Eltizam.Data.DataAccess.Core.UnitOfWork;
using Eltizam.Data.DataAccess.Entity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Eltizam.Business.Core.Implementation
{
    public class FileUploadService : IFileUploadService
    {
        private IRepository<MasterDocument> _documentRepository;
        private readonly IUnitOfWork _unitOfWork;

        public FileUploadService(IUnitOfWork unitOfWork)
        {
            _unitOfWork = unitOfWork;
            _documentRepository = _unitOfWork.GetRepository<MasterDocument>();

        }

        public async Task<bool> UploadFilesAsync(int tableKeyId, string tableName, List<MasterDocumentModel> uploadDocuments, int? createdBy)
        {
            if (uploadDocuments != null && uploadDocuments.Any())
            {
                foreach (var doc in uploadDocuments)
                {
                    var objUserDocument = new MasterDocument
                    {
                        IsActive = doc.IsActive,
                        TableKeyId = tableKeyId,
                        TableName = tableName,
                        DocumentName = doc.DocumentName,
                        FileName = doc.FileName,
                        FilePath = doc.FilePath,
                        FileType = doc.FileType,
                        CreatedBy = doc.CreatedBy
                    };

                    _documentRepository.AddAsync(objUserDocument);
                }

                await _unitOfWork.SaveChangesAsync();
                return true;
            }

            return false;
        }

    }

}
