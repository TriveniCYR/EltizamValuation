
$(document).ready(function () {
    BindDepartment();
    BindDesignation();
    BindRole();
    BindResourceType();
    BindCountry();
    BindCountryCode();

    var countryId = $('#hdnCountry').val();
    if (countryId != null || countryId != 0) {
        BindState(countryId);
        var stateId = $('#hdnState').val();
        BindCity(stateId);
    }
    BindGender();

});

function BindDepartment() {
    var Department = $("#DepartmentId");
    var _val = $('#hdnDeparment').val();
    var _rpname = "department";

    BindDropdowns(DepartmentList, Department, _rpname, _val);
}
function BindDesignation() {
    var Designation = $("#DesignationId");
    var _val = $('#hdnDesignation').val();
    var _rpname = "designation";

    BindDropdowns(DesignationList, Designation, _rpname, _val);
}

function BindRole() {
 
    var Role = $("#RoleId");
    var _val = $('#hdnRole').val();
    var _rpname = "roleName";

    BindDropdowns(RoleList, Role, _rpname, _val);
}

function BindResourceType() { 
    var ResourceType = $("#ResourceId");
    var _val = $('#hdnResourceType').val();
    var _rpname = "resourceType";
    BindDropdowns(ResourceTypeList, ResourceType, _rpname, _val);
}

function BindCountry() { 
    var Country = $("#Address_CountryId");
    var _val = $('#hdnCountry').val();
    var _rpname = "countryName";
    BindDropdowns(CountryList, Country, _rpname, _val);
}

function BindState(id) {
    var State = $("#Address_StateId");
    var _val = $('#hdnState').val();
    var _rpname = "stateName";

    BindDropdowns(StateList + '/' + id, State, _rpname, _val);
}

function BindCity(id) {

    var City = $("#Address_CityId");
    var _val = $('#hdnCity').val();
    var _rpname = "cityName";
    BindDropdowns(CityList + '/' + id, City, _rpname, _val);
}
function BindGender() {
    var Gender = $("#Gender");
    Gender.empty().append('<option selected="selected" value="0">Please select</option>');
    Gender.append($("<option></option>").val('M').html('Male'));
    Gender.append($("<option></option>").val('F').html('Female'));
    if ($('#hdnGender').val() != 0) {
        Gender.val($('#hdnGender').val());
    }
}
function BindCountryCode() {
    var CountryCode = $("#Address_PhoneExt");
    var AlternatePhone = $("#Address_AlternatePhoneExt");
    var _val = $('#hdnPhoneExt').val();
    var _valAlter = $('#hdnAlternatePhoneExt').val();

    $.ajax({
        type: "GET",
        url: BaseURL + CountryList,
        "datatype": "json",
        success: function (response) {
           
            CountryCode.empty().append('<option selected="selected" value="">select</option>');
            AlternatePhone.empty().append('<option selected="selected" value="">select</option>');
            for (var i = 0; i < response.length; i++) {
                CountryCode.append($("<option></option>").val(response[i].isdCountryCode).html(response[i].isdCountryCode));
                AlternatePhone.append($("<option></option>").val(response[i].isdCountryCode).html(response[i].isdCountryCode));
            }
            if (_val != "" || _valAlter != "") {
                CountryCode.val(_val);
                AlternatePhone.val(_valAlter);
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
$('#Address_AlternatePhone').keypress(function (e) {
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
$('#Qualification_YearOfInstitute').keypress(function (e) {
    if ($('#Qualification_YearOfInstitute').val() == '' && e.which == 48) {
        return false;
    }
    else {
        var charCode = (e.which) ? e.which : event.keyCode;
        if (String.fromCharCode(charCode).match(/[^0-9]/g)) {
            return false;
        }
    }
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

function sideNavToggle() {
    var x = document.getElementById("sideNav");
    if (x.style.display === "none") {
        x.style.display = "block";
    } else {
        x.style.display = "none";
    }
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
    minusDiv.innerHTML = `<img src="../assets/minus-icon.svg" alt="minus-icon" class="minus-icon cursor-pointer" onclick="removeParentDivAddress(this)">
                                                                    `;
    clonedDiv.insertBefore(minusDiv, clonedDiv.firstChild);

    addMoreAddressBox.parentElement.insertBefore(clonedDiv, addMoreAddressBox.nextSibling);

    const inputFields = clonedDiv.querySelectorAll('input');
    inputFields.forEach((input) => {
        input.value = '';
    });
}

function removeParentDiv(element) {
    const parentDiv = element.closest('.addQualification');
    if (parentDiv) {
        parentDiv.remove();
    }
}

function addRoundBorderBox() {
    const roundBorderBox = document.querySelector('.addQualification');
    const clonedDiv = roundBorderBox.cloneNode(true);

    const minusDiv = document.createElement('div');
    minusDiv.className = 'text-right';
    minusDiv.innerHTML = `
                                        <img src="../assets/minus-icon.svg" alt="minus-icon" class="minus-icon cursor-pointer" onclick="removeParentDiv(this)">
                                    `;
    clonedDiv.insertBefore(minusDiv, clonedDiv.firstChild);

    roundBorderBox.parentElement.insertBefore(clonedDiv, roundBorderBox.nextSibling);

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
