var docId = 0;
$(document).ready(function () {
    BindDepartment();
    BindDesignation();
    BindRole();
    BindResourceType();
    BindCountry();
    BindCountryIsd();

    var countryId = $('#hdnCountry_0').val();
    if (countryId != null || countryId != 0) {
        BindState(countryId);
        var stateId = $('#hdnState_0').val();
        BindCity(stateId);
    }
    BindGender();

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


function BindCountry() {
    debugger
    for (var i = 0; i < addressLength; i++) {
        var Country = $("#Addresses_" + i + "__CountryId");
        var _val = $('#hdnCountry_' + i).val();
        var _rpname = "countryName";
        BindDropdowns(CountryList, Country, _rpname, _val);
    }
}

function BindState(id) {
    debugger
    for (var i = 0; i < addressLength; i++) {
        var State = $("#Addresses_" + i + "__StateId");
        var CountryId = $('#hdnCountry_' + i).val();
        var _val = $('#hdnState_' + i).val();
        var _rpname = "stateName";

        BindDropdowns(StateList + '/' + CountryId, State, _rpname, _val);
    }
}

function BindCity(id) {
    debugger
    for (var i = 0; i < addressLength; i++) {
        var City = $("#Addresses_" + i + "__CityId");
        var _val = $('#hdnCity_' + i).val();
        var StateId = $('#hdnState_' + i).val();
        var _rpname = "cityName";
        BindDropdowns(CityList + '/' + StateId, City, _rpname, _val);
    }
}

function BindCurrentState(id, event) {
    var currentId = event.target.id;
    var parts = currentId.split("_");
    var index = parts[1];
    var State = $("#Addresses_" + index + "__StateId");
    var _val = $('#hdnState_' + index).val();
    var _rpname = "stateName";
    BindDropdowns(StateList + '/' + id, State, _rpname, _val);
}

function BindCurrentCity(id, event) {
    var currentId = event.target.id;
    var parts = currentId.split("_");
    var index = parts[1];
    var City = $("#Addresses_" + index + "__CityId");
    var _val = $('#hdnCity_' + index).val();
    var _rpname = "cityName";
    BindDropdowns(CityList + '/' + id, City, _rpname, _val);
}

function BindGender() {
    var Gender = $("#Gender");
    Gender.empty().append('<option selected="selected" value="0">Please select</option>');
    Gender.append($("<option></option>").val('M').html('Male'));
    Gender.append($("<option></option>").val('F').html('Female'));
    if ($('#hdnGender').val() != 0) {
        Gender.val($('#hdnGender').val());
    }
}

/*
function BindCountryCode() {
    var CountryCode = $("#Address_PhoneExt");
    var AlternatePhone = $("#Address_AlternatePhoneExt");
    var _val = $('#hdnPhoneExt').val();
    var _valAlter = $('#hdnAlternatePhoneExt').val();

    $.ajax({
        type: "GET",
        url: BaseURL + CountryList,
        "datatype": "json",
        success: function (response) {
           
            CountryCode.empty().append('<option selected="selected" value="">select</option>');
            AlternatePhone.empty().append('<option selected="selected" value="">select</option>');
            for (var i = 0; i < response.length; i++) {
                CountryCode.append($("<option></option>").val(response[i].isdCountryCode).html(response[i].isdCountryCode));
                AlternatePhone.append($("<option></option>").val(response[i].isdCountryCode).html(response[i].isdCountryCode));
            }
            if (_val != "" || _valAlter != "") {
                CountryCode.val(_val);
                AlternatePhone.val(_valAlter);
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
*/

$('#Address_PinNo').keypress(function (e) {
    if ($('#Address_PinNo').val() == '' && e.which == 48) {
        return false;
    }
    else {
        var charCode = (e.which) ? e.which : event.keyCode;
        if (String.fromCharCode(charCode).match(/[^0-9]/g)) {
            return false;
        }
    }
});
$('#Address_Phone').keypress(function (e) {
    if ($('#Address_Phone').val() == '' && e.which == 48) {
        return false;
    }
    else {
        var charCode = (e.which) ? e.which : event.keyCode;
        if (String.fromCharCode(charCode).match(/[^0-9]/g)) {
            return false;
        }
    }
});
$('#Address_Landlinephone').keypress(function (e) {
    if ($('#Address_Landlinephone').val() == '' && e.which == 48) {
        return false;
    }
    else {
        var charCode = (e.which) ? e.which : event.keyCode;
        if (String.fromCharCode(charCode).match(/[^0-9]/g)) {
            return false;
        }
    }
});
$('#Address_AlternatePhone').keypress(function (e) {
    if ($('#Address_Landlinephone').val() == '' && e.which == 48) {
        return false;
    }
    else {
        var charCode = (e.which) ? e.which : event.keyCode;
        if (String.fromCharCode(charCode).match(/[^0-9]/g)) {
            return false;
        }
    }
});
$('#Qualification_YearOfInstitute').keypress(function (e) {
    if ($('#Qualification_YearOfInstitute').val() == '' && e.which == 48) {
        return false;
    }
    else {
        var charCode = (e.which) ? e.which : event.keyCode;
        if (String.fromCharCode(charCode).match(/[^0-9]/g)) {
            return false;
        }
    }
});
function ConfirmationDocument(id, isAction) {
    $('#DeleteDocumentModel #ID').val(id);


}
function DeleteDocument() {
    var id = $('#DeleteDocumentModel #ID').val();
    if (id) {
        docId = id;
        ajaxServiceMethod(BaseURL + DeleteUserDocument + "/" + docId, Delete, DeleteUserDocumentSuccess, DeleteUserDocumentError);
    }
    else {
        toastr.error(DeleteAccessDenied);
    }
}
function DeleteUserDocumentSuccess(data) {
    try {
        if (data._Success === true) {
            $('#'+docId).remove();
            toastr.success(RecordDelete);
        }
        else {
            toastr.error(data._Message);
        }
    } catch (e) {
        toastr.error('Error:' + e.message);
    }
}
function DeleteUserDocumentError(x, y, z) {
    toastr.error(ErrorMessage);
}
function profileTab(evt, cityName) {
    var i, tabcontent, tablinks;
    tabcontent = document.getElementsByClassName("tabcontent");
    for (i = 0; i < tabcontent.length; i++) {
        tabcontent[i].style.height = 0;
        tabcontent[i].style.padding = 0;
        tabcontent[i].style.border = "none";
        tabcontent[i].style.marginTop = 0;
        tabcontent[i].style.position = "absolute";
    }
    tablinks = document.getElementsByClassName("tablinks");
    for (i = 0; i < tablinks.length; i++) {
        tablinks[i].className = tablinks[i].className.replace(" active", "");
    }
    document.getElementById(cityName).style.height = "auto";
    document.getElementById(cityName).style.padding = "6px 12px";
    document.getElementById(cityName).style.border = "1px solid var(--blue)";
    document.getElementById(cityName).style.position = "initial";
    evt.currentTarget.className += " active";
}
document.getElementById("defaultOpen").click();

function sideNavToggle() {
    var x = document.getElementById("sideNav");
    if (x.style.display === "none") {
        x.style.display = "block";
    } else {
        x.style.display = "none";
    }
}

// accordian function here
function accordianToggle(header) {
    const item = header.nextElementSibling;
    if (item.style.height === 'auto') {
        item.style.height = 0;
    } else {
        item.style.height = 'auto';
    }
}
//accordian function end

function removeParentDiv(element) {
    const parentDiv = element.closest('.roundBorderBox');
    if (parentDiv) {
        parentDiv.remove();
    }
    var addressContainer = $("#qualifications-container");
    var count = addressContainer.children(".roundBorderBox").length;
    for (i = num; i < count; i++) {
        addressContainer.children(".roundBorderBox")[i].querySelectorAll('[id]').forEach(element => {
            element.id = element.id.replace("_" + (i + 1) + "", "_" + i);
        });
        addressContainer.children(".roundBorderBox")[i].querySelectorAll('[name]').forEach(element => {
            element.name = element.name.replace("[" + (i + 1) + "]", "[" + i + "]");
        });

    }
}


// more address field on click
function addMoreAddress() {
    const addMoreAddressBox = document.querySelector('.addMoreAddress:last-child');
    const clonedDiv = addMoreAddressBox.cloneNode(true);
    var addressContainer = $("#addresses-container");
    var count = addressContainer.children(".addMoreAddress").length;
    clonedDiv.querySelectorAll('[id]').forEach(element => {
        element.id = element.id.replace("_" + (count - 1) + "", "_" + count);
    });
    clonedDiv.querySelectorAll('[name]').forEach(element => {
        element.name = element.name.replace("[" + (count - 1) + "]", "[" + count + "]");
    });
    var address1 = $("#Addresses_" + (count - 1) + "__Address1").val();
    var countryId = $("#Addresses_" + (count - 1) + "__CountryId").val();
    var stateId = $("#Addresses_" + (count - 1) + "__StateId").val();
    var cityId = $("#Addresses_" + (count - 1) + "__CityId").val();
    var email = $("#Addresses_" + (count - 1) + "__Email").val();
    var phoneExt = $("#Addresses_" + (count - 1) + "__PhoneExt").val();
    var phone = $("#Addresses_" + (count - 1) + "__Phone").val();
    if (address1 == "" || countryId == "0" || countryId == null || stateId == 0 || stateId == null || cityId == 0 || cityId == null || email == "" || phoneExt == "" || phone == "") {
        toastr.error("Please fill mandate fields in current section.");
        return false;
    }
    if (count == 1) {
        const minusDiv = document.createElement('div');
        minusDiv.className = 'text-right';
        minusDiv.innerHTML = `
    <img src="../assets/minus-icon.svg" alt="minus-icon" class="minus-icon cursor-pointer" onclick="removeParentDivAddress(this)">
        `;
        clonedDiv.insertBefore(minusDiv, clonedDiv.firstChild);
    }
    addMoreAddressBox.parentElement.insertBefore(clonedDiv, addMoreAddressBox.nextSibling);

    const inputFields = clonedDiv.querySelectorAll('input');
    inputFields.forEach((input) => {
        input.value = '';
    });
    $('.searchable-dropdown').select2();

    $("#Addresses_" + count + "__StateId").empty();
    $("#Addresses_" + count + "__CityId").empty();
}

//function removeParentDiv(element) {
//    const parentDiv = element.closest('.addQualification');
//    if (parentDiv) {
//        parentDiv.remove();
//    }
//}

function addRoundBorderBox() {
    const roundBorderBox = document.querySelector('.addQualification:last-child');
    const clonedDiv = roundBorderBox.cloneNode(true);
    var qualificationContainer = $("#qualifications-container");
    var count = qualificationContainer.children(".addQualification").length;
    clonedDiv.querySelectorAll('[id]').forEach(element => {
        element.id = element.id.replace("_" + (count - 1) + "", "_" + count);
    });
    clonedDiv.querySelectorAll('[name]').forEach(element => {
        element.name = element.name.replace("[" + (count - 1) + "]", "[" + count + "]");
    });
    var qualification = $("#Qualifications_" + (count - 1) + "__Qualification").val();
    var subject = $("#Qualifications_" + (count - 1) + "__Subject").val();
    var yearOfInstitute = $("#Qualifications_" + (count - 1) + "__YearOfInstitute").val();
    var grade = $("#Qualifications_" + (count - 1) + "__Grade").val();
    var institute = $("#Qualifications_" + (count - 1) + "__Institute").val();
    if (qualification == "" || subject == "" || yearOfInstitute == "" || grade == "" || institute == "") {
        toastr.error("Please fill mandate fields in current section.");
        return false;
    }
    if (count == 1) {
        const minusDiv = document.createElement('div');
        minusDiv.className = 'text-right';
        minusDiv.innerHTML = `
    <img src="../assets/minus-icon.svg" alt="minus-icon" class="minus-icon cursor-pointer" onclick="removeParentDiv(this)">
        `;
        clonedDiv.insertBefore(minusDiv, clonedDiv.firstChild);
    }
    roundBorderBox.parentElement.insertBefore(clonedDiv, roundBorderBox.nextSibling);

    const inputFields = clonedDiv.querySelectorAll('input');
    inputFields.forEach((input) => {
        input.value = '';
    });
}

function removeParentDivAddress(element, num) {
    const parentDivAdd = element.closest(".addMoreAddress");
    if (parentDivAdd) {
        parentDivAdd.remove()
    }
    var addressContainer = $("#addresses-container");
    var count = addressContainer.children(".addMoreAddress").length;
    for (i = num; i < count; i++) {
        addressContainer.children(".addMoreAddress")[i].querySelectorAll('[id]').forEach(element => {
            element.id = element.id.replace("_" + (i + 1) + "", "_" + i);
        });
        addressContainer.children(".addMoreAddress")[i].querySelectorAll('[name]').forEach(element => {
            element.name = element.name.replace("[" + (i + 1) + "]", "[" + i + "]");
        });

    }
}


document.addEventListener("DOMContentLoaded", function () {
    // Add an event listener to the form submission
    document.getElementById("resource").addEventListener("submit", function (event) {
        // Call the custom validation function
        if (!validateForAddress() || !validateForContact()) {
            // If validation fails, prevent the form submission
            $('#loading-wrapper').hide();
            event.preventDefault();
        }
    });

});

function validateForAddress() {
    const addMoreAddressBox = document.querySelector('.addMoreAddress:last-child');
    const clonedDiv = addMoreAddressBox.cloneNode(true);
    var lastId = clonedDiv.querySelectorAll('[id]')[0].id;
    var parts = lastId.split("_");
    var count = parts[1];
    var address1 = $("#Addresses_" + count + "__Address1").val();
    var countryId = $("#Addresses_" + count + "__CountryId").val();
    var stateId = $("#Addresses_" + count + "__StateId").val();
    var cityId = $("#Addresses_" + count + "__CityId").val();
    var email = $("#Addresses_" + count + "__Email").val();
    var phoneExt = $("#Addresses_" + count + "__PhoneExt").val();
    var phone = $("#Addresses_" + count + "__Phone").val();
    if (address1 == "" || countryId == "0" || countryId == null || stateId == 0 || stateId == null || cityId == 0 || cityId == null || email == "" || phoneExt == "" || phone == "") {
        toastr.error("Please fill mandate fields in address section.");
        return false;
    }
    // Function to validate email
    if (!isValidEmail(email)) {
        toastr.error("Please fill valid email id in address section.");
        return false;
    }

    return true;
}
function isValidEmail(email) {
    var emailPattern = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$/;
    return emailPattern.test(email);
}
function validateForContact() {
    const roundBorderBox = document.querySelector('.addQualification:last-child');
    const clonedDiv = roundBorderBox.cloneNode(true);
    var lastId = clonedDiv.querySelectorAll('[id]')[0].id;
    var parts = lastId.split("_");
    var count = parts[1];
    var qualification = $("#Qualifications_" + (count - 1) + "__Qualification").val();
    var subject = $("#Qualifications_" + (count - 1) + "__Subject").val();
    var yearOfInstitute = $("#Qualifications_" + (count - 1) + "__YearOfInstitute").val();
    var grade = $("#Qualifications_" + (count - 1) + "__Grade").val();
    var institute = $("#Qualifications_" + (count - 1) + "__Institute").val();
    if (qualification == "" || subject == "" || yearOfInstitute == "" || grade == "" || institute == "") {
        toastr.error("Please fill mandate fields in current section.");
        return false;
    }
    // Function to validate email
    if (!isValidEmail(email)) {
        toastr.error("Please fill valid email in contact section.");
        return false;
    }
    return true;
}
function displayFileNames(input) {
    const fileInput = input;
    const fileNamesInput = input.nextElementSibling;

    const files = fileInput.files;
    let fileNames = "";

    for (let i = 0; i < files.length; i++) {
        fileNames += files[i].name;
        if (i < files.length - 1) {
            fileNames += ", ";
        }
    }

    fileNamesInput.value = fileNames;
}
