var tableId = "ResourceUserTable";
$(document).ready(function () {
    InitializeUserList();
});


//#region Delete User
function ConfirmationDeleteUser(id) {
    $('#DeleteUserModel #Id').val(id);
}
function DeleteUser() {
    var tempInAtiveID = $('#DeleteUserModel #Id').val();
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

function InitializeUserList () { 
    debugger
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
            "data": "userName", "name": "User Name"
        },
        {
            "data": "department", "name": "Department"
        },
        {
            "data": "designation", "name": "Designation"
        },
        {
            "data": "resourceType", "name": "ResourceType"
        },
        {
            "data": "isActive", "name": "Active", "render": function (data, type, row, meta) {
                if (row.isActive) {
                    return "<span class='tableStatus green'>Active</span>";
                } else {
                    return "<span class='tableStatus red'>Inactive</span>";
                }
            }
        },
        {
            "data": "id", "name": "Action", "render": function (data, type, row, meta) {
                var html = '';
                html += '<a title="Edit" class="large-font"  href="/Resource/ResourceManage?id=' + row.id + '"><img src="../assets/edit.svg" alt = "edit" />';
                html += '<a title="Delete" class="large-font text-danger" data-toggle="modal" data-target="#DeleteUserModel" data-backdrop="static" data-keyboard="false" onclick="ConfirmationDeleteUser(' + row.id + ');"><i class="fa fa-fw fa-trash mr-1"></i></a>';

                return html;
            }
        }
    ];

    IntializingDataTable(tableId, setDefaultOrder, ajaxObject, columnObject);
}


//#endregion