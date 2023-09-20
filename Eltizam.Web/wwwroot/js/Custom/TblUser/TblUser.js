var tableId = "TblUserTable";
$(document).ready(function () {
    InitializeTblUserList();
});

//#region Delete User
function ConfirmationDeleteUser(id) {
    $('#DeleteUserModel #ID').val(id);
}
function DeleteUser() {
    var tempInAtiveID = $('#DeleteUserModel #UserID').val();
    ajaxServiceMethod($('#hdnBaseURL').val() + DeleteUserByIdUrl + "/" + tempInAtiveID, 'POST', DeleteUserByIdSuccess, DeleteUserByIdError);
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

function InitializeTblUserList() {
    var setDefaultOrder = [0, 'asc'];
    debugger
    var ajaxObject = {
        "url": $('#hdnBaseURL').val() + AllTblUser,
        "type": "POST",
        "data": function (d) {
            var pageNumber = $('#' + tableId).DataTable().page.info();
            d.PageNumber = pageNumber.page;
        },
        "datatype": "json"
    };

    var columnObject = [
        {
            "data": "name", "name": "Name"
        },
        {
            "data": "email", "name": "Email"
        },
        {
            "data": "mobile", "name": "Mobile"
        },
        {
            "data": "createdOn", "name": "createdOn", "render": function (data, type, row, meta) {
                if (data != 0) {
                    return "<span>" + CustomDateFormat(row.createdOn, 2) + "</span>";
                } else {
                    return "";
                }
            }
        },
        {
            "data": "isActive", "name": "Active", "render": function (data, type, row, meta) {
                if (data) {
                    return "<span class='text-success text-bold'>Yes</span>";
                } else {
                    return "<span class='text-danger text-bold'>No</span>";
                }
            }
        },
        {
            "data": "id", "name": "Action", "render": function (data, type, row, meta) {
                var html = '';

                html += '<a title="Edit" class="large-font"  href="/User/TblUserManage?Id=' + row.id + '"><i class="fa fa-fw fa-edit mr-1"></i></a>';
                html += '<a title="Delete" class="large-font text-danger"  data-toggle="modal" data-target="#DeleteUserModel" data-backdrop="static" data-keyboard="false" onclick="ConfirmationDeleteUser(' + row.id + '); return false;"><i class="fa fa-fw fa-trash mr-1"></i></a>';

                return html;
            }
        }
    ];

    IntializingDataTable(tableId, setDefaultOrder, ajaxObject, columnObject, {
        left: 1,
        right: 1
    });
}

//#endregion