 
 
$('#ValuationType').change(function () {
    var general = document.getElementById("general");
    var fixed = document.getElementById("fixed");
    var valuationType = $("#ValuationType option:selected").text();    
    //alert("You entered " + valuationType + " for your gender<br>");
    if (valuationType === "Fixed") {
        general.style.display = "none";
        fixed.style.display = "block";

        document.getElementById('ValuationFees').value = null;
        document.getElementById('Vat').value = null;
        document.getElementById('OtherCharges').value = null;
        document.getElementById('TotalValuationFees').value = null;


    } else if (valuationType === "General") {
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
    GetValuationTypeLists();

    ///For Dropdown Change
    //var general = document.getElementById("general");
    //var fixed = document.getElementById("fixed");
    //var valuationType = document.getElementById('ValuationType').value;
    //if (valuationType === "5") {
    //    general.style.display = "none";
    //    fixed.style.display = "block";
    //} else if (valuationType === "1") {
    //    fixed.style.display = "none";
    //    general.style.display = "block";
    //}

    /// End For Dropdown Change
    var HdnId = $('#hdnProperty').val();
    if (HdnId) {
        BindPropertySub(HdnId);
    }
});

function ShowValuationTypeProperties()
{
    var general = document.getElementById("general");
    var fixed = document.getElementById("fixed");
    var valuationType = $("#ValuationType option:selected").text();
    if (valuationType === "Fixed") {
        general.style.display = "none";
        fixed.style.display = "block";
    } else if (valuationType === "General") {
        fixed.style.display = "none";
        general.style.display = "block";
    }
}
function GetValuationTypeLists() {
    var ValuationType = $("#ValuationType");
    var _val = $('#hdnValuationType').val();
    var _rpname = "description";
    var description = "VALUATION_TYPE";
    // var currentUserId = "@ViewBag.CurrentUserId";
    $.ajax({
        type: Get,
        url: BaseURL + GetDictionaryWithSubDetails + '?code=' + description,
        "datatype": "json",
        success: function (response) {
            var _dd = _rpname;
            var data = response.values;
            var generalId = 0;
            $.each(data, function (index, item) {
                (item.description == "General")
                {
                    generalId = item.id;
                }
            });
            if (_val == "") {
                _val = generalId;
            }
            for (var i = 0; i < data.length; i++) {
                ValuationType.append($("<option></option>").val(data[i].id).html(data[i][_dd]));
            }
            if (_val != 0) {
                ValuationType.val(_val);
            }
            ShowValuationTypeProperties();
        },
        failure: function (response) {
            alert(response.responseText);
        },
        error: function (response) {
            alert(response.responseText);
            $("#loader").hide();
        }
    });
    //BindDropdownsForDictionary(GetDictionaryWithSubDetails + '?description=' + description, ValuationType, _rpname, _val);

}
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
    var ClientType = $("#ClientTypeId");
    var _val = $('#hdnClientType').val();
    var _rpname = "description";
    var description = "CLIENT_TYPE";
    BindDropdownsForDictionary(GetDictionaryWithSubDetails + '?code=' + description, ClientType, _rpname, _val);
}


function BindOwnership() {
    var OwnershipType = $("#OwnershipTypeId");
    var _val = $('#hdnOwnershipType').val();
    var _rpname = "description";
    var description = "OWNERSHIP_TYPE";
    BindDropdownsForDictionary(GetDictionaryWithSubDetails + '?code=' + description, OwnershipType, _rpname, _val);
}

function BindValuationFeeType() {
    var ValuationFeeType = $("#ValuationFeeTypeId");
    var _val = $('#hdnValuationFeeType').val();
    var _rpname = "description";
    var description = "VALUATION_FEE_TYPE";
    BindDropdownsForDictionary(GetDictionaryWithSubDetails + '?code=' + description, ValuationFeeType, _rpname, _val);
    //BindDropdowns(ValuationFeeTypeList, ValuationFeeType, _rpname, _val); 
}
