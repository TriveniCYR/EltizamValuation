
$(document).ready(function () {
    BindClientType();
    BindCountry();
    BindState();
    BindCity();

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

    roundBorderBox.parentElement.insertBefore(clonedDiv, roundBorderBox.nextSibling);

    const inputFields = clonedDiv.querySelectorAll('input');
    inputFields.forEach((input) => {
        input.value = '';
    });
}

// more address field on click
function addMoreAddress() {
    const addMoreAddressBox = document.querySelector('.addMoreAddress');
    const clonedDiv = addMoreAddressBox.cloneNode(true);

    const minusDiv = document.createElement('div');
    minusDiv.className = 'text-right';
    minusDiv.innerHTML = `
    <img src="../assets/minus-icon.svg" alt="minus-icon" class="minus-icon cursor-pointer" onclick="removeParentDivAddress(this)">
        `;
    clonedDiv.insertBefore(minusDiv, clonedDiv.firstChild);

    addMoreAddressBox.parentElement.insertBefore(clonedDiv, addMoreAddressBox.nextSibling);

    const inputFields = clonedDiv.querySelectorAll('input');
    inputFields.forEach((input) => {
        input.value = '';
    });
}
function removeParentDivAddress(element) {
    const parentDivAdd = element.closest(".addMoreAddress");
    if (parentDivAdd) {
        parentDivAdd.remove()
    }
}



function BindClientType() {
    debugger
    
    var ClientType = $("#ClientTypeId");
    var _val = $('#hdnClientType').val();
    var _rpname = "clientType";

    BindDropdowns(ClientTypeList, ClientType, _rpname, _val);
}

function BindCountry() {
    var Country = $("#Address_CountryId");
    var _val = $('#hdnCountry').val();
    var _rpname = "countryName";

    BindDropdowns(CountryList, Country, _rpname, _val);
    
   
    //$.ajax({
    //    type: "GET",
    //    url: $('#hdnBaseURL').val() + CountryList,
    //    "datatype": "json",
    //    success: function (response) {
    //        ;
    //        Country.empty().append('<option selected="selected" value="0">Please select</option>');
    //        for (var i = 0; i < response.length; i++) {
    //            Country.append($("<option></option>").val(response[i].id).html(response[i].countryName));
    //        }
    //        if ($('#hdnCountry').val() != 0) {
    //            Country.val($('#hdnCountry').val());
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

function BindState() {
    var State = $("#Address_StateId");
    var _val = $('#hdnState').val();
    var _rpname = "stateName";

    BindDropdowns(StateList, State, _rpname, _val);

    //$.ajax({
    //    type: "GET",
    //    url: $('#hdnBaseURL').val() + StateList,
    //    "datatype": "json",
    //    success: function (response) {
    //        ;
    //        State.empty().append('<option selected="selected" value="0">Please select</option>');
    //        for (var i = 0; i < response.length; i++) {
    //            State.append($("<option></option>").val(response[i].id).html(response[i].stateName));
    //        }
    //        if ($('#hdnState').val() != 0) {
    //            State.val($('#hdnState').val());
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

function BindCity() {
    var City = $("#Address_CityId");
    var _val = $('#hdnCity').val();
    var _rpname = "cityName";

    BindDropdowns(CityList, City, _rpname, _val);

    //$.ajax({
    //    type: "GET",
    //    url: $('#hdnBaseURL').val() + CityList,
    //    "datatype": "json",
    //    success: function (response) {
    //        ;
    //        City.empty().append('<option selected="selected" value="0">Please select</option>');
    //        for (var i = 0; i < response.length; i++) {
    //            City.append($("<option></option>").val(response[i].id).html(response[i].cityName));
    //        }
    //        if ($('#hdnCity').val() != 0) {
    //            City.val($('#hdnCity').val());
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

