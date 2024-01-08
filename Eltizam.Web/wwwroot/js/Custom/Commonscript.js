//Use this for entire project to bind the data


//Global variables
var LogInUserId = $("#LogInUserId").val() ?? 1;

var BaseURL = $('#hdnAPIURL').val();
var setDefaultOrder = [0, 'desc'];
var ShowMenuCache = "showMenuCache";
var defaultDateFormat = 'DD-MMM-YYYY hh:mm A';
var flatDateformat = 'd-M-Y';

//Role Enum
var RoleEnum = {
    'Requestor': 1,
    'Approver': 2,
    'Valuer': 3,
    'Admin': 4
}; 

//API methods
var Post = 'POST';
var Get = 'GET';
var Delete = 'DELETE';

//Toastr messages
var SuccessToast = $("#successToaster");
var ErrorToast = $("#errorToaster");
var SuccessToaster = SuccessToast.val();
var ErrorToaster = ErrorToast.val();
var ErrorDev = $("#errorBanner");

//Fixed messages
var SucessMsg = "Action performed successfully.";
var ErrorMsg = "Some error occurred while processing request.";
var DeleteAccessDenied = "Delete permission not granted.";


//Permission related things
var IsDeletePerm = ($("#isDeletePerm").val() === "1" || $("#isDeletePerm").val() === 1);
var isDeleteSite = ($("#isDeleteSite").val() === "1" || $("#isDeleteSite").val() === 1);
var isDeleteQt = ($("#isDeleteQt").val() === "1" || $("#isDeleteQt").val() === 1);
var isDeleteIn = ($("#isDeleteIn").val() === "1" || $("#isDeleteIn").val() === 1);
var isDeleteEvidence = ($("#isDeleteEvidence").val() === "1" || $("#isDeleteEvidence").val() === 1);
var isDeleteAssesment = ($("#isDeleteAssesment").val() === "1" || $("#isDeleteAssesment").val() === 1);
var IsAddPerm = ($("#isAddPerm").val() === "1" || $("#isAddPerm").val() === 1);
var IsEditPerm = ($("#isEditPerm").val() === "1" || $("#isEditPerm").val() === 1);

var IsAddPermQt = ($("#isAddPermQuotation").val() === "1" || $("#isAddPermQuotation").val() === 1);
var IsEditPermQt = ($("#isEditPermQuotation").val() === "1" || $("#isEditPermQuotation").val() === 1);

var IsAddPermIn = ($("#isAddPermInvoice").val() === "1" || $("#isAddPermInvoice").val() === 1);
var IsEditPermIn = ($("#isEditPermInvoice").val() === "1" || $("#isEditPermInvoice").val() === 1);

var IsApprovePerem = ($("#isApprovePerm").val() === "1" || $("#isApprovePerm").val() === 1);
var action = ($("#md").val())
var view = ($("#View").val())
var userid = parseInt($("#userid").val(), 10);


