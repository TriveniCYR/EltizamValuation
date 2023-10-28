
document.addEventListener("DOMContentLoaded", () => {
    const addResourceRedirection = document.getElementById("addResourceRedirection");

    addResourceRedirection.addEventListener('click', () => {
        window.location.href = 'file:///C:/Users/User/OneDrive/Desktop/workspace/Eltizam/Master_Resource/addResource.html'
    });
});

$(document).ready(function () {
    BindClientType();
    BindCountry();
    BindState();
    BindCity();
    BindGender();
});

function profileTab(evt, cityName) {
    var i, tabcontent, tablinks;
    tabcontent = document.getElementsByClassName("tabcontent");
    for (i = 0; i < tabcontent.length; i++) {
        tabcontent[i].style.display = "none";
    }
    tablinks = document.getElementsByClassName("tablinks");
    for (i = 0; i < tablinks.length; i++) {
        tablinks[i].className = tablinks[i].className.replace(" active", "");
    }
    document.getElementById(cityName).style.display = "block";
    evt.currentTarget.className += " active";
}
document.getElementById("defaultOpen").click();

function sideNavToggle() {
    var x = document.getElementById("sideNav");
    if (x.style.display === "none") {
        x.style.display = "block";
    } else {
        x.style.display = "none";
    }
}

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
    //$.ajax({
    //    type: "GET",
    //    url: $('#hdnBaseURL').val() + ClientTypeList,
    //    "datatype": "json",
    //    success: function (response) {
    //        ClientType.empty().append('<option selected="selected" value="0">Please select</option>');
    //        for (var i = 0; i < response.length; i++) {
    //            ClientType.append($("<option></option>").val(response[i].id).html(response[i].clientType));
    //        }
    //        if ($('#hdnClientType').val() != 0) {
    //            ClientType.val($('#hdnClientType').val());
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

function BindCountry() {

    
    var Country = $("#Address_CountryId");
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

   
    var State = $("#Address_StateId");
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

  
    var City = $("#Address_CityId");
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
    });
}
