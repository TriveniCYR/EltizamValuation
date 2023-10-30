$(document).ready(function () {
    GetClientTypeList();
});

// #region Get ClientType List
function GetClientTypeList() {
    ajaxServiceMethod($('#hdnBaseURL').val() + AllClientType, 'GET', GetClientTypeListSuccess, GetClientTypeListError);
}
function GetClientTypeListSuccess(data) {
    try {
        debugger
        destoryStaticDataTable('#ClientTypeTable');
        $('#ClientTypeTable tbody').html('');
        $.each(data._object, function (index, object) { //  <td>' + object.ClientTypeCode + '</td>  <td>' + object.isdClientTypeCode + '</td>  
            $('#ClientTypeTable tbody').append(' <tr><td>' + object.id + '</td><td>' + object.clientType + '</td><td>' + (object.isActive == true ? '<span class="tableStatus green">Active</span>' : '<span class="tableStatus red">Inactive</span>') + '</td><td class="position-relative"> <img src="../assets/dots-vertical.svg" alt="dots-vertical" class="activeDots" /> <div class="actionItem"> <ul> <li onClick="view(' + object.id + ')" ><img src="../assets/view.svg" alt = "view" /> view </li>  <li onclick="GetClientTypeById(' + object.id + ')"><div onclick="edit()"><img src="../assets/edit.svg" alt = "edit" /> Edit </div></li>    <li onclick="deleteClient()" class="delete"><div onclick="ConfirmationDeleteClientType(' + object.id + '); return false;"> <img src="../assets/trash.svg" alt = "trash" /> Delete </div></li>  </ul> </div> </td> </tr>');
        });
        StaticDataTable("#ClientTypeTable");
    } catch (e) {
        debugger
        toastr.error('Error:' + e.message);
    }
}
function GetClientTypeListError(x, y, z) {
    toastr.error(ErrorMessage);
}

// #endregion

// #region Get ClientType By Id
function GetClientTypeById(id) {
    debugger
    ajaxServiceMethod($('#hdnBaseURL').val() + GetClientTypeByIdUrl + "/" + id, 'GET', GetClientTypeByIdSuccess, GetClientTypeByIdError);
}
function GetClientTypeByIdSuccess(data) {
    try {
        debugger
        CleareClientTypeFields();
        $('#popup-editProp-overlay #Id').val(data._object.id);
        $('#popup-editProp-overlay #ClientType').val(data._object.clientType); 
        if (!data._object.isActive) {
            $('#popup-editProp-overlay #IsActive').prop('checked', false);
        }
        else {
            $('#popup-editProp-overlay #IsActive').prop('checked', true);
        }
        $('#popup-editProp-overlay #ClientTypeTitle').html(UpdateLabel);
    }
    catch (e) {
        toastr.error('Error:' + e.message);
    }
}
function GetClientTypeByIdError(x, y, z) {
    toastr.error(ErrorMessage);
}
// #endregion

// #region Insert/Update ClientType
function AddClientType() {
    CleareClientTypeFields();
    $('#popup-addRole-overlay #ClientTypeTitle').html(AddLabel);
}
function SaveClientTypeForm(form) {
    debugger
    $.validator.unobtrusive.parse(form);
    if ($(form).valid()) {
        ajaxServiceMethod($('#hdnBaseURL').val() + SaveClientType, 'POST', SaveClientTypeFormSuccess, SaveClientTypeFormError, JSON.stringify(getFormData($(form))));
    }
    return false;
}
function SaveClientTypeFormSuccess(data) {
    try {
        $('#popup-addRole-overlay').modal('hide');
        if (data._Success === true) {
            CleareClientTypeFields();
            toastr.success(RecordInsertUpdate);
            GetClientTypeList();
            $('#popup-addRole-overlay #closePopup').trigger('click');
            $('#popup-editProp-overlay #closePopup').trigger('click');
        }
        else {
            toastr.error(data._Message);
        }
    } catch (e) {
        toastr.error('Error:' + e.message);
    }
}
function SaveClientTypeFormError(x, y, z) {
    ErrorMessage = x.responseJSON._Message;
    toastr.error(ErrorMessage);
}
function CleareClientTypeFields() {    
    $('#popup-addRole-overlay #IsActive').prop('checked', true);
    $('#popup-addRole-overlay #Id').val("0");
    $('#popup-addRole-overlay #ClientType').val("");
    $('#popup-editProp-overlay #IsActive').prop('checked', true);
    $('#popup-editProp-overlay #Id').val("0");
    $('#popup-editProp-overlay #ClientType').val("");
    var validationMessages = document.querySelectorAll(".field-validation-error");

    // Loop through the messages and clear them
    for (var i = 0; i < validationMessages.length; i++) {
        validationMessages[i].textContent = "";
    }
}
// #endregion

//#region Delete ClientType
function ConfirmationDeleteClientType(id) {
    debugger
    $('#popup-delete-overlay #ClientTypeID').val(id);
}
function DeleteClientType() {
    debugger
    var tempInAtiveID = $('#popup-delete-overlay #ClientTypeID').val();
    ajaxServiceMethod($('#hdnBaseURL').val() + DeleteClientTypeByIdUrl + "/" + tempInAtiveID, 'POST', DeleteClientTypeByIdSuccess, DeleteClientTypeByIdError);
}
function DeleteClientTypeByIdSuccess(data) {
    try {
        if (data._Success === true) {
            CleareClientTypeFields();
            toastr.success(RecordDelete);
            GetClientTypeList();
        }
        else {
            toastr.error(data._Message);
        }
    } catch (e) {
        toastr.error('Error:' + e.message);
    }
}
function DeleteClientTypeByIdError(x, y, z) {
    toastr.error(ErrorMessage);
}

const deletePopup = document.getElementById("popup-delete-overlay");

function deleteClient() {
    deletePopup.classList.add("display-block");
}

