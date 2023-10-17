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
    StaticDataTable("#DesignationTable");
}

function ClearDesignationFields() {
    $('#DeleteDesignationModel #ID').val("0");
}

//#region Delete Role
function ConfirmationDesignation(id) {
    
    $('#DeleteDesignationModel #ID').val(id);
}
function DeleteDesignation() {
  
    var tempInAtiveID = $('#DeleteDesignationModel #ID').val();
    ajaxServiceMethod($('#hdnBaseURL').val() + DeleteDesignationByIdUrl + "/" + tempInAtiveID, 'POST', DeleteDesignationByIdSuccess, DeleteDesignationByIdError);
}
function DeleteDesignationByIdSuccess(data) {
    try {
        if (data._Success === true) {
            ClearDesignationFields();
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
function DeleteDesignationByIdError(x, y, z) {
    if (x.get)
        toastr.error(ErrorMessage);
    location.reload(true);
}
//#endregion