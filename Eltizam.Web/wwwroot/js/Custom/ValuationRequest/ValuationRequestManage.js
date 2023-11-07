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

// payemnt option JS here 
function payTab(evt, payName) {
    var i, payTabContent, payTabLink;
    payTabContent = document.getElementsByClassName("payTabContent");
    for (i = 0; i < payTabContent.length; i++) {
        payTabContent[i].style.display = "none";
    }
    payTabLink = document.getElementsByClassName("payTabLink");
    for (i = 0; i < payTabLink.length; i++) {
        payTabLink[i].className = payTabLink[i].className.replace(" active", "");
    }
    document.getElementById(payName).style.display = "block";
    evt.currentTarget.className += " active";
}
//document.getElementById("defaultOpenPay").click();
// payment option JS ends

$(document).ready(function () {
    // BindProperty();
    BindValuationRequestStatus();
    GetValuationMethodLists();
    BindClientType();
    BindProperty();
    BindOwnership();
    BindUnitType();
    BindFurnished();
    BindCountry();
    GetApproverLists();
    GetValuerLists();
    var HdnCountryId = $('#hdnCountry').val();
    if (HdnCountryId) {
        BindState(HdnCountryId);
    }
    var HdnStateId = $('#hdnState').val();
    if (HdnStateId) {
        BindCity(HdnStateId);
    }
    //BindValuationFeeType();

    /////For Dropdown Change
    //var general = document.getElementById("general");
    //var fixed = document.getElementById("fixed");
    //var valuationType = document.getElementById('ValuationType').value;
    //if (valuationType === "2") {
    //    general.style.display = "none";
    //    fixed.style.display = "block";
    //} else if (valuationType === "1") {
    //    fixed.style.display = "none";
    //    general.style.display = "block";
    //}

    ///// End For Dropdown Change
    //var HdnId = $('#hdnProperty').val();
    //if (HdnId) {
    //    BindPropertySub(HdnId);
    //}
});

