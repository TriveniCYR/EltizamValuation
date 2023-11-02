//Use this for entire project to bind the data 
var BaseURL = $('#hdnBaseURL').val();
var Post = 'POST';
var Get = 'GET';
var Delete = 'DELETE';
var _successToaster = $("#successToaster").val();
var _errorToaster = $("#errorToaster").val();
var ErrorDev = $("#errorBanner");
var ShowMenuCache = "showMenuCache";

$(document).ready(function () {
    ErrorDev.hide();
    readsideNavToggle();
    hideLoader();

    //Toaster related things
    if (_successToaster !== "" && _successToaster !== null) {
        toastr.success(_successToaster);
    }

    if (_errorToaster !== "" && _errorToaster !== null) {
        toastr.error(_errorToaster);
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

function showLoader() {
    $('#loading-wrapper').show();
}

function hideLoader() {
    setTimeout(function () {
        $('#loading-wrapper').hide();
    }, 500);
}
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

function GetActiveFlagCss(data) {
    var dd = "";
    if (data === 1 || data === true) {
        dd = "<span class='tableStatus green'>Yes</span>";
    } else {
        dd = "<span class='tableStatus red'>No</span>";
    }
    return dd;
}

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

function GetIdLinkCss(url, id) {
    var dd = "<a class='userPic' href='" + url + id + "'>" + id + "</a>";
    return dd;
}


//-----Validation form things ------------- 
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
        err += "<li>" + msg_1 + "<li>";
    }
    else if (errors.length > 0) {
        err += "<li>Fill all mandate fields with valid data.<li>";
    }

    if (err !== "") {
        FormattedError(err);
    }
}

function FormattedError(err) {
    if (err !== undefined && err !== "") {
        ErrorDev.empty().show();

        ErrorDev
            .append('<button type="button" class="close" data-dismiss="alert" aria-label="Close"> <span onclick="CloseErrorBanner();" aria-hidden="true">×</span></button>')
            .append("Please fill all mandatory fields and resolve error(s) in page/tab (if applicable).: <ul>" + err + "<ul>");

        hideLoader();
    }
}

function CloseErrorBanner() {
    ErrorDev.hide();
}

//-----Validation form things - END/ -------------