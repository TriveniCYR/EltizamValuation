
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
 

$(document).ready(function () {
    if ($("#hdnPropertyType").val() != 0) {
        BindPropertySub($("#hdnPropertyType").val());
    }
    BindProperty();
    BindOwnership();
    BindUnitType();
    BindFurnished();
    BindCountry();
    var countryId = $('#hdnCountry').val();
    if (countryId != null || countryId != 0) {
        BindState(countryId);
        var stateId = $('#hdnState').val();
        BindCity(stateId);
    }
    $('#BuildUpAreaSqFt').keypress(function (e) {
        if ($('#BuildUpAreaSqFt').val() == '' && e.which == 48) {
            return false;
        }
        else {
            var charCode = (e.which) ? e.which : event.keyCode;
            if (String.fromCharCode(charCode).match(/[^0-9]/g)) {
                return false;
            }
        }
    });
    $('#BuildUpAreaSqMtr').keypress(function (e) {
        if ($('#BuildUpAreaSqMtr').val() == '' && e.which == 48) {
            return false;
        }
        else {
            var charCode = (e.which) ? e.which : event.keyCode;
            if (String.fromCharCode(charCode).match(/[^0-9]/g)) {
                return false;
            }
        }
    });
    $('#AgeOfConstruction').keypress(function (e) {
        if ($('#AgeOfConstruction').val() == '' && e.which == 48) {
            return false;
        }
        else {
            var charCode = (e.which) ? e.which : event.keyCode;
            if (String.fromCharCode(charCode).match(/[^0-9]/g)) {
                return false;
            }
        }
    });
    $('#PropertyDetail_Pincode').keypress(function (e) {
        if ($('#PropertyDetail_Pincode').val() == '' && e.which == 48) {
            return false;
        }
        else {
            var charCode = (e.which) ? e.which : event.keyCode;
            if (String.fromCharCode(charCode).match(/[^0-9]/g)) {
                return false;
            }
        }
    });
    $('#PropertyDetail_Longitude').on("keypress", function (e) {
        var keypress = e.keyCode || e.which || e.charCode;
        var key = String.fromCharCode(keypress);
        var regEx = /^[0-9]{0,3}(.[0-9]{0,6})?$/;

        var txt = $(this).val() + key;
        if (!regEx.test(txt)) {
            if (keypress != 8) {
                e.preventDefault();
            } else {
            }
        } else {

        }
    });

    $('#PropertyDetail_Latitude').on("keypress", function (e) {
        var keypress = e.keyCode || e.which || e.charCode;
        var key = String.fromCharCode(keypress);
        var regEx = /^[0-9]{0,3}(.[0-9]{0,6})?$/;

        var txt = $(this).val() + key;
        if (!regEx.test(txt)) {
            if (keypress != 8) {
                e.preventDefault();
            } else {
            }
        } else {

        }
    });
});

function BindProperty() {
    //alert("hello");
   // debugger

    var Property = $("#PropertyTypeId");
    var _val = $('#hdnPropertyType').val();
    var _rpname = "propertyType";

    BindDropdowns(PropertyList, Property, _rpname, _val);
    //$.ajax({
    //    type: "GET",
    //    url: $('#hdnBaseURL').val() + PropertyList,
    //    "datatype": "json",
    //    success: function (response) {
    //        debugger;
    //        Property.empty().append('<option selected="selected" value="0">Please select</option>');
    //        for (var i = 0; i < response.length; i++) {
    //            Property.append($("<option></option>").val(response[i].id).html(response[i].propertyType));
    //        }
    //        if ($('#hdnPropertyType').val() != 0) {
    //            Property.val($('#hdnPropertyType').val());
    //        }
    //    },
    //    failure: function (response) {
    //        alert(response.responseText);
    //    },
    //    error: function (response) {
    //        alert(response.responseText);
    //        $("#loader").hide();
    //    }
    //});
}

