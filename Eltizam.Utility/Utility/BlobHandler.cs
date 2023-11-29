using Microsoft.Extensions.Configuration;
using Microsoft.WindowsAzure.Storage;
using Microsoft.WindowsAzure.Storage.Blob;
using System.Configuration;
using System.Net.Mail;

namespace AzureBlobHandler
{
    public class BlobHandler
    {
        private const string BlobConnectionString = "BlobSettings:BlobConnectionString";
        private const string BlobContainerName = "BlobSettings:BlobContainerName";

        public async Task<BlobResponse?> SingleFileUpload(Stream fileStream, int attachmentId, string fileName, string tableName, int tableKey, int createUserId, string? fileExtension = null, string? subSection = null)
        {
            try
            {
                if (fileStream is null || fileStream.Length <= 0 || string.IsNullOrWhiteSpace(fileName) || tableKey <= 0 || string.IsNullOrWhiteSpace(tableName)) return null;

                #region Handling the file to be uploaded

                var originalFileName = fileName;
                var fileNameWithSpaceReplaced = originalFileName.Replace(" ", "_");
                fileExtension = fileExtension ?? Path.GetExtension(fileName);
                var fileExtensionWithoutDot = fileExtension.Replace(".", String.Empty);
                var fileNameWithoutExtension = Path.GetFileNameWithoutExtension(fileNameWithSpaceReplaced);

                //e.g., Image_14.png
                var blobFileName = $"{fileNameWithoutExtension}_{attachmentId}{fileExtension}";

                //Upload the file to Azure
                var blockBlob = await UploadBlob(fileStream, blobFileName, tableName, subSection);

                #endregion

                #region Handling entry in Attachment table for uploaded file

                //Get current DateTime
                DateTime currentDateTime = DateTime.Now;

                //Map the command to Attachment object
                BlobResponse attachment = new BlobResponse
                {
                    AzureBlobUrl = blockBlob.Uri.AbsoluteUri,
                    CreatedBy = createUserId,
                    CreatedDate = currentDateTime,
                    DocType = fileExtensionWithoutDot,
                    FileName = originalFileName,
                    IsActive = true,
                    ModifiedBy = createUserId,
                    ModifiedDate = currentDateTime,
                    SubSection = subSection,
                    TableKey = tableKey,
                    TableName = tableName,
                };
                #endregion

                return attachment;
            }
            catch (Exception ex)
            {
                throw;
            }
        }

        public async Task<BlobResponse> SingleFileDownload(string tableName, string blobUrl, string? subSection = null)
        {
            try
            {
                var theBlob = await DownloadBlob(tableName, subSection, Path.GetFileName(blobUrl));

                return new BlobResponse
                {
                    Blob = theBlob,
                    FileName = Path.GetFileNameWithoutExtension(blobUrl),
                    ContentType = theBlob.Properties.ContentType
                };
            }
            catch (Exception ex)
            {
                throw;
            }
        }

        private async Task<CloudBlobContainer> InitializeStorage(string? containerName = null)
        {
            try
            {
                //ConfigurationManager _configuration = new ConfigurationManager();

                string blobStorageConnection = "DefaultEndpointsProtocol=https;AccountName=fjewelleryapi;AccountKey=XQXGjbXdPyN8MiTl1wZZuCIMl3jqfwnDs039Ip+J8I111PdANfhCRBvcnOOr56DxR+sHR2oBX/iA+AStNvswOA==;EndpointSuffix=core.windows.net";
                //  _configuration.GetValue<string>(BlobConnectionString);
                string blobcontainer = "fjewellrytest";
                    //_configuration.GetValue<string>(BlobContainerName);


                CloudStorageAccount cloudStorageAccount = CloudStorageAccount.Parse(blobStorageConnection);

                CloudBlobClient blobClient = cloudStorageAccount.CreateCloudBlobClient();

                // Retrieve a reference to a container.
                containerName = string.IsNullOrWhiteSpace(containerName) ? blobcontainer : containerName;
                CloudBlobContainer container = blobClient.GetContainerReference(containerName.ToLower());

                await container.CreateIfNotExistsAsync();

                return container;
            }
            catch (Exception ex)
            {
                throw;
            }
        }

        private async Task<CloudBlockBlob> GetBlobReference(string tableName, string? subSectionName, string fileName)
        {
            //Get reference of the Azure Storage
            CloudBlobContainer theContainer = await InitializeStorage();

            if (!string.IsNullOrWhiteSpace(subSectionName))
            {
                fileName = $"{subSectionName}{Path.DirectorySeparatorChar}{fileName}";
            }

            return theContainer.GetBlockBlobReference($"ELT{Path.DirectorySeparatorChar}{tableName}{Path.DirectorySeparatorChar}{fileName}");
        }

        private async Task<CloudBlockBlob> UploadBlob(Stream fileStream, string fileName, string tableName, string? subSectionName)
        {
            try
            {
                #region Upload Blob
                //Construct Blob reference, e.g. TableName/SubSectionName/FileName
                CloudBlockBlob blockBlob = await GetBlobReference(tableName: tableName, subSectionName: subSectionName, fileName: fileName);

                //Upload the Blob
                await blockBlob.UploadFromStreamAsync(fileStream);

                using Stream stream = new MemoryStream();
                await blockBlob.DownloadToStreamAsync(stream);
                #endregion

                //return Tupple Object containing the uploaded Blob Url and its type
                return blockBlob; // (blockBlob.Uri.AbsoluteUri, blockBlob.Properties.ContentType);
            }
            catch (Exception ex)
            {
                throw;
            }
        }

        private async Task<CloudBlockBlob> DownloadBlob(string tableName, string? subSectionName, string fileName)
        {
            try
            {
                //Construct Blob reference, e.g. TableName/SubSectionName/FileName
                CloudBlockBlob theBlob = await GetBlobReference(tableName: tableName, subSectionName: subSectionName, fileName: fileName);

                using Stream stream = new MemoryStream();
                await theBlob.DownloadToStreamAsync(stream);

                return theBlob;
            }
            catch (Exception ex)
            {
                throw;
            }
        }

        private async Task<bool> DeleteBlob(string tableName, string? subSectionName, string fileName)
        {
            try
            {
                //Construct Blob reference, e.g. TableName/SubSectionName/FileName
                CloudBlockBlob theBlob = await GetBlobReference(tableName: tableName, subSectionName: subSectionName, fileName: fileName);

                return await theBlob.DeleteIfExistsAsync();
            }
            catch (Exception ex)
            {
                throw;
            }
        }
    }

    public class BlobResponse
    {
        public int AttachmentId { get; set; }
        public string DocType { get; set; } = null!;
        public string TableName { get; set; } = null!;
        public string? SubSection { get; set; } = null!;
        public int TableKey { get; set; }
        public string AzureBlobUrl { get; set; } = null!;
        public string FileName { get; set; } = null!;
        public bool? IsActive { get; set; }
        public string? ContentType { get; set; } = null!;
        public CloudBlockBlob? Blob { get; set; }
        public int? CreatedBy { get; set; }
        public DateTime? CreatedDate { get; set; }
        public int? ModifiedBy { get; set; }
        public DateTime? ModifiedDate { get; set; }
    }
}
