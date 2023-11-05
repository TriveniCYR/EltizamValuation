using Eltizam.Api.Filters;
using Eltizam.Api.Helpers.Response;
using Eltizam.Api.Middlewares;
using Eltizam.Business.Core;
using Eltizam.Business.Core.Interface;
using Eltizam.Business.Models;
using Eltizam.Data.DataAccess.Helper;
using Eltizam.Resource;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Localization;
using System.Net;
using static Eltizam.Utility.Enums.GeneralEnum; 

namespace Eltizam.Api.Controllers
{
    [Route("api/[controller]")]
	[ApiController]
    [Filters.AuthorizeAttribute]
    public class AccountController : ControllerBase
	{
		#region Properties

		private readonly IConfiguration _configuration;
		private readonly IResponseHandler<dynamic> _ObjectResponse;
		private readonly IMasterUserService _MasterUserService;
		private readonly IStringLocalizer<Errors> _stringLocalizerError;
		private readonly IExceptionService _ExceptionService;
        private readonly IHelper _helper;
        #endregion Properties

        #region Constructor

        public AccountController(IConfiguration configuration, IResponseHandler<dynamic> ObjectResponse, IMasterUserService MasterUserService, IStringLocalizer<Errors> stringLocalizerError, IExceptionService exceptionService, IHelper helper)
		{
			_configuration = configuration;
			_ObjectResponse = ObjectResponse;
			_MasterUserService = MasterUserService;
			_stringLocalizerError = stringLocalizerError;
			_ExceptionService = exceptionService;
            _helper = helper;
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

		[AllowAnonymous]
		[HttpPost, Route("login")]
		public async Task<IActionResult> Login([FromBody] LoginViewModel oLogin)
		{
			try
			{
				var _User = await _MasterUserService.Login(oLogin);

				if (_User != null)
				{
					int expMinutes = Convert.ToInt32(_configuration["jwt:expiryMinutes"]);

					var userEntity = JwtAuthenticationServiceConfig.ValidateToken(_User, _configuration["jwt:audience"].ToString(),
						_configuration["jwt:issuer"].ToString(), Guid.NewGuid(), AppConstants.DateTime.AddMinutes(expMinutes), _configuration["jwt:secretKey"]);

					return _ObjectResponse.Create(userEntity, (Int32)HttpStatusCode.OK);
				}
				else
					return _ObjectResponse.Create(string.Empty, (Int32)HttpStatusCode.Unauthorized, _stringLocalizerError["LoinFailed"]);
			}
			catch (Exception ex)
			{
				await _ExceptionService.LogException(ex);
				return _ObjectResponse.Create(false, (Int32)HttpStatusCode.InternalServerError, Convert.ToString(ex.StackTrace));
			}
		}

        [AllowAnonymous]
        [HttpPost, Route("ForgotPassword")]
        public async Task<IActionResult> ForgotPassword([FromBody] ForgotPasswordViewModel forgotPasswordViewModel)
        {
            try
            {
                var _forgotPasswordOperation = await _MasterUserService.ForgotPassword(forgotPasswordViewModel);

                if (_forgotPasswordOperation == DBOperation.Success)
                    return _ObjectResponse.Create(_forgotPasswordOperation, (Int32)HttpStatusCode.OK);
                else if (_forgotPasswordOperation == DBOperation.NotFound)
                {
                    return _ObjectResponse.Create(null, (Int32)HttpStatusCode.BadRequest, AppConstants.NoRecordFound);
                }
                return _ObjectResponse.Create(null, (Int32)HttpStatusCode.InternalServerError, "Internal Server Error");
            }
            catch (Exception ex)
            {
                await _ExceptionService.LogException(ex);
                return _ObjectResponse.Create(false, (Int32)HttpStatusCode.InternalServerError, Convert.ToString(ex.StackTrace));
            }
        }

        [AllowAnonymous]
        [HttpPost, Route("ResetPassword")]
        public async Task<IActionResult> ResetPassword([FromBody] MasterUserResetPasswordEntity ResetPasswordViewModel)
        {
            try
            {
                var resetOperation = await _MasterUserService.ResetPassword(ResetPasswordViewModel);
                if (resetOperation == "ResetSuccessfully")
                    return _ObjectResponse.Create(resetOperation, (Int32)HttpStatusCode.OK);
                else if (resetOperation == "TokenExpired")
                {
                    return _ObjectResponse.Create(resetOperation, (Int32)HttpStatusCode.NotExtended, "TokenExpired");
                }
                else
                    return _ObjectResponse.Create(null, (Int32)HttpStatusCode.BadRequest, AppConstants.NoRecordFound);
            }
            catch (Exception ex)
            {
                await _ExceptionService.LogException(ex);
                return _ObjectResponse.Create(false, (Int32)HttpStatusCode.InternalServerError, Convert.ToString(ex.StackTrace));
            }
        }

        [AllowAnonymous]
        [HttpGet, Route("CheckEmailAddressExists/{emailAddress}")]
        public async Task<bool> CheckEmailAddressExists([FromRoute] string emailAddress)
        {
            try
            {
                return await _MasterUserService.CheckEmailAddressExists(emailAddress);
            }
            catch (Exception ex)
            {
                await _ExceptionService.LogException(ex);
                return false;
            }
        }

        [AllowAnonymous]
        [HttpGet, Route("IsTokenValid/{token}")]
        public async Task<bool> IsTokenValid([FromRoute] string token)
        {
            try
            {
                return await _MasterUserService.IsTokenValid(token);
            }
            catch (Exception ex)
            {
                await _ExceptionService.LogException(ex);
                return false;
            }
        }      
        
        /*
        [AllowAnonymous]
        [HttpPost, Route("ChangePassword")]
        public async Task<IActionResult> ChangePassword([FromBody] ChangePasswordModel changePasswordModel)
        {
            var response = new ApiResponse();

            if (!ModelState.IsValid)
            {
                response.Success = false;
                response.Errors = ModelState.Values
                    .SelectMany(x => x.Errors)
                    .Select(x => x.ErrorMessage)
                    .ToList();
                return Ok(response); // Return validation errors
            }

            try
            {
                var changeOperation = await _MasterUserService.ChangePassword(changePasswordModel);
                if (changeOperation == DBOperation.Success)
                {
                    response.Success = true;
                    return Ok(response);
                }
                else if (changeOperation == DBOperation.NotFound)
                {
                    response.Success = false;
                    response.Errors = new List<string> { AppConstants.NoRecordFound };
                    return BadRequest(response);
                }

                response.Success = false;
                response.Errors = new List<string> { "Internal Server Error" };
                return StatusCode(500, response);
            }
            catch (Exception ex)
            {
                await _ExceptionService.LogException(ex);
                response.Success = false;
                response.Errors = new List<string> { ex.StackTrace };
                return StatusCode(500, response);
            }
            //try
            //{              
            //    var changeOperation = await _MasterUserService.ChangePassword(changePasswordModel);
            //    if (changeOperation == DBOperation.Success)
            //        return _ObjectResponse.Create(changeOperation, (Int32)HttpStatusCode.OK);
            //    else if (changeOperation == DBOperation.NotFound)
            //    {
            //        return _ObjectResponse.Create(null, (Int32)HttpStatusCode.BadRequest, AppConstants.NoRecordFound);
            //    }
            //    return _ObjectResponse.Create(null, (Int32)HttpStatusCode.InternalServerError, "Internal Server Error");
            //}
            //catch (Exception ex)
            //{
            //    await _ExceptionService.LogException(ex);
            //    return _ObjectResponse.Create(false, (Int32)HttpStatusCode.InternalServerError, Convert.ToString(ex.StackTrace));
            //}
        }
        */
        #endregion API Methods

    }
}
