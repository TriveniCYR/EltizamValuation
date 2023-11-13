using Eltizam.Business.Core.Interface;
using Eltizam.Data.DataAccess.Helper;
using Eltizam.WebApi.Filters;
using Eltizam.WebApi.Helpers.Response;
using Microsoft.AspNetCore.Mvc;
using System.Net;
using static Eltizam.Utility.Enums.GeneralEnum;

namespace Eltizam.WebApi.Controllers
{
    [Route("api/[controller]")]
	[ApiController]
    [AuthorizeAttribute]
    public class FileUploadController : ControllerBase
	{
		#region Properties

		private readonly IUploadService _UploadService;
		private readonly IResponseHandler<dynamic> _ObjectResponse;
		private readonly IExceptionService _ExceptionService;
		#endregion Properties

		#region Constructor
		public FileUploadController(IUploadService UploadService, IResponseHandler<dynamic> ObjectResponse, IExceptionService exceptionService)
		{
			_UploadService = UploadService;
			_ObjectResponse = ObjectResponse;
			_ExceptionService = exceptionService;
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

		[HttpPost("upload")]
		public async Task<IActionResult> Upload(List<IFormFile> files)
		{
			try
			{
				DBOperation oResponse = await _UploadService.SaveFilesAsync(files);
				if (oResponse == DBOperation.Success)
				{
					return _ObjectResponse.Create(true, (Int32)HttpStatusCode.OK, (AppConstants.InsertSuccess));
				}
				else
					return _ObjectResponse.Create(false, (Int32)HttpStatusCode.BadRequest, (oResponse == DBOperation.NotFound ? "File Not Uploded" : AppConstants.BadRequest));
			}
			catch (ArgumentException ex)
			{
				return BadRequest(ex.Message);
			}
			catch (Exception ex)
			{
				await _ExceptionService.LogException(ex);
				return _ObjectResponse.Create(false, (Int32)HttpStatusCode.InternalServerError, Convert.ToString(ex.StackTrace));
			}
		}

		[HttpGet("getAllFiles")]
		public async Task<IActionResult> GetAllFiles()
		{
			try
			{
				// Query your database to retrieve all uploaded files
				var uploads = await _UploadService.GetAllUploadsAsync();
				return Ok(uploads);
			}
			catch (Exception ex)
			{
				// Handle exceptions as needed
				// You can log the exception or throw a custom exception
				return StatusCode(500, $"Internal server error: {ex.Message}");
			}
		}

		[HttpGet("{id}")]
		public async Task<IActionResult> GetFileById(int id)
		{
			try
			{
				// Query your database to retrieve the file by its ID
				DBOperation oResponse = await _UploadService.GetUploadByIdAsync(id);
				if (oResponse == DBOperation.Success)
					return _ObjectResponse.Create(true, (Int32)HttpStatusCode.OK, "Get Successfully");
				else
					return _ObjectResponse.Create(null, (Int32)HttpStatusCode.BadRequest, AppConstants.NoRecordFound);
			}
			catch (Exception ex)
			{
				// Handle exceptions as needed
				// You can log the exception or throw a custom exception
				await _ExceptionService.LogException(ex);
				return _ObjectResponse.Create(false, (Int32)HttpStatusCode.InternalServerError, Convert.ToString(ex.StackTrace));

			}
		}

		#endregion API Methods

	}
}