function BindValuationRequestStatus() {
    /*alert("hello");*/

    var RequestStatus = $("#StatusId");
    var _val = $('#hdnStatusId').val();
    var _rpname = "statusName";
    debugger;
    BindDropdowns(GetAllValuationRequestStatus, RequestStatus, _rpname, _val);
    debugger;
    //$.ajax({
    //    type: "POST",
    //    url: $('#hdnBaseURL').val() + PropertyList,
    //    "datatype": "json",
    //    success: function (response) {
    //        debugger;
    //        Property.empty().append('<option selected="selected" value="0">Please select</option>');
    //        for (var i = 0; i < response.data.length; i++) {
    //            Property.append($("<option></option>").val(response.data[i].id).html(response.data[i].propertyType));
    //        }
    //        if ($('#hdnProperty').val() != 0) {
    //            Property.val($('#hdnProperty').val());
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
function BindClientType() {
    debugger;
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

function BindClientByClientType(id) {
    debugger;
    var clients = $("#ClientId");
    var _val = $('#hdnClientId').val();
    var _rpname = "clientName";

    BindDropdowns(ClientByClientTypeId + '/' + id, clients, _rpname, _val);
    //$.ajax({
    //    type: "GET",
    //    url: $('#hdnBaseURL').val() + PropertyByIdSubType + '/' + id,
    //    "datatype": "json",
    //    success: function (response) {
    //        debugger;

    //        PropertySubType.empty().append($("<option></option>").val(response._object.id).html(response._object.propertySubType));

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

function BindProperty() {
    //alert("hello");

    var Property = $("#PropertyTypeId");
    var _val = $('#hdnPropertyType').val();
    var _rpname = "propertyType";
    debugger;
    BindDropdowns(PropertyList, Property, _rpname, _val);
    debugger;
    //$.ajax({
    //    type: "POST",
    //    url: $('#hdnBaseURL').val() + PropertyList,
    //    "datatype": "json",
    //    success: function (response) {
    //        debugger;
    //        Property.empty().append('<option selected="selected" value="0">Please select</option>');
    //        for (var i = 0; i < response.data.length; i++) {
    //            Property.append($("<option></option>").val(response.data[i].id).html(response.data[i].propertyType));
    //        }
    //        if ($('#hdnProperty').val() != 0) {
    //            Property.val($('#hdnProperty').val());
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
    debugger;
    var PropertySubType = $("#PropertySubTypeId");
    var _val = $('#hdnPropertySub').val();
    var _rpname = "propertySubType";

    BindDropdowns(PropertyByIdSubType + '/' + id, PropertySubType, _rpname, _val);
    //$.ajax({
    //    type: "GET",
    //    url: $('#hdnBaseURL').val() + PropertyByIdSubType + '/' + id,
    //    "datatype": "json",
    //    success: function (response) {
    //        debugger;

    //        PropertySubType.empty().append($("<option></option>").val(response._object.id).html(response._object.propertySubType));

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
    debugger;
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


function BindPropertyDetail() {
    debugger;
    //alert("Detail");

    var PropertyTypeId = document.getElementById("PropertyTypeId").value;
    var PropertySubTypeId = document.getElementById("PropertySubTypeId").value;
    var OwnershipTypeId = document.getElementById("OwnershipTypeId").value;

    if ((PropertyTypeId == null || PropertyTypeId == "") && (PropertySubTypeId == null || PropertySubTypeId == "") && (OwnershipTypeId == null || OwnershipTypeId == "")) {
        alert("No id is passed");
        return false;
    }
    var Property = $("#PropertyId");
    var _val = $('#hdnProperty').val();
    var _rpname = "propertyName";

    //BindDropdowns(OwnershipTypeList, OwnershipType, _rpname, _val);
    $.ajax({
        type: Get,
        url: BaseURL + GetPropertyByFilters + '/' + PropertyTypeId + '/' + PropertySubTypeId + '/' + OwnershipTypeId,
        "datatype": "json",
        success: function (response) {
            debugger;
            //alert(response);
            Property.empty().append('<option selected="selected" value="0">Please select</option>');
            for (var i = 0; i < response.length; i++) {
                Property.append($("<option></option>").val(response[i].id).html(response[i].propertyName));
            }
            if ($('#hdnProperty').val() != 0) {
                Property.val($('#hdnProperty').val());
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

function BindPropertyDetailById(Id) {
    var Amentiesdiv = $("#amentiesdiv");
    $.ajax({
        type: Get,
        url: BaseURL + GetPropertyById + '/' + Id,
        "datatype": "json",
        success: function (response) {
            debugger;
            //alert(response);
            document.getElementById('UnitType').value = response._object.unitType;
            document.getElementById('AdditionalUnits').value = response._object.additionalUnits;
            document.getElementById('Furnished').value = response._object.furnished;
            document.getElementById('ValuationPurpose').value = response._object.valuationPurpose;
            document.getElementById('BuildUpAreaSqFt').value = response._object.buildUpAreaSqFt;
            document.getElementById('BuildUpAreaSqMtr').value = response._object.buildUpAreaSqMtr;
            document.getElementById('AgeOfConstruction').value = response._object.ageOfConstruction;
            document.getElementById('Parking').value = response._object.parking;
            document.getElementById('ParkingBayNo').value = response._object.parkingBayNo;
            document.getElementById('Description').value = response._object.description;
            //AmenityList = {}
            var AmenityList = response._object.amenityList;
            // ViewBag.AmenityList = AmenityList;


            for (i = 0; i < response._object.amenityList.length; i++) {
                //var _id = response._object.amenityList[i].id
                Amentiesdiv.append('<label for="" class="checkboxBtn w-30 mr-20">' +
                    '<input checked="checked" class="position-relative checkbox-checked" data-val="true"   name="AmenityList[' + response._object.amenityList[i].id + '].IsActive" type="checkbox" text="[' + response._object.amenityList[i].amenityName + ']" value="true" ' + '<p> ' + response._object.amenityList[i].amenityName + '  </p>' +
                    '</label>')
            }


            //AmenityList = response._object.amenityList;

            //$("#UnitType").val = response.unitType;
            //Property.empty().append('<option selected="selected" value="0">Please select</option>');
            //for (var i = 0; i < response.length; i++) {
            //    Property.append($("<option></option>").val(response[i].id).html(response[i].propertyName));
            //}
            //if ($('#hdnProperty').val() != 0) {
            //    Property.val($('#hdnProperty').val());
            //}
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

function BindCountry() {
    var countryId = $("#CountryId");
    var _val = $('#hdnCountry').val();
    var _rpname = "countryName";

    BindDropdowns(CountryList, countryId, _rpname, _val);
}
function BindState(id) {
    var state = $("#StateId");
    var _val = $('#hdnState').val();
    var _rpname = "stateName";

    //BindDropdowns(stateListUrl + '/' + id, state, _rpname, _val);
    $.ajax({
        type: "GET",
        url: $('#hdnBaseURL').val() + stateListUrl + '/'+ id,
        "datatype": "json",
        success: function (response) {
            debugger;
          /*  state.empty().append('<input type="text"  disabled>');*/
            $("#StateId").val(function () {
                return response[0].stateName;//this.value + number;
            });
            //for (var i = 0; i < response.values.length; i++) {
            //    state.append().val(response.values[i].id).html(response.values[i].description);
            //}
            if ($('#hdnState').val() != 0) {
                state.val($('#hdnState').val());
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
function BindCity(id) {
    var city = $("#CityId");
    var _val = $('#hdnCity').val();
    var _rpname = "cityName";

    /*  BindDropdowns(cityListUrl + '/' + id, city, _rpname, _val);*/

    $.ajax({
        type: "GET",
        url: $('#hdnBaseURL').val() + cityListUrl + '/' + id,
        "datatype": "json",
        success: function (response) {
            debugger;
            /*  state.empty().append('<input type="text"  disabled>');*/
            $("#CityId").val(function () {
                return response[0].cityName;//this.value + number;
            });
            //for (var i = 0; i < response.values.length; i++) {
            //    state.append().val(response.values[i].id).html(response.values[i].description);
            //}
            if ($('#hdnCity').val() != 0) {
                state.val($('#hdnCity').val());
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

function BindClientDetailsByClientId(Id) {
    // var Amentiesdiv = $("#amentiesdiv");
    $.ajax({
        type: Get,
        url: BaseURL + GetClientDetailById + '/' + Id,
        "datatype": "json",
        success: function (response) {
            debugger;
            //alert(response);
            document.getElementById('ClientName').value = response._object.clientName;
            document.getElementById('LicenseNumber').value = response._object.licenseNumber;
            document.getElementById('TrnexpiryDate').value = response._object.trnexpiryDate;
            document.getElementById('Trnnumber').value = response._object.trnnumber;
            //document.getElementById('Trnnumber').value = response._object.address.address1;
            document.getElementById('CountryId').value = response._object.address.countryId;
            if (response._object.address.countryId) {
                BindState(response._object.address.countryId);
            }
            //var HdnStateId = $('#hdnState').val();
            if (response._object.address.stateId) {
                BindCity(response._object.address.stateId);
            }
            //document.getElementById('StateId').value = response._object.address.stateId;
            //document.getElementById('CityId').value = response._object.address.cityId;
            document.getElementById('PinCode').value = response._object.address.pinNo;
            //document.getElementById('Trnnumber').value = response._object.trnnumber;
            //document.getElementById('Trnnumber').value = response._object.trnnumber;
            //document.getElementById('BuildUpAreaSqMtr').value = response._object.buildUpAreaSqMtr;
            //document.getElementById('AgeOfConstruction').value = response._object.ageOfConstruction;
            //document.getElementById('Parking').value = response._object.parking;
            //document.getElementById('ParkingBayNo').value = response._object.parkingBayNo;
            //document.getElementById('Description').value = response._object.description;
            ////AmenityList = {}
            // var AmenityList = response._object.amenityList;
            // ViewBag.AmenityList = AmenityList;





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

function BindAmenityDetail() {
    var PropertyTypeId = document.getElementById("PropertyTypeId").value;

    if ((PropertyTypeId == null || PropertyTypeId == "")) {
        alert("No id is passed");
        return false;
    }
    // var OwnershipType = $("#OwnershipTypeId");
    //var _val = $('#hdnOwnershipType').val();
    //var _rpname = "ownershipType";

    //BindDropdowns(OwnershipTypeList, OwnershipType, _rpname, _val);
    $.ajax({
        type: Get,
        url: BaseURL + GetPropertyById + '/' + PropertyTypeId,
        "datatype": "json",
        success: function (response) {
            alert(response);
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

function GetApproverLists() {

    var statusId = $("#ApproverId");
    var _val = $('#hdnApproverId').val();
    var _rpname = "userName";
    var currentUserId = "@ViewBag.CurrentUserId";

    BindDropdowns(GetApproverList + '/' + currentUserId, statusId, _rpname, _val);

}

function GetValuerLists() {

    var statusId = $("#ValuerId");
    var _val = $('#hdnValuerId').val();
    var _rpname = "userName";
    var currentUserId = "@ViewBag.CurrentUserId";

    BindDropdowns(GetValuerList + '/' + currentUserId, statusId, _rpname, _val);

}


function GetValuationMethodLists() {
    debugger;
    var statusId = $("#ValuationModeId");
    var _val = $('#hdnValuationModeId').val();
    var _rpname = "description";
    var description = "Valuation Method";
   // var currentUserId = "@ViewBag.CurrentUserId";

    BindDropdownsForDictionary(GetDictionaryWithSubDetails + '?description=' + description, statusId, _rpname, _val);
    //$.ajax({
    //    type: "GET",
    //    url: $('#hdnBaseURL').val() + GetDictionaryWithSubDetails + '?description=' + description,
    //    "datatype": "json",
    //    success: function (response) {
    //        debugger;
    //        statusId.empty().append('<option selected="selected" value="0">Please select</option>');
    //        for (var i = 0; i < response.values.length; i++) {
    //            statusId.append($("<option></option>").val(response.values[i].id).html(response.values[i].description));
    //        }
    //        if ($('#hdnValuationModeId').val() != 0) {
    //            statusId.val($('#hdnValuationModeId').val());
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


