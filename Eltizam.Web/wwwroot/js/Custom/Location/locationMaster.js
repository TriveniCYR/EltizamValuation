
// edit role js function for delete user popup
document.addEventListener("DOMContentLoaded", () => {
    const editRoleBtn = document.querySelectorAll(".editLocation");
    const editRolePopup = document.getElementById("popup-editRole-overlay");
    const closeEditRole = document.querySelector(".closeEditRolePopup");
    
    editRoleBtn.forEach((li) => {
        li.addEventListener("click", () => editRolePopup.classList.add("display-block"));
        closeEditRole.addEventListener("click", () => editRolePopup.classList.remove("display-block"));
    });
    
});

// viewLocation js function for delete user popup
document.addEventListener("DOMContentLoaded", () => {
    const viewLocationBtn = document.querySelectorAll(".viewLocation");
    const viewLocationPopup = document.getElementById("popup-viewLocation-overlay");
    const closeViewLocation = document.querySelector(".closeViewLocationPopup");
    
    viewLocationBtn.forEach((li) => {
        li.addEventListener("click", () => viewLocationPopup.classList.add("display-block"));
        closeViewLocation.addEventListener("click", () => viewLocationPopup.classList.remove("display-block"));
    });
    
});

// delete js function for delete user popup
document.addEventListener("DOMContentLoaded", () => {
    const deleteUser = document.querySelectorAll(".delete");
    const deletePopup = document.getElementById("popup-delete-overlay");
    const cancelDeletLocation = document.getElementById("cancelDeletLocation");

    deleteUser.forEach((li) => {
        li.addEventListener("click", () => deletePopup.classList.add("display-block"));
        cancelDeletLocation.addEventListener("click", () => deletePopup.classList.remove("display-block"));
    });
});
// ends

document.addEventListener("DOMContentLoaded", () => {
    const btn = document.querySelector('.btn');
    const fileInput = document.querySelector('.file');
    const fileNameInput = document.querySelector('#file-name');

    btn.addEventListener('click', () => fileInput.click());

    fileInput.addEventListener('change', function() {
        const { files } = this;
        if (files.length > 0) {
            fileNameInput.value = files[0].name;
        }
    });
});
// ends


// import js function to upload file
document.addEventListener("DOMContentLoaded", () => {
    const importFile = document.getElementById("importFile");
    const importPopup = document.getElementById("popup-import-overlay");
    const closePopup = document.getElementById("closePopup");

    importFile.addEventListener("click", () => importPopup.classList.add("display-block"));
    closePopup.addEventListener("click", () => importPopup.classList.remove("display-block"));
});

// add location js function to upload file
document.addEventListener("DOMContentLoaded", () => {
    const addRole = document.getElementById("addRole");
    const addRolePopup = document.getElementById("popup-addRole-overlay");
    const closePopup = document.querySelector(".addRoleClose");

    addRole.addEventListener("click", () => addRolePopup.classList.add("display-block"));
    closePopup.addEventListener("click", () => addRolePopup.classList.remove("display-block"));
});


document.getElementById('resetLocation').addEventListener('click', function(){
    document.getElementById('locationForm').reset();
}); 

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
    StaticDataTable("#LocationTable");
}

// #region Get ClientType By Id
function GetLocationById(id) { 
    BindCountry();
    BindState();
    BindCity();
    ajaxServiceMethod(BaseURL + GetLocationByIdUrl + "/" + id, 'GET', GetLocationByIdSuccess);
}
function GetLocationByIdSuccess(data) { 
    try { 
        //CleareClientTypeFields();
        $('#popup-editRole-overlay #Id').val(data._object.id);
        $('#popup-editRole-overlay #CountryId').val(data._object.countryId);
        $('#popup-editRole-overlay #StateId').val(data._object.stateId);
        $('#popup-editRole-overlay #CityId').val(data._object.cityId);
        $('#popup-editRole-overlay #Sector').val(data._object.sector);
        $('#popup-editRole-overlay #Latitude').val(data._object.latitude);
        $('#popup-editRole-overlay #Longitude').val(data._object.longitude);
        $('#popup-editRole-overlay #HomeCurrencyId').val(data._object.homeCurrencyId);
        $('#popup-editRole-overlay #ForeignCurrencyId').val(data._object.foreignCurrencyId); 
    }
    catch (e) {
        toastr.error('Error:' + e.message);
    }
}
function GetLocationByIdError(x, y, z) {
    toastr.error(ErrorMessage);
}
// #endregion

function BindCountry() {
    //var CountryList = "@Eltizam.Web.Helpers.APIURLHelper.GetCountryList";
    var Country = $("#CountryId") + CountryList;
    $.ajax({
        type: "GET",
        url: BaseURL + CountryList,
        "datatype": "json",
        success: function (response) { 
            Country.empty().append('<option selected="selected" value="0">Please select</option>');
            for (var i = 0; i < response.length; i++) {
                Country.append($("<option></option>").val(response[i].id).html(response[i].countryName));
            }
            if ($('#hdnCountry').val() != 0) {
                Country.val($('#hdnCountry').val());
            }
        },
        failure: function (response) {
            alert(response.responseText);
        },
        error: function (response) {
            alert(response.responseText);
            $("#loader").hide();
        }
    });
}

function BindState() { 
    //var StateList = "@Eltizam.Web.Helpers.APIURLHelper.GetStateList";
    var State = $("#StateId") + StateList;
    $.ajax({
        type: "GET",
        url: BaseURL + StateList,
        "datatype": "json",
        success: function (response) {
            ;
            State.empty().append('<option selected="selected" value="0">Please select</option>');
            for (var i = 0; i < response.length; i++) {
                State.append($("<option></option>").val(response[i].id).html(response[i].stateName));
            }
            if ($('#hdnState').val() != 0) {
                State.val($('#hdnState').val());
            }
        },
        failure: function (response) {
            alert(response.responseText);
        },
        error: function (response) {
            alert(response.responseText);
            $("#loader").hide();
        }
    });
}

function BindCity() {  
    var City = $("#CityId") + CityList;
    $.ajax({
        type: "GET",
        url: BaseURL + CityList,
        "datatype": "json",
        success: function (response) {
            ;
            City.empty().append('<option selected="selected" value="0">Please select</option>');
            for (var i = 0; i < response.length; i++) {
                City.append($("<option></option>").val(response[i].id).html(response[i].cityName));
            }
            if ($('#hdnCity').val() != 0) {
                City.val($('#hdnCity').val());
            }
        },
        failure: function (response) {
            alert(response.responseText);
        },
        error: function (response) {
            alert(response.responseText);
            $("#loader").hide();
        }
    })
}
function CleareRoleFields() {
    $('#DeleteLocationModel #ID').val("0");
}
function ConfirmationDelete(id) {
    $('#DeleteLocationModel #ID').val(id);
}
function DeleteRole() { 
    if (IsDeletePerm) {
        var tempInAtiveID = $('#DeleteLocationModel #ID').val();
        var url = DeletLocationByIdUrl + "/" + tempInAtiveID;
        ajaxServiceMethod(BaseURL + url, 'POST', DeleteRoleByIdSuccess, DeleteFailure); 
    }
    else {
        toastr.error(DeleteAccessDenied);
    }
}
function DeleteRoleByIdSuccess(data) {
    try {
        if (data._Success === true) { 
            CleareRoleFields();
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
