var docId = 0;

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
    $('#Address_AlternatePhone').keypress(function (e) {
        if ($('#Address_AlternatePhone').val() == '' && e.which == 48) {
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

    $('#Contact_Mobile').keypress(function (e) {
        if ($('#Contact_Mobile').val() == '' && e.which == 48) {
            return false;
        }
        else {
            var charCode = (e.which) ? e.which : event.keyCode;
            if (String.fromCharCode(charCode).match(/[^0-9]/g)) {
                return false;
            }
        }
    });
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
});

function profileTab(evt, cityName) {
    var i, tabcontent, tablinks;
    tabcontent = document.getElementsByClassName("tabcontent");
    for (i = 0; i < tabcontent.length; i++) {
        tabcontent[i].style.height = 0;
        tabcontent[i].style.padding = 0;
        tabcontent[i].style.border = "none";
        tabcontent[i].style.marginTop = 0;
    }
    tablinks = document.getElementsByClassName("tablinks");
    for (i = 0; i < tablinks.length; i++) {
        tablinks[i].className = tablinks[i].className.replace(" active", "");
    }
    document.getElementById(cityName).style.height = "auto";
    document.getElementById(cityName).style.padding = "6px 12px";
    document.getElementById(cityName).style.border = "1px solid var(--blue)";
    evt.currentTarget.className += " active";
}
document.getElementById("defaultOpen").click();

function removeParentDiv(element) {
    const parentDiv = element.closest('.roundBorderBox');
    if (parentDiv) {
        parentDiv.remove();
    }
}

function addRoundBorderBox() {
    const roundBorderBox = document.querySelector('.roundBorderBox');
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
    $("#Addresses_" + count + "__StateId").empty();
    $("#Addresses_" + count + "__CityId").empty();

}

function removeParentDivAddress(element) {
    const parentDivAdd = element.closest(".addMoreAddress");
    if (parentDivAdd) {
        parentDivAdd.remove()
    }
}






function BindClientType() {

    var ClientType = $("#ClientTypeId");
    var _val = $('#hdnClientType').val();
    var _rpname = "clientType";

    BindDropdowns(ClientTypeList, ClientType, _rpname, _val);
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

document.addEventListener("DOMContentLoaded", function () {
    // Add an event listener to the form submission
    //document.getElementById("client").addEventListener("submit", function (event) {
    //    // Call the custom validation function
    //    if (!validatePhoneNumbers()) {
    //        // If validation fails, prevent the form submission
    //        event.preventDefault();
    //    }
    //});

    // Add change event listeners to relevant input fields
    var addressContainer = $("#addresses-container");
    var count = addressContainer.children(".addMoreAddress").length;
    for (var i = 0; i < count; i++) {
        document.getElementById("#Addresses_" + i + "__Phone").addEventListener("change", validatePhoneNumbers(i));
        document.getElementById("Addresses_" + i + "__AlternatePhone").addEventListener("change", validatePhoneNumbers(i));
        document.getElementById("Addresses_" + i + "__Landlinephone").addEventListener("change", validatePhoneNumbers(i));

    }
});

function getNumericValue(inputValue) {
    // Extract only numeric values from the input, excluding any phone codes
    return inputValue.replace(/\D/g, "");
}

function validatePhoneNumbers(i) {
    var addressContainer = $("#addresses-container");
    var count = addressContainer.children(".addMoreAddress").length;
    // Get numeric values of the phone number fields

    var phoneExtNumeric = getNumericValue(document.getElementById("Addresses_" + i + "__PhoneExt").value.trim());
    var phoneNumeric = getNumericValue(document.getElementById("Addresses_" + i + "__Phone").value.trim());
    var alternatePhoneExtNumeric = getNumericValue(document.getElementById("Addresses_" + i + "__AlternatePhoneExt").value.trim());
    var alternatePhoneNumeric = getNumericValue(document.getElementById("Addresses_" + i + "__AlternatePhone").value.trim());
    var landlinePhoneNumeric = getNumericValue(document.getElementById("Addresses_" + i + "__Landlinephone").value.trim());

    if (
        (phoneNumeric !== "" && (phoneNumeric === alternatePhoneNumeric || phoneNumeric === landlinePhoneNumeric)) ||
        (alternatePhoneNumeric !== "" && alternatePhoneNumeric === landlinePhoneNumeric)
    ) {
        // Display an alert or perform any other action to indicate the validation failure
        toastr.error(' Phone numbers,Alternate Phone and LandLine Phone should be different, considering prefixes.');
        if (phoneNumeric === alternatePhoneNumeric) {
            document.getElementById('Addresses_' + i + '__AlternatePhone').value = '';
        }

        if (alternatePhoneNumeric === landlinePhoneNumeric) {
            document.getElementById('Addresses_' + i + '__Landlinephone').value = '';
        }

        if (phoneNumeric === landlinePhoneNumeric) {
            document.getElementById('Addresses_' + i + '__Landlinephone').value = '';
        }
        return false;
    }

    return true;
}

document.addEventListener("DOMContentLoaded", function () {
    // Add an event listener to the form submission
    //document.getElementById("client").addEventListener("submit", function (event) {
    //    // Call the custom validation function
    //    if (!validateEmails()) {
    //        // If validation fails, prevent the form submission
    //        event.preventDefault();
    //    }
    //});
    var addressContainer = $("#addresses-container");
    var count = addressContainer.children(".addMoreAddress").length;
    for (var i = 0; i < count; i++) {
        // Add change event listeners to relevant input fields
        document.getElementById("Addresses_" + i + "__Email").addEventListener("change", validateEmails(i));
        document.getElementById("Addresses_" + i + "__AlternateEmail").addEventListener("change", validateEmails(i));
    }
});

function validateEmails(i) {
    // Get values of the email fields
    var email = document.getElementById("Addresses_" + i + "__Email").value.trim();
    var alternateEmail = document.getElementById("Addresses_" + i + "__AlternateEmail").value.trim();

    // Check if Email and AlternateEmail are the same
    if (email !== "" && alternateEmail !== "" && email === alternateEmail) {
        // Display an alert or perform any other action to indicate the validation failure
        toastr.error('Email and Alternate Email should be different.');
        document.getElementById('Addresses_' + i + '__AlternateEmail').value = '';
        return false;
    }

    // Validation passed
    return true;
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
        if (id) {
            docId = id;
            ajaxServiceMethod(BaseURL + DeleteClientDocument + "/" + docId, Delete, DeleteClientDocumentSuccess, DeleteClientDocumentError);
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



    function validateFileSize(input) {
        const maxSizeInBytes = 2 * 1024 * 1024; // 5MB
    const files = input.files;

    for (let i = 0; i < files.length; i++) {
            if (files[i].size > maxSizeInBytes) {
                toastr.error('File size exceeds 2MB. Please choose a smaller file.');
    input.value = ''; // Clear the input to prevent uploading the large file
    return;
            }
        }

    // If all files are within the size limit, display the file names
    displayFileNames(input);
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

    