$(document).ready(function () {
    formatCurrencyInElements('formatting');

    //Apply format related things
    formatreadonlydate();
    formatpagedates_asperpicker();

    //Show calender
    ApplyFlatPickerCalenderformat();

    // Assuming your elements have the class 'price'
    const elements = document.getElementsByClassName('price'); 
    // Iterate through the elements and attach the event listener to each
    for (const element of elements) {
        element.addEventListener('input', function (event) {
            let inputValue = event.target.value;

            // Check for multiple decimal points and allow only one
            if (inputValue.indexOf('.') !== inputValue.lastIndexOf('.')) {
                const lastDotIndex = inputValue.lastIndexOf('.');
                inputValue = inputValue.slice(0, lastDotIndex) + inputValue.slice(lastDotIndex + 1);
            }

            // Remove non-numeric characters, except for the decimal point
            inputValue = inputValue.replace(/[^0-9.]/g, '');

            // Remove leading zeros
            inputValue = inputValue.replace(/^0+/g, '0');

            // Limit to 20 digits before the decimal point
            const parts = inputValue.split('.');
            if (parts.length > 1) {
                parts[0] = parts[0].slice(0, 20);
                inputValue = parts.join('.');
            }

            // Limit to 6 decimal places
            const decimalParts = inputValue.split('.');
            if (decimalParts.length > 1) {
                decimalParts[1] = decimalParts[1].slice(0, 6);
                inputValue = decimalParts.join('.');
            }

            // Check if the length exceeds the limit (20 digits before + 1 decimal point + 6 digits after)
            if (inputValue.length > 27) {
                inputValue = inputValue.slice(0, 27);
            }

            event.target.value = inputValue;
        });
    }

    // Assuming your elements have the class 'valiadteint'
    const intelements = document.getElementsByClassName('valiadteint'); 
    // Iterate through the elements and attach the event listener to each
    for (const element of intelements) {
        element.addEventListener('input', function (event) {
            let inputValue = event.target.value;

            // Remove non-numeric characters
            inputValue = inputValue.replace(/[^0-9]/g, '');

            // Limit to 20 digits
            inputValue = inputValue.slice(0, 20);

            event.target.value = inputValue;
        });
    }

    $('.searchable-dropdown').select2();

    ErrorDev.hide();

    readsideNavToggle();
    
    makeFormReadOnly();

    //Toaster related things
    if (SuccessToaster !== "" && SuccessToaster !== null) {
        toastr.success(SuccessToaster);
    }

    if (ErrorToaster !== "" && ErrorToaster !== null) {
        toastr.error(ErrorToaster);
    }

    if (IsAddPerm === false) {
        $("#addNew").remove();
    }
    if (IsEditPerm === false) {
        $("#btnSaveEdit").remove();
        $("#btnSaveApprove").remove();
    }
    //if (IsApprovePerem === false) { 
    //    $("#btnSaveApprove").remove();
    //}
    if (IsAddPermQt === false) {
        $("#addNewQt").remove();
    }
    if (IsEditPermQt === false) {
        $("#btnSaveEditQt").remove();
    }

    if (IsAddPermIn === false) {
        $("#addNewIn").remove();
    }
    if (IsEditPermIn === false) {
        $("#btnSaveEditIn").remove();
    }

    // Default close accordan
    AccordianSettings(0); 

    hideLoader();

    Getactivenotifications(); 
});

function formatCurrencyInElements(className) {
    const elements = document.querySelectorAll(`.${className}`);
    elements.forEach(function (element) {
        if (element.tagName === 'INPUT') {
            const formatInput = (inputElement) => {
                const inputText = inputElement.value;
                const hasNegativeSign = inputText.includes('-');
                const numericValue = parseFloat(inputText.replace(/[^\d.]/g, ''));
                if (!isNaN(numericValue)) {
                    inputElement.value = (hasNegativeSign ? '-' : '') + accounting.formatMoney((numericValue), { symbol: '', precision: 6 });
                }
            };
            formatInput(element);

            element.addEventListener('blur', function () {
                formatInput(this);
            });
        } else {
            const elementText = element.textContent;
            const hasNegativeSign = elementText.includes('-');
            const numericValue = parseFloat(elementText.replace(/[^\d.]/g, ''));
            if (!isNaN(numericValue)) {
                element.textContent = (hasNegativeSign ? '-' : '') + accounting.formatMoney((numericValue), { symbol: '', precision: 2 });
            }
        }
    });
}

function Getactivenotifications() { 
    var url = "?userId=" + LogInUserId + "&valId=" + 0;
    ajaxServiceMethod(BaseURL + notificationsCnt + url, 'GET', NotificationCountSuccess, GetnotificationsError);
}

function GetnotificationsError(x, y, z) {
    toastr.error("Something failed for notification pull");
}

function NotificationCountSuccess(data) { 
    document.getElementById('notificationcount').textContent = data;
}

