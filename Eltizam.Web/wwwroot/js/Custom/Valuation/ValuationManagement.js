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
    StaticDataTable("#ValuationTable");
}

function CleareValuationFields() {
    $('#DeleteValuationModel #ID').val("0");
}

//#region Delete Role
function ConfirmationValuation(id) {
    $('#DeleteValuationModel #ID').val(id);

}
function DeleteValuation() {
    var tempInAtiveID = $('#DeleteValuationModel #ID').val();
    ajaxServiceMethod($('#hdnBaseURL').val() + DeleteDepartmenteByIdUrl + "/" + tempInAtiveID, 'POST', DeleteDepartmentByIdSuccess, DeleteDepartmentByIdError);
}

function DeleteValuationByIdSuccess(data) {
       try {
        if (data._Success === true) {
            CleareValuationFields();
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
function DeleteValuationByIdError(x, y, z) {
    if (x.get)
        toastr.error(ErrorMessage);
    location.reload(true);
}
//#endregion