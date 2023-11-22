//Use this for entire project to bind the data 
var BaseURL = $('#hdnAPIURL').val();
var setDefaultOrder = [0, 'desc'];


var LogInUserId = $("LogInUserId").val() ?? 1;
var Post = 'POST';
var Get = 'GET';
var Delete = 'DELETE';

var SuccessToast = $("#successToaster");
var ErrorToast = $("#errorToaster");
var SuccessToaster = SuccessToast.val();
var ErrorToaster = ErrorToast.val();
var ErrorDev = $("#errorBanner");

var ShowMenuCache = "showMenuCache";

var SucessMsg = "Request saved successfully.";
var ErrorMsg = "Some error occurred while processing request.";
var DeleteAccessDenied = "Delete permission not granted.";

var IsDeletePerm = ($("#isDeletePerm").val() === "1" || $("#isDeletePerm").val() === 1);
var IsAddPerm = ($("#isAddPerm").val() === "1" || $("#isAddPerm").val() === 1);   
var IsEditPerm = ($("#isEditPerm").val() === "1" || $("#isEditPerm").val() === 1); 

var IsAddPermQt = ($("#isAddPermQuotation").val() === "1" || $("#isAddPermQuotation").val() === 1);
var IsEditPermQt = ($("#isEditPermQuotation").val() === "1" || $("#isEditPermQuotation").val() === 1);

var IsAddPermIn = ($("#isAddPermInvoice").val() === "1" || $("#isAddPermInvoice").val() === 1);
var IsEditPermIn = ($("#isEditPermInvoice").val() === "1" || $("#isEditPermInvoice").val() === 1);

var IsApprovePerem = ($("#isApprovePerm").val() === "1" || $("#isApprovePerm").val() === 1);  

$(document).ready(function () {
    ErrorDev.hide();
    readsideNavToggle();
    hideLoader(); 
    formatreadonlydate();
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
        dateFormat: 'd-M-Y',
    });
});

function formatreadonlydate () {
    var tdElements = document.querySelectorAll('.formatted-td-date-input');

    tdElements.forEach(function (tdElement) {
        var originalDate = new Date(tdElement.textContent);
        var datePart = originalDate.toLocaleString('en-GB', { day: 'numeric', month: 'short', year: 'numeric' });
        var timePart = originalDate.toLocaleString('en-US', { hour: 'numeric', minute: 'numeric', hour12: true });

        var formattedDate = datePart + ' ' + timePart;
        tdElement.textContent = formattedDate.replace(/\s/g, '-').toLowerCase();
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
function BindDropdowns(_url, _controlID, _retrunProperty, _val) {
    $.ajax({
        type: Get,
        url: BaseURL + _url,
        "datatype": "json",
        success: function (response) {
            var _dd = _retrunProperty;
            _controlID.empty().append('<option selected="selected" value="0">-- select --</option>');
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
            _controlID.empty().append('<option selected="selected" value="0">-- select --</option>');
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

// ======== End:  Scroller for page ============ 