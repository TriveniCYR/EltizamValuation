//Use this for entire project to bind the data 
var BaseURL = $('#hdnBaseURL').val();
var Post = 'POST';
var Get = 'GET';
var Delete = 'DELETE';
var _successToaster = $("#successToaster").val();
var _errorToaster = $("#errorToaster").val();

$(document).ready(function () {
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
    }, 3000);
}

function BindDropdowns(_url, _controlID, _retrunProperty, _val) {
    $.ajax({
        type: "GET",
        url: BaseURL + _url,
        "datatype": "json",
        success: function (response) {
            var _dd = _retrunProperty;
            _controlID.empty().append('<option selected="selected" value="0">Please select</option>');
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