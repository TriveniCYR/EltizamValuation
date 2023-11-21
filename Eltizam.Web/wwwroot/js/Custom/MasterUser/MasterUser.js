var tableId = "ResourceUserTable";
$(document).ready(function () { 
    InitializeUserList();
});


function BindDepartment() {
    var Department = $("#DepartmentId");
    var _val = $('#hdnDeparment').val();
    var _rpname = "department";

    BindDropdowns(DepartmentList, Department, _rpname, _val);
}
function BindDesignation() {
    var Designation = $("#DesignationId");
    var _val = $('#hdnDesignation').val();
    var _rpname = "designation";

    BindDropdowns(DesignationList, Designation, _rpname, _val);
}

function BindRole() {

    var Role = $("#RoleId");
    var _val = $('#hdnRole').val();
    var _rpname = "roleName";

    BindDropdowns(RoleList, Role, _rpname, _val);
}

function BindResourceType() {

    var ResourceType = $("#ResourceId");
    var _val = $('#hdnResourceType').val();
    var _rpname = "resourceType";
    BindDropdowns(ResourceTypeList, ResourceType, _rpname, _val);
}


//#region Delete User
function ConfirmationDeleteUser(id) {
    $('#DeleteUserModel #Id').val(id);
}
function DeleteUser() { 
    if (IsDeletePerm) {
        var tempInAtiveID = $('#DeleteUserModel #Id').val();
        ajaxServiceMethod(BaseURL + DeleteUserByIdUrl + "/" + tempInAtiveID, Post, DeleteUserByIdSuccess, DeleteUserByIdError);
    }
    else {
        toastr.error(DeleteAccessDenied);
    } 
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

function InitializeUserList() {  
    var ajaxObject = {
        "url": BaseURL + AllUser,
        "type": Post,
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
                /*html += '<li><a title="Delete" data-toggle="modal" data-target="#DeleteUserModel" data-backdrop="static" data-keyboard="false" onclick="ConfirmationDeleteUser(' + row.id + ');"><img src="../assets/trash.svg" alt="trash" />Delete</a></li>';*/
                html += '</ul></div>';

                return html;
            }
        }
    ];

    IntializingDataTable(tableId, setDefaultOrder, ajaxObject, columnObject);
}  