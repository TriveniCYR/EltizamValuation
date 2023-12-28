var docId = 0;
var phoneArray = [];
var emailArray = [];
$(document).ready(function () {

    var emailInput = $("#Email");
    emailInput.on('blur', function () {
        // Get the value of the email input
        var emailValue = $(this).val();
        var recordId = $('#hdnId').val()
        var url = "?email=" + emailValue + "&userId=" + recordId;
        ajaxServiceMethod(BaseURL + CheckEmailExistonRemote + url, 'GET', GetemailexistSuccess, GetemailexistError);
    });
    //$("[for=ApproverLevelId]").hide();
    IsApprovalLevelVisible($('#hdnRole').val() == 2) // RoleId= 2:Approver

    BindDepartment();
    BindDesignation();
    BindRole();
    BindResourceType();
    BindApproverLevel();
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
function GetemailexistSuccess(data) {
    console.log(data)
    toastr.error("Email" + data._Message);
}
function GetemailexistError(x, y, z) {

}

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
function BindApproverLevel() {
    var ApproverLevelType = $("#ApproverLevelId");
    var _val = $('#hdnApproverLevelId').val();
    var _rpname = "description";
    BindDropdowns(ApproverLevelList, ApproverLevelType, _rpname, _val);
}

function BindCountry() {
    for (var i = 0; i < addressLength; i++) {
        var Country = $("#Addresses_" + i + "__CountryId");
        var _val = $('#hdnCountry_' + i).val();
        var _rpname = "countryName";
        BindDropdowns(CountryList, Country, _rpname, _val);
    }
}

function BindState(id) {
    for (var i = 0; i < addressLength; i++) {
        var State = $("#Addresses_" + i + "__StateId");
        var CountryId = $('#hdnCountry_' + i).val();
        var _val = $('#hdnState_' + i).val();
        var _rpname = "stateName";

        BindDropdowns(StateList + '/' + CountryId, State, _rpname, _val);
    }
}

function BindCity(id) {
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
    Gender.empty().append('<option selected="selected" value="">Please select</option>');
    Gender.append($("<option></option>").val('M').html('Male'));
    Gender.append($("<option></option>").val('F').html('Female'));
    if ($('#hdnGender').val() != 0) {
        Gender.val($('#hdnGender').val());
    }
}


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
            $('#' + docId).remove();
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


function escape(s) {
    return s.replace(/&/g, '&amp;').replace(/</g, '&lt;').replace(/>/g, '&gt;');
}


function previewImage() {
    var preview = document.getElementById('previewImage');
    var fileInput = document.getElementById('fileInput');
    var sizeError = document.getElementById('sizeError');

    // Check if a file is selected
    if (fileInput.files && fileInput.files[0]) {
        var reader = new FileReader();

        reader.onload = function (e) {
            var img = new Image();
            img.src = e.target.result;

            img.onload = function () {
                // Validate image size
                var maxSizeInBytes = 2 * 1024 * 1024; // 2 MB
                if (fileInput.files[0].size > maxSizeInBytes) {
                    sizeError.style.display = 'inline-block';
                    fileInput.value = ''; // Clear the file input
                    preview.src = ''; // Clear the preview
                }

                else {
                    sizeError.style.display = 'none';
                    preview.src = e.target.result;
                }
            };
        };

        // Read the file as a data URL
        reader.readAsDataURL(fileInput.files[0]);
    }
}

// Attach the function to the change event of the file input
var dd = document.getElementById('fileInput');
if (dd !== null && dd !== undefined)
    dd.addEventListener('change', previewImage);



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
    if (address1 == "" || countryId == "0" || countryId == null || stateId == 0 || stateId == null || cityId == 0 || cityId == null || phoneExt == "" || phone == "") {
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
    for (var i = num; i < count; i++) {
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
    var res = document.getElementById("resource");

    if (res !== null) {
        document.getElementById("resource").addEventListener("submit", function (event) {
            emailArray = [];
            phoneArray = [];
            // Call the custom validation function
            if (!validateForAddress() || !validateForContact()) {
                // If validation fails, prevent the form submission
                $('#loading-wrapper').hide();
                event.preventDefault();
            }
        });
    } 
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
    var PinNumber = $("#Addresses_" + count + "__PinNo").val();
    var email = $("#Addresses_" + count + "__Email").val();
    var AlternateEmail = $("#Addresses_" + count + "__AlternateEmail").val();
    var phoneExt = $("#Addresses_" + count + "__PhoneExt").val();
    var phone = $("#Addresses_" + count + "__Phone").val();
    var AlternatePhone = $("#Addresses_" + count + "__AlternatePhone").val();
    var Landlinephone = $("#Addresses_" + count + "__Landlinephone").val();
    if (address1 == "" || countryId == "0" || countryId == null || stateId == 0 || stateId == null || cityId == 0 || cityId == null || phoneExt == "" || phone == "") {
        toastr.error("Please fill mandate fields in address section.");
        return false;
    }
    // Function to validate email
    if (email != "" && email != null) {
        if (!isValidEmail(email)) {
            toastr.error("Please fill valid email id in address section.");
            return false;
        }
    }

    if (AlternateEmail != "" && AlternateEmail != null) {
        if (!isValidEmail(AlternateEmail)) {
            toastr.error("Please fill valid alter email id in address section.");
            return false;
        }
    }
    if (PinNumber != "" && PinNumber != null) {
        if (!isValidZipCode(PinNumber)) {
            toastr.error("Please fill valid zip code.");
            return false;
        }
    }
    if (!isValidPhone(phone)) {
        toastr.error("Please fill valid phone number.");
        return false;
    }
    if (AlternatePhone != "" && AlternatePhone != null) {
        if (!isValidPhone(AlternatePhone)) {
            toastr.error("Please fill valid alter phone number.");
            return false;
        }
    }
    if (Landlinephone != "" && Landlinephone != null) {
        if (!isValidPhone(Landlinephone)) {
            toastr.error("Please fill valid landline phone number.");
            return false;
        }
    }
    var addressContainer = $("#addresses-container");
    var count = addressContainer.children(".addMoreAddress").length;
    var emails = [];
    var altEmails = [];
    var phones = [];
    var altPhones = [];
    var landPhones = [];
    if (count > 0) {
        for (i = 0; i < count; i++) {
            var allemail = $("#Addresses_" + i + "__Email").val();
            var allaltEmail = $("#Addresses_" + i + "__AlternateEmail").val();
            var allphone = $("#Addresses_" + i + "__Phone").val();
            var allaltPhone = $("#Addresses_" + i + "__AlternatePhone").val();
            var alllandPhone = $("#Addresses_" + i + "__Landlinephone").val();

            if (allemail != "") {
                //emails[i] = allemail;
                emails.push(allemail);
            }
            if (allaltEmail != "") {
                emails.push(allaltEmail);
            }
            if (allphone != "") {
                //phones[i] = allphone;
                phones.push(allphone);
            }
            if (allaltPhone != "") {
                phones.push(allaltPhone);
            }
            if (alllandPhone != "") {
                phones.push(alllandPhone);
            }
        }
        emailArray = emails.sort();
        for (var z = 0; z < emailArray.length - 1; z++) {
            if (emailArray[z + 1] == emailArray[z]) {
                toastr.error("Email can not be duplicated.");
                return false;
            }
        }
        phoneArray = phones.sort();
        for (var y = 0; y < phoneArray.length - 1; y++) {
            if (phoneArray[y + 1] == phoneArray[y]) {
                toastr.error("phone number can not be duplicated.");
                return false;
            }
        }
    }
    var errorMsgForAll = "";
    if ($("#DepartmentId").val() === "" || $("#DepartmentId").val() === "0") {

        $("#validationDepartmentId").text("The Department field is required.");
        errorMsgForAll = "1";
    }
    if ($("#DesignationId").val() === "" || $("#DesignationId").val() === "0") {

        $("#validationDesignationId").text("The Designation field is required.");
        errorMsgForAll += "1";

    }
    if ($("#ResourceId").val() === "" || $("#ResourceId").val() === "0") {

        $("#validationResourceId").text("The ResourceType field is required.");
        errorMsgForAll += "1";

    }
    if (errorMsgForAll != "") {
        toastr.error("Please fill mandate fields in profile section.");
        return false;
    }

    return true;
}
function isValidEmail(email) {
    var emailPattern = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$/;
    return emailPattern.test(email);
}

function isValidPhone(phone) {
    var phonePattern = /^[0-9]{9,12}$/;
    return phonePattern.test(phone);
}

function isValidZipCode(phone) {
    var phonePattern = /^[0-9]{5,10}$/;
    return phonePattern.test(phone);
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

document.addEventListener('DOMContentLoaded', function () {
    // Get the file input element
    var fileInput = document.getElementById('fileInput');

    if (fileInput !== null) {
        // Add an event listener to the file input
        fileInput.addEventListener('change', function () {
            // Get the selected file
            var file = fileInput.files[0];

            // Check if a file is selected
            if (file) {
                // Check if the file type is an image
                if (!file.type.startsWith('image/')) {
                    // Display an error message or handle the error as needed
                    toastr.error('Please select a valid image file.');
                    // Reset the file input (optional)
                    fileInput.value = '';
                }
            }
        });
    }
});

if (action === "Add" || action === "Edit") {
    document.addEventListener('DOMContentLoaded', function () {
        flatpickr('#DateOfBirth', {
            dateFormat: 'd-M-Y',
            defaultDate: 'today',
            onChange: function (selectedDates, dateStr, instance) {
                validateDate(selectedDates[0], instance);
            }
        });

        function validateDate(selectedDate, instance) {
            var today = new Date();
            today.setHours(0, 0, 0, 0);
            if (selectedDate > today) {
                toastr.error("future Dates are not allowed");
                instance.setDate('today');
            }
        }
    });
}
$('#openModalLinklatestRequestsTable').on('blur', function () {
    // Clear the table body before making a new request
    $('#data-tablerequest tbody').empty();

    checkemailexist()
        .done(function (data) {
            console.log(data);

        })
        .fail(function () {
            alert('Failed to fetch data for modal 1 from the API');
        });
    return false;
});
$('#RoleId').on('change', function () {
    var selectval = $("#RoleId").val();
    IsApprovalLevelVisible(selectval == 2)
});
function IsApprovalLevelVisible(flag) {
    if (flag) {
        $("[for=ApproverLevelId]").show();
    }
    else {
        $("[for=ApproverLevelId]").hide();
    }
}

