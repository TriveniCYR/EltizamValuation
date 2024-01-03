 
// accordian function here
function accordianToggle(header) {
    const item = header.nextElementSibling;
    if (item.style.display === 'block') {
        item.style.display = 'none';
    } else {
        item.style.display = 'block';
    }
}
    //accordian function end
$('#ValuationType').change(function () {
    var general = document.getElementById("general");
    var fixed = document.getElementById("fixed");
    var valuationType = document.getElementById('ValuationType').value;
    //alert("You entered " + valuationType + " for your gender<br>");
    if (valuationType === "2") {
        general.style.display = "none";
        fixed.style.display = "block";

        document.getElementById('ValuationFees').value = null;
        document.getElementById('Vat').value = null;
        document.getElementById('OtherCharges').value = null;
        document.getElementById('TotalValuationFees').value = null; 
    } else if (valuationType === "1") {
        fixed.style.display = "none";
        general.style.display = "block";
        document.getElementById('FixedvaluationFees').value = null;
    }
})

$('#addLocation').change(function () {
    document.getElementById("addLocation").value= $('#addLocation')[0].checked;
});

$(document).ready(function () {
    BindProperty();
    BindClient();
    BindOwnership();
    BindValuationFeeType();

    ///For Dropdown Change
    var general = document.getElementById("general");
    var fixed = document.getElementById("fixed");
    var valuationType = document.getElementById('ValuationType').value;
    if (valuationType === "5") {
        general.style.display = "none";
        fixed.style.display = "block";
    } else if (valuationType === "1") {
        fixed.style.display = "none";
        general.style.display = "block";
    }

    /// End For Dropdown Change
    var HdnId = $('#hdnProperty').val();
    if (HdnId) {
        BindPropertySub(HdnId);
    }
});

function BindProperty() { 
    var Property = $("#PropertyTypeId");
    var _val = $('#hdnProperty').val();
    var _rpname = "propertyType";

    BindDropdowns(PropertyList, Property, _rpname, _val);
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

function BindClient() {
    //alert("hello");
    
    var Client = $("#ClientTypeId");
    var _val = $('#hdnClientType').val();
    var _rpname = "clientType";

    BindDropdowns(ClientTypeList, Client, _rpname, _val); 
}

function BindOwnership() {
    var OwnershipType = $("#OwnershipTypeId");
    var _val = $('#hdnOwnershipType').val();
    var _rpname = "ownershipType";

    BindDropdowns(OwnershipTypeList, OwnershipType, _rpname, _val);
}

function BindValuationFeeType() {  
    var ValuationFeeType = $("#ValuationFeeTypeId");
    var _val = $('#hdnValuationFeeType').val();
    var _rpname = "valuationFeeType";

    BindDropdowns(ValuationFeeTypeList, ValuationFeeType, _rpname, _val);

    //$.ajax({
    //    type: "POST",
    //    url: $('#hdnBaseURL').val() + ValuationFeeTypeList,
    //    "datatype": "json",
    //    success: function (response) {
    //        debugger;
    //        ValuationFeeType.empty().append('<option selected="selected" value="0">Please select</option>');
    //        for (var i = 0; i < response.data.length; i++) {
    //            ValuationFeeType.append($("<option></option>").val(response.data[i].id).html(response.data[i].valuationFeeType));
    //        }
    //        if ($('#hdnValuationFeeType').val() != 0) {
    //            ValuationFeeType.val($('#hdnValuationFeeType').val());
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
