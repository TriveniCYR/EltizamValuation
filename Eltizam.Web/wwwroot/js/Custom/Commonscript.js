//Use this for entire project to bind the data


//Global variables
var LogInUserId = $("#LogInUserId").val() ?? 1;

var BaseURL = $('#hdnAPIURL').val();
var setDefaultOrder = [0, 'desc']; 
var ShowMenuCache = "showMenuCache";
var defaultDateFormat = 'DD-MMM-YYYY hh:mm A';

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
var SucessMsg = "Request saved successfully.";
var ErrorMsg = "Some error occurred while processing request.";
var DeleteAccessDenied = "Delete permission not granted.";


//Permission related things
var IsDeletePerm = ($("#isDeletePerm").val() === "1" || $("#isDeletePerm").val() === 1);
var isDeleteSite = ($("#isDeleteSite").val() === "1" || $("#isDeleteSite").val() === 1);
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
    ErrorDev.hide();
    readsideNavToggle();
    hideLoader();
    formatreadonlydate();
    if ($("#isView").val() === "1") {
        locationreadOnlyForm();
    }
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
    }
    if (IsApprovePerem === false) {

        $("#btnSaveApprove").remove();
    }



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
});

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

document.addEventListener('DOMContentLoaded', function () {
    flatpickr('.formatted-date-input', {
        dateFormat: 'd-M-Y'
    });
});

if (action === "Add") {
    document.addEventListener('DOMContentLoaded', function () {
        flatpickr('.formatted-date-input', {
            dateFormat: 'd-M-Y',
            defaultDate: 'today'

        });
    }
)}

function formatreadonlydate() {
    var tdElements = document.querySelectorAll('.formatted-td-date-input');

    tdElements.forEach(function (tdElement) {
        var originalDate = new Date(tdElement.textContent);
        var datePart = originalDate.toLocaleString('en-GB', { day: 'numeric', month: 'short', year: 'numeric' });
        var timePart = originalDate.toLocaleString('en-US', { hour: 'numeric', minute: 'numeric', hour12: true });

        var formattedDate = datePart.replace(/\s/g, '-') + ' ' + timePart;
        tdElement.textContent = formattedDate
    });
}

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
    debugger
        $.ajax({
            type: "GET",
            url: BaseURL + CountryList,
            "datatype": "json",
            success: function (response) {
                for (var k = 0; k < addressLength; k++) {
                    debugger
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




// ======== Start: Validation form things ============
$(document).on('click', 'form button[type=submit]', function (e) {
    showLoader();

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

// accordian here
function accordianToggle(header) {
    const item = header.nextElementSibling;
    if (item.style.height === 'auto') {
        item.style.height = 0;
    } else {
        item.style.height = 'auto';
    }
} 

//Remove parent dynamic created page
function removeParentDiv(element) {
    const parentDiv = element.closest('.roundBorderBox');
    if (parentDiv) {
        parentDiv.remove();
    }
}

// ======== End:  Scroller for page ============ 