function makeFormReadOnly() {
    if ($("#PageViewMode").val() === "1") {
        var bdC = $(".bodyContent");
        var title = bdC.parent().find(".dashboardTitle");
        var humburg = bdC.parent().find(".hamburger span");

        bdC.find('input,select,textarea,checkbox').attr('readonly', true).attr('disabled', true).css('background-color', '#f2f2f2');
        bdC.find("[type=submit]").remove(); // Hide submit actions
        if (title !== null) {
            var newTitle = title.text().replace("Edit", "View");
            title.text(newTitle);
        }

        if (humburg !== null) {
            var newhumburg = humburg.text().replace("Edit", "View");
            humburg.text(newhumburg);
        }
    }
}
function DeleteFailure(x, y, z) {
    var _em = "";
    if (x.responseJSON !== undefined && x.responseJSON._Message !== undefined)
        _em = x.responseJSON._Message;

    toastr.error(ErrorMessage + ":" + _em);
}

//Attach the event handler to any element
$(document)
    .ajaxSend(function (event, jqxhr, settings) {
        $('.notification').click(function () {
            hideLoader();
        });
    })
    .ajaxStart(function () {
        //ajax request went so show the loading image
        /*$('#mainLoader').height("100vh").find("img").show();*/

        showLoader();
    })
    .ajaxStop(function () {
        //got response so hide the loading image
        /*$('#mainLoader').height("0").find("img").hide();*/
        hideLoader();
    })
    .ajaxError(function (event, jqxhr, settings, thrownError) {
        if (jqxhr.status == 401) {
            window.location.href = '/Home/AccessRestriction';
        }
    });


// ========== Start: Flatpicker Date format fixes ==========
function ApplyFlatPickerCalenderformat() { 
    flatpickr('.formatted-date-input', {
        dateFormat: flatDateformat,
    });
     
    //$('.formatted-date-input').flatpickr({
    //    dateFormat: flatDateformat,
    //});

    flatpickr('#TrnexpiryDate', {
        dateFormat: flatDateformat,
        minDate: 'today'
    });

    flatpickr('#DateOfBirth', {
        dateFormat: flatDateformat,
        maxDate: 'today'
    });

    if (action === "Add") {
        document.addEventListener('DOMContentLoaded', function () {
            flatpickr('.formatted-date-input', {
                dateFormat: flatDateformat,
                defaultDate: 'today'
            });
        });
    }

    //document.addEventListener('DOMContentLoaded', function () { 
    //});
} 

//Used to format footer dates
function formatreadonlydate() { 
    //var eln = elements === undefined ? '.formatted-td-date-input': elements;
    var tdElements = document.querySelectorAll('.formatted-td-date-input');
    tdElements.forEach(function (e) { 
        if (e.textContent !== undefined && e.textContent !== null && e.textContent !== "") {
            var originalDate = new Date(e.textContent);

            var datePart = originalDate.toLocaleString('en-GB', { day: 'numeric', month: 'short', year: 'numeric' });
            var timePart = originalDate.toLocaleString('en-US', { hour: 'numeric', minute: 'numeric', hour12: true }); 
            var formattedDate = datePart.replace(/\s/g, '-') + ' ' + timePart;
            e.textContent = formattedDate;
        }
    });
}

//Used to format page level dates
function formatpagedates_asperpicker(e) { 
    var tdElements = document.querySelectorAll('.formatted-date-input');   
    tdElements.forEach(function (e) {
        var _val = e.defaultValue;

        if (_val !== undefined && _val !== null && _val !== "" && _val !== "") {   
            var array = _val.split('-');  

            const month = getMonth(array[1]);  
            var formattedDate = array[0] + '-' + month + '-' + array[2];

            e.defaultValue = formattedDate;
            e.textContent = formattedDate;
        }
    });
}

