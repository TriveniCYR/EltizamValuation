using Microsoft.AspNetCore.Http;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Localization;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Eltizam.Business.Core.Interface;
using Eltizam.Business.Core.ModelMapper;
using Eltizam.Data.DataAccess.Core.Repositories;
using Eltizam.Data.DataAccess.Core.UnitOfWork;
using Eltizam.Data.DataAccess.Entity;
using Eltizam.Resource;
using static Eltizam.Utility.Enums.GeneralEnum;

namespace Eltizam.Business.Core.Implementation
{
	public class UploadService : IUploadService
	{
		#region Properties
		private readonly string _uploadsFolderPath;
		private readonly IUnitOfWork _unitOfWork;
		private readonly IMapperFactory _mapperFactory;
		private readonly IStringLocalizer<Errors> _stringLocalizerError;
		private readonly Microsoft.Extensions.Configuration.IConfiguration configuration;
		private IRepository<Upload> _repository { get; set; }
		private readonly IHelper _helper;
		#endregion Properties

		#region Constructor
		public UploadService(IUnitOfWork unitOfWork, IMapperFactory mapperFactory, IStringLocalizer<Errors> stringLocalizerError,
								  IHelper helper,
								 Microsoft.Extensions.Configuration.IConfiguration _configuration)
		{
			_unitOfWork = unitOfWork;
			_mapperFactory = mapperFactory;

			_repository = _unitOfWork.GetRepository<Upload>();
			configuration = _configuration;
			_helper = helper;
			_uploadsFolderPath = configuration["UploadsFolderPath"];
		}
		#endregion Constructor

		#region API Methods

		/// <summary>
		/// Description - To Login User and return JWT Token String
		/// </summary>
		/// <param name="User"></param>
		/// <returns></returns>
		/// <response code="200">OK</response>
		/// <response code="400">Bad Request</response>
		/// <response code="403">Forbidden</response>
		/// <response code="404">Not Found</response>
		/// <response code="405">Method Not Allowed</response>
		/// <response code="415">Unsupported Media Type</response>
		/// <response code="500">Internal Server</response>
		public async Task<DBOperation> SaveFilesAsync(List<IFormFile> files)
		{
			if (files == null || files.Count == 0)
			{
				throw new ArgumentException("No files were uploaded.");
			}

			var savedFileNames = new List<string>();

			foreach (var file in files)
			{
				if (file == null || file.Length == 0)
				{
					continue;
				}

				// Check if the file type is allowed
				var allowedFileTypes = new List<string> { "image/jpeg", "image/png", "application/msword", "application/pdf" };
				if (!allowedFileTypes.Contains(file.ContentType))
				{
					throw new ArgumentException($"File type '{file.ContentType}' is not allowed.");
				}

				var fileName = Guid.NewGuid().ToString() + Path.GetExtension(file.FileName);
				var filePath = Path.Combine("wwwroot/Uploads", fileName);


				using (var stream = new FileStream(filePath, FileMode.Create))
				{
					await file.CopyToAsync(stream);
				}

				// Save information about the uploaded file to the database
				var upload = new Upload
				{
					FileName = fileName,
					ContentType = file.ContentType,
					CreatedDate = DateTime.Now,
					FileType = GetFileType(file.ContentType)
				};

				_repository.AddAsync(upload);
				await _unitOfWork.SaveChangesAsync();

			}

			return DBOperation.Success;

		}

		public async Task<IEnumerable<Upload>> GetAllUploadsAsync()
		{
			try
			{
				// Query your database to retrieve all uploaded files
				var uploads = _repository.GetAll();
				return uploads;
			}
			catch (Exception ex)
			{
				// Handle exceptions as needed
				// You can log the exception or throw a custom exception
				throw new Exception("An error occurred while fetching uploaded files.", ex);
			}
		}


		private string GetFileType(string contentType)
		{
			switch (contentType)
			{
				case "image/jpeg":
				case "image/png":
					return "Image";
				case "application/msword":
					return "Word";
				case "application/pdf":
					return "PDF";
				default:
					return "Unknown";
			}
		}

		public async Task<DBOperation> GetUploadByIdAsync(int id)
		{
			try
			{
				// Query your database to retrieve the file by its ID
				var upload = await _repository.GetAsync(id);
				if (upload == null)
					return DBOperation.NotFound;
				return DBOperation.Success;
			}
			catch (Exception ex)
			{
				// Handle exceptions as needed
				// You can log the exception or throw a custom exception
				throw new Exception($"An error occurred while fetching the file with ID {id}.", ex);
			}
		}

		#endregion API Methods

	}
}
