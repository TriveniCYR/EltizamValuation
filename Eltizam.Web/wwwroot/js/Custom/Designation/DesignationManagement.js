﻿$(document).ready(function () {
    SetupRoleTable();

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
    StaticDataTable("#DesignationTable");
}

function CleareRoleFields() {
    $('#DeleteDesignationModel #ID').val("0");
}

//#region Delete Role
function ConfirmationRole(id) {
   
    $('#DeleteDesignationModel #ID').val(id);
}
function DeleteRole() {
   
    var tempInAtiveID = $('#DeleteRoleModel #ID').val();
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