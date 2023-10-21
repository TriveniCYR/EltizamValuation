var tableId = "ResourceUserTable";
$(document).ready(function () {
    InitializeUserList();
});

function InitializeUserList() {
    var setDefaultOrder = [0, 'asc'];
    var ajaxObject = {
        "url": $('#hdnBaseURL').val() + AllUser,
        "type": "POST",
        "data": function (d) {
            var pageNumber = $('#' + tableId).DataTable().page.info();
            d.PageNumber = pageNumber.page;
        },
        "datatype": "json"
    };
    var columnObject = [
        {
            "data": "id", "name": "Id"
        },
        {
            "data": "userName", "name": "User Name"
        },
        {
            "data": "department", "name": "Department"
        },
        {
            "data": "designation", "name": "Designation"
        },
        {
            "data": "resourceType", "name": "Resource Type"
        },
        {
            "data": "roleName", "name": "Role"
        },
        {
            "data": "phone", "name": "Phone"
        },
        {
            "data": "email", "name": "Email"
        },
        {
            "data": "isActive", "name": "Active", "render": function (data, type, row, meta) {
                return GetActiveFlagCss(data);
            }
        },
        {
            "data": "action", className: 'notexport actionColumn', "name": "Action", "render": function (data, type, row, meta) {
                var html = '';
                html += '<img src="../assets/dots-vertical.svg" alt="dots-vertical" class="activeDots" /> <div class="actionItem"><ul>'
                html += '<li><a title="View" href="/MasterUser/UserDetail?id=' + row.id + '"><img src="../assets/view.svg" alt="view" />View</a></li>';
                html += '<li><a title="Edit" href="/MasterUser/UserManage?id=' + row.id + '"><img src="../assets/edit.svg" alt="edit" />Edit</a></li>';
                html += '<li><a title="Delete" data-toggle="modal" data-target="#DeleteUserModel" data-backdrop="static" data-keyboard="false" onclick="ConfirmationDeleteUser(' + row.id + ');"><img src="../assets/trash.svg" alt="trash" />Delete</a></li>';
                html += '</ul></div>';

                return html;
            }
        }
    ];

    IntializingDataTable(tableId, setDefaultOrder, ajaxObject, columnObject);
}  



//#region Delete User
function ConfirmationDeleteUser(id) {
    $('#DeleteUserModel #Id').val(id);
}
function DeleteUser() {
    var tId = $('#DeleteUserModel #Id').val();
    ajaxServiceMethod(BaseURL + DeleteUserByIdUrl + "/" + tId, Delete, DeleteUserByIdSuccess, DeleteUserByIdError);
}
function DeleteUserByIdSuccess(data) {
    try {
        if (data._Success === true) {
            toastr.success(RecordDelete);
            $('#' + tableId).DataTable().draw();
        }
        else {
            toastr.error(data._Message);
        }
    } catch (e) {
        toastr.error('Error:' + e.message);
    }
}
function DeleteUserByIdError(x, y, z) {
    toastr.error(ErrorMessage);
}