function BindPropertySub(id) {
   // debugger;
    //alert("hello");

    var PropertySubType = $("#PropertySubTypeId");
    var _val = $('#hdnPropertySubType').val();
    var _rpname = "propertySubType";

    BindDropdowns(PropertyByIdSubType + '/' + id, PropertySubType, _rpname, _val);
    // $.ajax({
    //     type: "GET",
    //     url: $('#hdnBaseURL').val() + PropertyByIdSubType + '/' + id,
    //     "datatype": "json",
    //     success: function (response) {
    //         debugger;

    //         PropertySubType.empty().append($("<option></option>").val(response._object.id).html(response._object.propertySubType));
    //         if ($('#hdnPropertySubType').val() != 0) {
    //             PropertySubType.val($('#hdnPropertySubType').val());
    //         }
    //     },
    //     failure: function (response) {
    //         alert(response.responseText);
    //     },
    //     error: function (response) {
    //         alert(response.responseText);
    //         $("#loader").hide();
    //     }
    // });
}

function BindClient() {
    //debugger;
    //alert("hello");

    var Client = $("#ClientTypeId");
    var _val = $('#hdnClientType').val();
    var _rpname = "clientType";

    BindDropdowns(ClientTypeList, Client, _rpname, _val);
    //$.ajax({
    //    type: "GET",
    //    url: $('#hdnBaseURL').val() + ClientTypeList,
    //    "datatype": "json",
    //    success: function (response) {
    //        debugger;
    //        Client.empty().append('<option selected="selected" value="0">Please select</option>');
    //        for (var i = 0; i < response._object.length; i++) {
    //            Client.append($("<option></option>").val(response._object[i].id).html(response._object[i].clientType));
    //        }
    //        if ($('#hdnClientType').val() != 0) {
    //            Client.val($('#hdnClientType').val());
    //        }
    //    },
    //    failure: function (response) {
    //        alert(response.responseText);
    //    },
    //    error: function (response) {
    //        alert(response.responseText);
    //        $("#loader").hide();
    //    }
    //});
}

function BindOwnership() {
    //debugger;
    //alert("hello");

    var OwnershipType = $("#OwnershipTypeId");
    var _val = $('#hdnOwnershipType').val();
    var _rpname = "ownershipType";

    BindDropdowns(OwnershipTypeList, OwnershipType, _rpname, _val);
    //$.ajax({
    //    type: "POST",
    //    url: $('#hdnBaseURL').val() + OwnershipTypeList,
    //    "datatype": "json",
    //    success: function (response) {
    //        debugger;
    //        OwnershipType.empty().append('<option selected="selected" value="0">Please select</option>');
    //        for (var i = 0; i < response.data.length; i++) {
    //            OwnershipType.append($("<option></option>").val(response.data[i].id).html(response.data[i].ownershipType));
    //        }
    //        if ($('#hdnOwnershipType').val() != 0) {
    //            OwnershipType.val($('#hdnOwnershipType').val());
    //        }
    //    },
    //    failure: function (response) {
    //        alert(response.responseText);
    //    },
    //    error: function (response) {
    //        alert(response.responseText);
    //        $("#loader").hide();
    //    }
    //});
}
function BindUnitType() {
    var UnitType = $("#UnitType");
    UnitType.empty().append('<option selected="selected" value="0">Please select</option>');
    UnitType.append($("<option></option>").val('1BHK').html('1BHK'));
    UnitType.append($("<option></option>").val('2BHK').html('2BHK'));
    UnitType.append($("<option></option>").val('3BHK').html('3BHK'));
    if ($('#hdnUnitType').val() != 0) {
        UnitType.val($('#hdnUnitType').val());
    }
}

function BindFurnished() {
    var Furnished = $("#Furnished");
    Furnished.empty().append('<option selected="selected" value="0">Please select</option>');
    Furnished.append($("<option></option>").val(1).html('Yes'));
    Furnished.append($("<option></option>").val(0).html('No'));
    if ($('#hdnFurnished').val() != 0) {
        Furnished.val($('#hdnFurnished').val());
    }
}


function BindCountry() {
    debugger
    var Country = $("#PropertyDetail_CountryId");
    var _val = $('#hdnCountry').val();
    var _rpname = "countryName";
    BindDropdowns(CountryList, Country, _rpname, _val);
}

function BindState(id) {
    var State = $("#PropertyDetail_StateId");
    var _val = $('#hdnState').val();
    var _rpname = "stateName";

    BindDropdowns(StateList + '/' + id, State, _rpname, _val);
}

function BindCity(id) {

    var City = $("#PropertyDetail_CityId");
    var _val = $('#hdnCity').val();
    var _rpname = "cityName";
    BindDropdowns(CityList + '/' + id, City, _rpname, _val);
}