function getMonth(e) { 
    var objDate = new Date();
    objDate.setDate(1);
    objDate.setMonth(e - 1); 

    var locale = "en-us", month = objDate.toLocaleString(locale, { month: "short" }); 
    return month;
}

// ========== End: Flatpicker Date format fixes ==========

function showLoader() {
    $('#loading-wrapper').show();
}

function hideLoader() {
    setTimeout(function () {
        $('#loading-wrapper').hide();
    }, 500);
}

function GetIntegerVal(val) {
    if (val === undefined || isNaN(parseInt(val))) {
        val = 0; // Set a default value when the input is not a valid integer.
    } else {
        val = parseInt(val);
    }

    return val;
}



// ======== Bind dropdowns ============
var dftSel = "-- select --";
var dftSel2 = "- -";

function BindDropdowns(_url, _controlID, _retrunProperty, _val) {
    $.ajax({
        type: Get,
        url: BaseURL + _url,
        "datatype": "json",
        success: function (response) {
            var _dd = _retrunProperty;
            _controlID.empty().append('<option selected="selected" value="0">' + dftSel + '</option>');
            for (var i = 0; i < response.length; i++) {
                _controlID.append($("<option></option>").val(response[i].id).html(response[i][_dd]));
            }
            if (_val != 0) {
                _controlID.val(_val);
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

function BindDropdownsForDictionary(_url, _controlID, _retrunProperty, _val) {
    $.ajax({
        type: Get,
        url: BaseURL + _url,
        "datatype": "json",
        success: function (response) {
            var _dd = _retrunProperty;
            _controlID.empty().append('<option selected="selected" value="0">' + dftSel + '</option>');
            for (var i = 0; i < response.values.length; i++) {
                _controlID.append($("<option></option>").val(response.values[i].id).html(response.values[i][_dd]));
            }
            if (_val != 0) {
                _controlID.val(_val);
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

function BindCountryCode() {
    $.ajax({
        type: "GET",
        url: BaseURL + CountryList,
        "datatype": "json",
        success: function (response) {
            for (var k = 0; k < addressLength; k++) {
                var CountryCode = $("#Addresses_" + k + "__PhoneExt");
                var AlternatePhoneExt = $("#Addresses_" + k + "__AlternatePhoneExt");

                var _val = $('#hdnPhoneExt_' + k).val();
                var _valAlternate = $('#hdnAlternatePhoneExt_' + k).val();

                CountryCode.empty().append('<option selected="selected" value="">' + dftSel2 + '</option>');
                AlternatePhoneExt.empty().append('<option selected="selected" value="0">' + dftSel2 + '</option>');


                for (var i = 0; i < response.length; i++) {
                    CountryCode.append($("<option></option>").val(response[i].isdCountryCode).html(response[i].isdCountryCode));
                    AlternatePhoneExt.append($("<option></option>").val(response[i].isdCountryCode).html(response[i].isdCountryCode));
                }
                if (_val != "" || _valAlternate != "") {
                    CountryCode.val(_val);
                    AlternatePhoneExt.val(_valAlternate);
                }
            }
            for (var j = 0; j < contactLength; j++) {
                var ContactMobileExt = $("#Contacts_" + j + "__MobileExt");
                var _valMobileExt = $('#hdnMobileExt_' + j).val();

                ContactMobileExt.empty().append('<option selected="selected" value="0">' + dftSel2 + '</option>');
                for (var i = 0; i < response.length; i++) {
                    ContactMobileExt.append($("<option></option>").val(response[i].isdCountryCode).html(response[i].isdCountryCode));
                }
                if (_valMobileExt != "") {
                    ContactMobileExt.val(_valMobileExt);
                }
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

function BindCountryIsd() {
    $.ajax({
        type: "GET",
        url: BaseURL + CountryList,
        "datatype": "json",
        success: function (response) {
            for (var k = 0; k < addressLength; k++) {
                var CountryCode = $("#Addresses_" + k + "__PhoneExt");
                var AlternatePhoneExt = $("#Addresses_" + k + "__AlternatePhoneExt");

                var _val = $('#hdnPhoneExt_' + k).val();
                var _valAlternate = $('#hdnAlternatePhoneExt_' + k).val();

                CountryCode.empty().append('<option selected="selected" value="">' + dftSel2 + '</option>');
                AlternatePhoneExt.empty().append('<option selected="selected" value="0">' + dftSel2 + '</option>');


                for (var i = 0; i < response.length; i++) {
                    CountryCode.append($("<option></option>").val(response[i].isdCountryCode).html(response[i].isdCountryCode));
                    AlternatePhoneExt.append($("<option></option>").val(response[i].isdCountryCode).html(response[i].isdCountryCode));
                }
                if (_val != "" || _valAlternate != "") {
                    CountryCode.val(_val);
                    AlternatePhoneExt.val(_valAlternate);
                }
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


// ======== IsActive list page color ============
function GetActiveFlagCss(data) {
    var dd = "";
    if (data === 1 || data === true) {
        dd = "<span class='tableStatus green'>Yes</span>";
    } else {
        dd = "<span class='tableStatus red'>No</span>";
    }
    return dd;
}
function GetIdLinkCss(url, id) {
    var dd = "<a class='userPic' href='" + url + id + "'>" + id + "</a>";
    return dd;
}




// ======== Left menu hide/show with Cache ============
function sideNavToggle() {
    var x = document.getElementById("sideNav");
    var dsi = "none";
    if (x.style.display === "none") {
        dsi = "block";
    }

    x.style.display = dsi;
    localStorage.setItem(ShowMenuCache, dsi);
}
function readsideNavToggle() {
    var x = document.getElementById("sideNav");
    var curdsi = localStorage.getItem(ShowMenuCache);

    if (curdsi !== null)
        x.style.display = curdsi;
}

function profileMenu() {
    var x = document.getElementById("profileMenu");
    if (x.style.display === "none") {
        x.style.display = "block";
    } else {
        x.style.display = "none";
    }
} 

function showValuationActions() {
    var x = document.getElementById("ValuationActions");
    if (x.style.display === "none") {
        x.style.display = "block";
    } else {
        x.style.display = "none";
    }
} 


// ======== Start: Validation form things ============ 
$(document).on('click', 'form button[type=submit]', function (e) { 
    showLoader();

    //Open Accordians
    AccordianSettings(1);

    setTimeout(function () {
        ValidateTabAndPage();
    }, 500);
});

function ValidateTabAndPage() {
    var errors = $(".input-validation-error");
    var err = "";

    var msg_1 = $(".input-validation-error").parent().closest('div.tabcontent').attr("title");
    if (msg_1 !== undefined) {
        err += "<li>" + msg_1 + "</li>";
    }
    else if (errors.length > 0) {
        err += "<li>Fill all mandate fields with valid data.</li>";
    }

    if (err !== "") {
        FormattedError(err); 
    }
}

function FormattedError(err) {
    if (err !== undefined && err !== "") {
        ErrorDev.empty().show();

        ErrorDev.append('<button type="button" class="close" data-dismiss="alert" aria-label="Close"> <span onclick="CloseErrorBanner();" aria-hidden="true">×</span></button>' +
            'Please fill all mandatory fields and resolve error(s) in page / tab(if applicable).: <ul>' + err + '</ul>');

        hideLoader();
        scrollToTop();
    }
}

function CloseErrorBanner() {
    ErrorDev.hide();
}

// ======== End: Validation form things ============


// ======== Start: accordian things ============

// accordian function here  
function accordianToggle(header) {
    const item = header.nextElementSibling;
    if (item.style.display === 'block') {
        item.style.display = 'none';
    } else {
        item.style.display = 'block';
    }

    //if (item.style.height === 'auto') {
    //    item.style.height = 0;
    //} else {
    //    item.style.height = 'auto';
    //}
}

// close/show accordian
function AccordianSettings(show) {
    $('.accordianDetails').each(function (i) { 
        const item = $(this)[0].nextElementSibling;
        //item.style.height = 0;
        item.style.display = show === 1 ? 'block' : 'none';
    });
} 

// ======== End: accordian things ============



// ======== Start: Dynamic textboxes append ============ 
let blockCount = 1;

function addDynamicTextbox() {
    const inputPropField = document.querySelector(".addPropertyInputDynamic");
    const uniqueId = `status-${blockCount}`;

    const newBlock = document.createElement("div");
    newBlock.className = "inputFieldProp";
    newBlock.innerHTML = '<label for=""><input type="text" id="0" placeholder="enter description"></label>' +
        '<img src="../assets/minus-icon.svg" alt="minus-icon" class="minus-icon cursor-pointer" onclick="removeDynamicTextbox(this)">';

    inputPropField.appendChild(newBlock);
    blockCount++;
}

function removeDynamicTextbox(element) {
    const newAddedDiv = element.parentElement;
    newAddedDiv.remove();
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
//document.getElementById("defaultOpen").click();

function removeParentDiv(element) {
    const parentDiv = element.closest('.roundBorderBox');
    if (parentDiv) {
        parentDiv.remove();
    }
}

function removeParentDivAddress(element) {
    const parentDivAdd = element.closest(".addMoreAddress");
    if (parentDivAdd) {
        parentDivAdd.remove()
    }
}

// ======== End: Dynamic textboxes append ============


// ======== Start:  Scroller for page ============ 
window.onscroll = function () {
    showScrollToTopButton();
};

function showScrollToTopButton() {
    const button = document.getElementById("scrollToTop");
    if (document.body.scrollTop > 20 || document.documentElement.scrollTop > 20) {
        button.style.display = "block";
    } else {
        button.style.display = "none";
    }
}

// Scroll to the top when the button is clicked
function scrollToTop() {
    document.body.scrollTop = 0;
    document.documentElement.scrollTop = 0;
}
 


//Remove parent dynamic created page
function removeParentDiv(element) {
    const parentDiv = element.closest('.roundBorderBox');
    if (parentDiv) {
        parentDiv.remove();
    }
}


function assignToggleFilter() {
    var x = document.getElementById("assignToggleFilter");
    if (x.style.display === "none") {
        x.style.display = "block";
    } else {
        x.style.display = "none";
    }
}

function hideSearchToggle() {
    var x = document.getElementById("assignToggleFilter");
    x.style.display = "none";
}

function markActiveMenu(r) {
}

function validateFileSize(input) {
    const maxSizeInBytes = 5 * 1024 * 1024; // 5MB
    const files = input.files;

    for (let i = 0; i < files.length; i++) {
        if (files[i].size > maxSizeInBytes) {
            const fileName = files[i].name;
            toastr.error(`File "${fileName}" exceeds max limit of 5MB, please choose a smaller file(s).`);
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

// ======== End:  Scroller for page  ============

// ======== Start: Searchable drop down Validation ============


//$('#PropertySubTypeId').parent().find('.field-validation-error')

$('.searchable-dropdown').on('change', function () {
    var selectval = $(this).val();
    var valcntrl = $(this).parent().find('.field-validation-error');

  //  console.log(val1);
    if (selectval == 0 || selectval === "" || selectval === undefined) { 
        valcntrl.show();
    } else {
        valcntrl.hide();
    }
});

// Add an additional event listener for when the dropdown loses focus
$('.searchable-dropdown').on('blur', function () {
    var selectval = $(this).val();
    var valcntrl = $(this).parent().find('.field-validation-error');

    if (selectval == 0 || selectval === "" || selectval === undefined) {
        valcntrl.show();
    } else {
        valcntrl.hide();
    }
});


// ======== End:  SSearchable drop down Validation ============
