using Eltizam.WebApi.Filters;
using MediatR;
using Microsoft.AspNetCore.Mvc;
using ValuationWeb.Application.Features.Users.Commands.CreateUser;
using ValuationWeb.Application.Features.Users.Commands.DeleteUserById;
using ValuationWeb.Application.Features.Users.Commands.UpdateUser;
using ValuationWeb.Application.Features.Users.Queries.GetEncryptDecryptPassword;
using ValuationWeb.Application.Features.Users.Queries.GetUserDetail;
using ValuationWeb.Application.Features.Users.Queries.GetUserListWithPagination;

namespace Eltizam.WebApi.Controllers
{
    [ApiController]
    [AuthorizeAttribute]
    [ApiVersion("1")]
    [Route("api/v{version:apiVersion}/[controller]")]
    public class UserController : ControllerBase
    {
        private readonly IMediator _mediator;

        public UserController(IMediator mediator)
        {
            _mediator = mediator;
        } 
         
        /// <summary>
        /// Modified by YReddy on 08/15/2022
        /// Modified for pulling Users list from DB with pagination
        /// </summary>
        /// <param name="PageNumber"></param>
        /// <param name="PageSize"></param>
        /// <param name="OrderClause"></param>
        /// <param name="ReverseSort"></param>
        /// <param name="RoleId"></param>
        /// <param name="BranchId"></param>
        /// <param name="IsActive"></param>
        /// <param name="Letter"></param>
        /// <returns></returns>
        [HttpGet("GetUsersList")]
        [ProducesResponseType(StatusCodes.Status200OK)]
        public async Task<ActionResult> GetUsersList(int? PageNumber, int? PageSize, string? OrderClause, int? ReverseSort, int? RoleId, byte? BranchId, bool? IsActive, string? Letter)
        {
            var searchObj = new UserSearchFilters()
            { PageNumber = PageNumber, PageSize = PageSize, OrderClause = OrderClause, ReverseSort = ReverseSort, RoleId = RoleId, BranchId = BranchId, IsActive = IsActive, Letter = Letter };

            var dtos = await _mediator.Send(searchObj);
            return Ok(dtos); 
        }

        /// <summary>
        /// Modified by YReddy on 08/15/2022
        /// Modified for pulling user details by ID
        /// </summary>
        /// <param name="ID"></param>
        /// <returns></returns>
        [HttpGet("GetUserDetails")]
        [ProducesResponseType(StatusCodes.Status200OK)]
        public async Task<ActionResult> GetUserDetails(int? id, string? email, string? lastName, bool? status)
        {
            var getUserNameDetailQuery = new GetUserDetailQuery() { Id = id, Email = email, LastName = lastName, status = status };
            return Ok(await _mediator.Send(getUserNameDetailQuery));
        }

        /// <summary>
        /// Added by YReddy on 08/15/2022 
        /// Used to generate Dectypt password from encrypt password value
        /// </summary>
        /// <param name="Id"></param>
        /// <returns></returns>
        [HttpGet("DecryptPassword")]
        [ProducesResponseType(StatusCodes.Status200OK)]
        public async Task<ActionResult> DecryptPassword(string decryptValue)
        {
            var getDecryptVal = new GetDecryptedTextFromPasswordQuery() { DectyptValue = decryptValue };
            return Ok(await _mediator.Send(getDecryptVal));
        }

        /// <summary>
        /// Added by YReddy on 08/15/2022 
        /// Used to generate encrypt password from plain value
        /// </summary>
        /// <param name="Id"></param>
        /// <returns></returns>
        [HttpGet("EncryptPassword")]
        [ProducesResponseType(StatusCodes.Status200OK)]
        public async Task<ActionResult> EncryptPassword(string inputValue)
        {
            var getEncryptVal = new GetEncryptPasswordQuery() { InputValue = inputValue };
            return Ok(await _mediator.Send(getEncryptVal));
        }

        /// <summary>
        /// Added by Sharanaiyya Swami  on 17/08/2022
        /// Create user in user table
        /// </summary>
        /// <param name="creatUserCommand"></param>
        /// <returns></returns>
        [HttpPost("CreateUser")]
        [ProducesResponseType(StatusCodes.Status200OK)]
        public async Task<ActionResult> CreateUser([FromBody] CreateUserCommand creatUserCommand)
        {
            var response = await _mediator.Send(creatUserCommand);
            return Ok(response);
        }

        /// <summary>
        /// Added by Sharanaiyya Swami  on 17/08/2022
        /// Update user by User ID
        /// </summary>
        /// <param name="updateUserNameCommand"></param>
        /// <returns></returns>
        [HttpPut("ManageUser")]
        [ProducesResponseType(StatusCodes.Status200OK)]
        public async Task<ActionResult> UpdateUser([FromBody] UpdateUserCommand updateUserNameCommand)
        {
            var response = await _mediator.Send(updateUserNameCommand);
            return Ok(response);
        }


        /// <summary>
        /// Added by YReddy on 08/15/2022 
        /// Used deactivate user by User ID
        /// </summary>
        /// <param name="Id"></param>
        /// <returns></returns>
        [HttpPut("ToggleUserStatus")]
        [ProducesResponseType(StatusCodes.Status200OK)]
        public async Task<ActionResult> ToggleUserStatus(int Id, bool IsActive)
        {
            var deleteUserByIdCommand = new DeleteUserByIdCommand() { Id = Id, IsActive = IsActive };
            return Ok(await _mediator.Send(deleteUserByIdCommand));
        }
    }
}