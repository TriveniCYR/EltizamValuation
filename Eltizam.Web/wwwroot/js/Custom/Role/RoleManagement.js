$(document).ready(function () {
    //SetupRoleTable();

    if (StatusMessage != '') {
        if (StatusMessage.includes('uccessful')) {
            toastr.success(StatusMessage);
        }
        else {
            toastr.error(StatusMessage);
        }
    }
});

function SetupRoleTable() {
    StaticDataTable("#RoleTable");
}

function CleareRoleFields() {
    $('#DeleteRoleModel #Id').val("0");
}

//#region Delete Role
function ConfirmationRole(id) {  
    $('#DeleteRoleModel #Id').val(id);
    alert(id);
}
function DeleteRole() {  
    var tempInAtiveID = $('#DeleteRoleModel #Id').val();
    ajaxServiceMethod($('#hdnBaseURL').val() + DeleteRoleByIdUrl + "/" + tempInAtiveID, 'POST', DeleteRoleByIdSuccess, DeleteRoleByIdError);
}

function DeleteRoleByIdSuccess(data) {
    try {
        if (data._Success === true) {
            if (data._Message == "UserAssigned") {
                toastr.error("Can not Delete Role, User assigned to this Role");
            }
            else {
            CleareRoleFields();
                toastr.success(RecordDelete);
                location.reload(true);
            }
        }
        else {
            toastr.error(data._Message);
        }
    } catch (e) {
        toastr.error('Error:' + e.message);
    }
}

function DeleteRoleByIdError(x, y, z) {
    if (x.get)
    toastr.error(ErrorMessage);
    location.reload(true);
}

 
//#endregion

var tableId = "RoleTable";
$(document).ready(function () {
    InitializeRoleDataList();
});


//#region Delete User
function ConfirmationDeleteRole(id) {
    $('#DeleteRoleModel #Id').val(id);
}
function DeleteRole() {
    var tempInAtiveID = $('#DeleteRoleModel #Id').val();
    ajaxServiceMethod($('#hdnBaseURL').val() + DeleteValuationByIdUrl + "/" + tempInAtiveID, 'DELETE', DeleteUserByIdSuccess, DeleteUserByIdError);
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

function InitializeRoleDataList() { 
    var setDefaultOrder = [0, 'asc'];
    var ajaxObject = {
        "url": BaseURL + RoleGetAll,
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
            "data": "roleName", "name": "Role"
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
                html += '<li><a title="View" href="/MasterRole/RoleManage?id=' + row.id + '"><img src="../assets/view.svg" alt="view" />View</a></li>';
                html += '<li><a title="Edit" href="/MasterRole/RoleManage?id=' + row.id + '"><img src="../assets/edit.svg" alt="edit" />Edit</a></li>';
                html += '<li><a title="Delete" data-toggle="modal" data-target="#DeleteRoleModel" data-backdrop="static" data-keyboard="false" onclick="ConfirmationDeleteRole(' + row.id + ');"><img src="../assets/trash.svg" alt="trash" />Delete</a></li>';
                html += '</ul></div>';

                return html;
            }
        }
    ];

    IntializingDataTable(tableId, setDefaultOrder, ajaxObject, columnObject);
}