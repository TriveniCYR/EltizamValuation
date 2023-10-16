$(document).ready(function () {
    SetupRoleTable();

    if (StatusMessage != '') {
        if (StatusMessage.includes('Successful')) {
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
    debugger
    BindCountry();
    BindState();
    BindCity();
    ajaxServiceMethod($('#hdnBaseURL').val() + GetLocationByIdUrl + "/" + id, 'GET', GetLocationByIdSuccess, GetLocationByIdError);
}
function GetLocationByIdSuccess(data) {
    try {
        debugger
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
        //if (!data._object.isActive) {
        //    $('#popup-editProp-overlay #IsActive').prop('checked', false);
        //}
        //else {
        //    $('#popup-editProp-overlay #IsActive').prop('checked', true);
        //}
       // $('#popup-editRole-overlay #ClientTypeTitle').html(UpdateLabel);
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
        url: $('#hdnBaseURL').val() + CountryList,
        "datatype": "json",
        success: function (response) {
            ;
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
        url: $('#hdnBaseURL').val() + StateList,
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

    //var CityList = "@Eltizam.Web.Helpers.APIURLHelper.GetCityList";
    var City = $("#CityId") + CityList;
    $.ajax({
        type: "GET",
        url: $('#hdnBaseURL').val() + CityList,
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