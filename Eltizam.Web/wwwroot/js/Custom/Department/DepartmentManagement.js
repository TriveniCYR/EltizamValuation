$(document).ready(function () {
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
    StaticDataTable("#DepartmentTable");
}

function CleareDepartmentFields() {
    $('#DeleteDepartmentModel #ID').val("0");
}

//#region Delete Role
function ConfirmationDepartment(id) {
    $('#DeleteDepartmentModel #ID').val(id);

}
function DeleteDepartment() {
    var tempInAtiveID = $('#DeleteDepartmentModel #ID').val();
    ajaxServiceMethod($('#hdnBaseURL').val() + DeleteDepartmenteByIdUrl + "/" + tempInAtiveID, 'POST', DeleteDepartmentByIdSuccess, DeleteDepartmentByIdError);
}

function DeleteDepartmentByIdSuccess(data) {
       try {
        if (data._Success === true) {
            CleareDepartmentFields();
            toastr.success(RecordDelete);
            location.reload(true);
        }
        else {
            toastr.error(data._Message);
        }
    } catch (e) {
        toastr.error('Error:' + e.message);
    }
}
function DeleteDepartmentByIdError(x, y, z) {
    if (x.get)
        toastr.error(ErrorMessage);
    location.reload(true);
}
//#endregion