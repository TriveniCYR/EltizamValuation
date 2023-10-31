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
document.getElementById("defaultOpenPay").click();
        // payment option JS ends

$(document).ready(function () {
    // BindProperty();
    BindClientType();
    BindProperty();
    BindOwnership();
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
    alert("hello");

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
    alert("Detail");

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
        type: "GET",
        url: $('#hdnBaseURL').val() + GetPropertyByFilters + '/' + PropertyTypeId + '/' + PropertySubTypeId + '/' + OwnershipTypeId,
        "datatype": "json",
        success: function (response) {
            debugger;
            alert(response);
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

function BindAmenityDetail() {
    debugger;
    alert("Detail");

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
        type: "GET",
        url: $('#hdnBaseURL').val() + GetPropertyById + '/' + PropertyTypeId,
        "datatype": "json",
        success: function (response) {
            debugger;
            alert(response);
            //OwnershipType.empty().append('<option selected="selected" value="0">Please select</option>');
            //for (var i = 0; i < response.data.length; i++) {
            //    OwnershipType.append($("<option></option>").val(response.data[i].id).html(response.data[i].ownershipType));
            //}
            //if ($('#hdnOwnershipType').val() != 0) {
            //    OwnershipType.val($('#hdnOwnershipType').val());
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


