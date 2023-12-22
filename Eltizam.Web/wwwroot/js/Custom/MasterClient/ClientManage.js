var docId = 0;
var phoneArray = [];
var emailArray = [];

$(document).ready(function () {
    BindClientType();
    BindCountry();
    var countryId = $('#hdnCountry_0').val();
    if (countryId != null || countryId != 0) {
        BindState(countryId);
        var stateId = $('#hdnState_0').val();
        BindCity(stateId);
    }
    BindDepartment();
    BindDesignation();
    BindCountryCode();
});

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

function removeParentDiv(element, num) {
    const parentDiv = element.closest('.roundBorderBox');
    if (parentDiv) {
        parentDiv.remove();
    }
    var contactContainer = $("#contacts-container");
    var count = contactContainer.children(".roundBorderBox").length;
    for (i = num; i < count; i++) {
        contactContainer.children(".roundBorderBox")[i].querySelectorAll('[id]').forEach(element => { 
            element.id = element.id.replace("_" + (i + 1) + "", "_" + i);
        });
        contactContainer.children(".roundBorderBox")[i].querySelectorAll('[name]').forEach(element => {
            element.name = element.name.replace("[" + (i + 1) + "]", "[" + i + "]");
        });

    }
}

function addRoundBorderBox() {
    const roundBorderBox = document.querySelector('.roundBorderBox:last-child');
    const clonedDiv = roundBorderBox.cloneNode(true);

    var addressContainer = $("#contacts-container");
    var count = addressContainer.children(".roundBorderBox").length;

    clonedDiv.querySelectorAll('[id]').forEach(element => {
        element.id = element.id.replace("_" + (count - 1) + "", "_" + count);
    });
    clonedDiv.querySelectorAll('[name]').forEach(element => {
        element.name = element.name.replace("[" + (count - 1) + "]", "[" + count + "]");
    });
    var personName = $("#Contacts_" + (count - 1) + "__ContactPersonName").val();
    var email = $("#Contacts_" + (count - 1) + "__Email").val();
    var mobileExt = $("#Contacts_" + (count - 1) + "__MobileExt").val();
    var mobile = $("#Contacts_" + (count - 1) + "__Mobile").val();
    if (personName == "" || email == "" || mobileExt == "" || mobileExt == "0" || mobile == "") {
        toastr.error("Please fill mandate fields");
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

// more address field on click
function addMoreAddress() {
    const addMoreAddressBox = document.querySelector('.addMoreAddress:last-child');
    const clonedDiv = addMoreAddressBox.cloneNode(true);
    var addressContainer = $("#addresses-container");
    var count = addressContainer.children(".addMoreAddress").length;
    clonedDiv.querySelectorAll('[id]').forEach(element => {
        element.id = element.id.replace("_" + (count - 1)+"", "_" + count);
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
        toastr.error("Please fill mandate fields");
        return false;
    }
    if (count == 1) {
        const minusDiv = document.createElement('div');
        minusDiv.className = 'text-right';
        minusDiv.innerHTML = ' <img src="../assets/minus-icon.svg" alt="minus-icon" class="minus-icon cursor-pointer" onclick="removeParentDivAddress(this,'+count+')"> ';
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
    document.getElementById("client").addEventListener("submit", function (event) {
        emailArray = [];
        phoneArray = [];
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
    var AlternatePhone = $("#Addresses_" + count + "__AlternatePhone").val();
    var Landlinephone = $("#Addresses_" + count + "__Landlinephone").val();

    if (address1 == "" || countryId == "0" || countryId == null || stateId == 0 || stateId == null || cityId == 0 || cityId == null || email == "" || phoneExt == "" || phone == "") {
        toastr.error("Please fill mandate fields in address section.");
        return false;
    }
    // Function to validate email
    if (!isValidEmail(email)) {
        toastr.error("Please fill valid email id in address section.");
        return false;
    }
    if (!isValidEmail(phone)) {
        toastr.error("Please fill valid phone number.");
        return false;
    }
    if (AlternatePhone != "" && AlternatePhone != null) {
        if (!isValidEmail(AlternatePhone)) {
            toastr.error("Please fill valid alter phone number.");
            return false;
        }
    }
    if (Landlinephone != "" && Landlinephone != null) {
        if (!isValidEmail(Landlinephone)) {
            toastr.error("Please fill valid landline phone number.");
            return false;
        }
    }
    var addressContainer = $("#addresses-container");
    var count = addressContainer.children(".addMoreAddress").length;
    var contactContainer = $("#contacts-container");
    var countContact = contactContainer.children(".roundBorderBox").length;
    
    var emails = [];
    var altEmails = [];
    var phones = [];
    var altPhones = [];
    var landPhones = [];
    if (count > 0 && countContact > 0) {
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
        for (z = 0; z < countContact; z++) {
            var contactEmail = $("#Contacts_" + z + "__Email").val();
            var mobile = $("#Contacts_" + z + "__Mobile").val();
            if (contactEmail != "") {
                emails.push(contactEmail);
            }
            if (mobile != "") {
                phones.push(mobile);
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
    return true;
}
function isValidEmail(email) {
    var emailPattern = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$/;
    return emailPattern.test(email);
}
function isValidPhone(phone) {
    var phonePattern = /^[0-9]*$/;
    return phonePattern.test(phone);
}
function validateForContact() {
    const roundBorderBox = document.querySelector('.roundBorderBox:last-child');
    const clonedDiv = roundBorderBox.cloneNode(true);
    var lastId = clonedDiv.querySelectorAll('[id]')[0].id;
    var parts = lastId.split("_");
    var count = parts[1];
    var personName = $("#Contacts_" + count + "__ContactPersonName").val();
    var email = $("#Contacts_" + count + "__Email").val();
    var mobileExt = $("#Contacts_" + count + "__MobileExt").val();
    var mobile = $("#Contacts_" + count + "__Mobile").val();
    if (personName == "" || email == "" || mobileExt == "" || mobileExt == "0" || mobile == "") {
        toastr.error("Please fill mandate fields in contact section.");
        return false;
    }
    // Function to validate email
    if (!isValidEmail(email)) {
        toastr.error("Please fill valid email in contact section.");
        return false;
    }
    return true;
}
function BindClientType() {

    var ClientType = $("#ClientTypeId");
    var _val = $('#hdnClientType').val();
    var _rpname = "clientType";

    BindDropdowns(ClientTypeList, ClientType, _rpname, _val);
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
        var StateId = $('#hdnState_' + i).val();
        var _val = $('#hdnCity_' + i).val();
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


function BindDepartment() {
    for (var i = 0; i < contactLength; i++) {
        var Department = $("#Contacts_" + i + "__DepartmentId");
        var _val = $('#hdnDeparment_' + i).val();
        var _rpname = "department";

        BindDropdowns(DepartmentList, Department, _rpname, _val);
    }
}
function BindDesignation() {
    for (var i = 0; i < contactLength; i++) {
        var Designation = $("#Contacts_" + i + "__DesignationId");
        var _val = $('#hdnDesignation_' + i).val();
        var _rpname = "designation";

        BindDropdowns(DesignationList, Designation, _rpname, _val);
    }
}

function getNumericValue(inputValue) {
    // Extract only numeric values from the input, excluding any phone codes
    return inputValue.replace(/\D/g, "");
}

function previewFiles() {
    var previewContainer = document.getElementById('filePreview');
    var files = document.getElementById('fileInput').files;

    previewContainer.innerHTML = ''; // Clear previous previews

    for (var i = 0; i < files.length; i++) {
        var file = files[i];
        var reader = new FileReader();

        reader.onload = function (e) {
            var div = document.createElement('div');
            div.className = 'file-preview';

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

            if (file.type.startsWith('image/')) {
                // Display image preview for image files
                div.innerHTML = '<strong>' + escape(file.name) + '</strong><br><img src="' + e.target.result + '" alt="Preview">';
            }
            else if (file.type.startsWith('text/') || file.type === 'application/json') {
                // Display text content for text and JSON files
                div.innerHTML = '<strong>' + escape(file.name) + '</strong><br><pre>' + escape(e.target.result) + '</pre>';
            } 
            else if (file.type === 'application/pdf') {
                // Display PDF preview using PDF.js
                var pdfPreview = document.createElement('iframe');
                pdfPreview.src = URL.createObjectURL(file);
                pdfPreview.width = '100%';
                pdfPreview.height = '400px';
                div.appendChild(pdfPreview);
            } else {
                // Display a generic preview for other file types
                div.innerHTML = '<strong>' + escape(file.name) + '</strong><br><p>Preview not available</p>';
            }

            previewContainer.appendChild(div);
        };

        reader.readAsDataURL(file);
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
document.getElementById('fileInput').addEventListener('change', previewImage);


function ConfirmationDocument(id, isAction) {
    $('#DeleteDocumentModel #ID').val(id);


}
function DeleteDocument() {
    if (IsDeletePerm) {
        var id = $('#DeleteDocumentModel #ID').val();
        var by = LogInUserId;
        if (id) {
            docId = id;
            ajaxServiceMethod(BaseURL + DeleteClientDocument + "/" + docId + "?by=" + by, Delete, DeleteClientDocumentSuccess, DeleteClientDocumentError);
        }
    }
    else {
        toastr.error(DeleteAccessDenied);
    }
}
function DeleteClientDocumentSuccess(data) {
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
function DeleteClientDocumentError(x, y, z) {
    toastr.error(ErrorMessage);
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
});

if (action === "Add") {
    document.addEventListener('DOMContentLoaded', function () {
        flatpickr('#TrnexpiryDate', {
            dateFormat: 'd-M-Y',
            defaultDate: 'today',
            onChange: function (selectedDates, dateStr, instance) {
                validateDate(selectedDates[0], instance);
            }
        });

        function validateDate(selectedDate, instance) {
            var today = new Date();
            today.setHours(0, 0, 0, 0);
            if (selectedDate < today) {
                toastr.error("Previous Dates are not allowed");
                instance.setDate('today');
            }
        }
    });
}



   

    





