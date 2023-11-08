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
//document.getElementById("defaultOpen").click();

function accordianToggle(header) {
    const item = header.nextElementSibling;
    if (item.style.display === 'block') {
        item.style.display = 'none';
    } else {
        item.style.display = 'block';
    }
}

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
   // BindClientType();
    BindProperty();
    BindOwnership();
    BindUnitType();
    BindFurnished();
    BindCountry();
    GetApproverLists();
    GetValuerLists();
    BindQuatationList();
    BindInvoiceList();
    /*BindPropertyDetail();*/

    if (document.location.href.includes('id'))
    
   /* if (document.getElementById('hdnClientTypeId').value != "0" || document.getElementById('hdnClientTypeId').value != '')*/
    {

        debugger;
      var  comingFromAPI  = document.getElementById('hdnClientTypeId').value;
        var comingFromAPIClientId = document.getElementById('hdnClientId').value;
        var comingFromAPIPropertyTypeId = document.getElementById('hdnPropertyType').value;
        var comingFromAPIPropertyId = document.getElementById('hdnPropertyId').value;
       
      //var id =  document.getElementById('ClientTypeId').value
       // $('ClientTypeId').val() = $('hdnClientTypeId').val();
        var ss = document.getElementById('ClientTypeId').value = document.getElementById('hdnClientTypeId').value;
        //document.getElementById('ClientName').value
       // document.getElementById('ClientTypeId').value = ss;
       // console.log(ss);
       // console.log(document.getElementById('ClientTypeId').value);
       //console.log(document.getElementById('hdnClientTypeId').value);
       // document.getElementById("ClientTypeId").options[document.getElementById('hdnClientTypeId').value].selected = true;
        /* document.getElementById("ClientTypeId").options[ss].selected = true;*/
        /*$("#ClientTypeId").get(0).selectedIndex = document.getElementById('hdnClientTypeId').value;*/
        
        console.log($("#ClientTypeId").val(comingFromAPI));
        
        BindClientByClientType(comingFromAPI);
        BindClientDetailsByClientId(comingFromAPIClientId);
        BindPropertySub(comingFromAPIPropertyTypeId);
        BindPropertyDetail();

        BindPropertyDetailById(comingFromAPIPropertyId);

    }

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
    var _val = $('#hdnClientTypeId').val();
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
    if (document.location.href.includes('id')) {
        var PropertyTypeId = document.getElementById("hdnPropertyType").value;
        var PropertySubTypeId = document.getElementById("hdnPropertySub").value;
        var OwnershipTypeId = document.getElementById("hdnOwnershipType").value;

    }
    else {
        var PropertyTypeId = document.getElementById("PropertyTypeId").value;
        var PropertySubTypeId = document.getElementById("PropertySubTypeId").value;
        var OwnershipTypeId = document.getElementById("OwnershipTypeId").value;
    }

   

    if ((PropertyTypeId == null || PropertyTypeId == "") && (PropertySubTypeId == null || PropertySubTypeId == "") && (OwnershipTypeId == null || OwnershipTypeId == "")) {
        alert("No id is passed");
        return false;
    }
    var Property = $("#PropertyId");
    var _val = $('#hdnPropertyId').val();
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
            if ($('#hdnPropertyId').val() != 0) {
                Property.val($('#hdnPropertyId').val());
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
                Amentiesdiv.append('<label for="" class="position-relative checkboxBtn w-30">' +
                    '<input checked data-val="true"   name="AmenityList[' + response._object.amenityList[i].id + '].IsActive" type="checkbox" text="[' + response._object.amenityList[i].amenityName + ']" value="true"/> ' + '<p> ' + response._object.amenityList[i].amenityName + '  </p>' +
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

function formatDateTo_ddMMMyyyy(date) {
    const months = [
        "Jan", "Feb", "Mar", "Apr", "May", "Jun",
        "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"
    ];

    const day = date.getDate().toString().padStart(2, '0');
    const month = months[date.getMonth()];
    const year = date.getFullYear();

    return `${day}-${month}-${year}`;
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
            /* = response._object.trnexpiryDate;*/
            const inputDateString = response._object.trnexpiryDate;
            const inputDate = new Date(inputDateString);
            const formattedDate = formatDateTo_ddMMMyyyy(inputDate);
            document.getElementById('TrnexpiryDate').value = formattedDate;
            console.log(formattedDate);
            //var FormateDated = new Date(response._object.trnexpiryDate)
            //FormateDated.getDate() + FormateDated.getDay() + FormateDated.getFullYear();

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

            if (response._object.address != null) {
               // $(".NewAddressTable tbody tr")

                /*destoryStaticDataTable('#ClientTypeTable');*/
                $('#NewAddressTable tbody').html('');
                //$.each(data._object, function (index, object) { //  <td>' + object.ClientTypeCode + '</td>  <td>' + object.isdClientTypeCode + '</td>  
                $('#NewAddressTable tbody').append(' <tr><td>' + response._object.address.address1 + '</td> <td>' + response._object.address.address2 + '</td><td>' + response._object.address.countryId
                    + '</td><td>' + response._object.address.stateId + '</td><td>' + response._object.address.cityId + '</td><td>' + response._object.address.pinNo + '</td></tr>');
               // });
               // StaticDataTable("#ClientTypeTable");
            }

            if (response._object.address != null) {
                // $(".NewAddressTable tbody tr")

                /*destoryStaticDataTable('#ClientTypeTable');*/
                $('#NewContactTable tbody').html('');
                //$.each(data._object, function (index, object) { //  <td>' + object.ClientTypeCode + '</td>  <td>' + object.isdClientTypeCode + '</td>  
                $('#NewContactTable tbody').append(' <tr><td>' + response._object.contact.contactPersonName + '</td> <td>' + response._object.contact.department + '</td><td>' + response._object.contact.designation
                    + '</td><td>' + response._object.contact.email + '</td><td>' + response._object.contact.mobile + '</td></tr>');
                // });
                // StaticDataTable("#ClientTypeTable");
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

function BindQuatationList() {
    debugger
    let id = $('#hdnId').val();
    $.ajax({
        type: Get,
        url: BaseURL + ValuationQuatationList + '?requestId=' + id,
        "datatype": "json",
        success: function (response) {
            debugger;
            if (response != null) {
                debugger
                //destoryStaticDataTable('#QuatationTable');
                //$('#QuatationTable tbody').html('');
                $.each(response, function (index, object) {
                    var html = '';

                    html += '<img src="../assets/dots-vertical.svg" alt="dots-vertical" class="activeDots" /> <div class="actionItem"><ul>'
                    html += '<li><a title="View" href="/ValuationRequest/ValuationQuotationManage?id=' + object.id + '&vId=' + object.valuationRequestId + '&refNo=' + object.referenceNo +'"><img src="../assets/view.svg" alt="view" />View</a></li>';
                    /*html += '<li><a title="Edit" href="/MasterVendor/VendorManage?id=' + object.id + '"><img src="../assets/edit.svg" alt="edit" />Edit</a></li>';*/
                    html += '<li><a title="Delete" data-toggle="modal" data-target="#DeleteQuotationModel" data-backdrop="static" data-keyboard="false" onclick="ConfirmationQuotationVendor(' + object.id + ');"><img src="../assets/trash.svg" alt="trash" />Delete</a></li>';
                    html += '</ul></div>';

                    $('#QuatationTable tbody').append(' <tr><td>' + object.id + '</td> <td>' + object.valuationFee + '</td><td>' + object.vat
                        + '</td><td>' + object.otherCharges + '</td><td>' + object.discount + '</td><td>' + object.totalFee + '</td><td>' + moment(object.createdDate).format('DD-MMM-YYYY') + '</td><td>' + object.statusId + '</td><td>' + html + '</td></tr>');
                });
                //StaticDataTable("#QuatationTable");
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

function BindInvoiceList() {
    let id = $('#hdnId').val();
    $.ajax({
        type: Get,
        url: BaseURL + ValuationInvoiceList + '?requestId=' + id,
        "datatype": "json",
        success: function (response) {
            debugger;
            if (response != null) {
                debugger
                //destoryStaticDataTable('#QuatationTable');
                //$('#QuatationTable tbody').html('');
                $.each(response, function (index, object) {
                    var html = '';

                    html += '<img src="../assets/dots-vertical.svg" alt="dots-vertical" class="activeDots" /> <div class="actionItem"><ul>'
                    html += '<li><a title="View" href="/ValuationRequest/ValuationInvoiceManage?id=' + object.id + '&vId=' + object.valuationRequestId + '&refNo=' + object.referenceNo +'"><img src="../assets/view.svg" alt="view" />View</a></li>';
                    /*html += '<li><a title="Edit" href="/MasterVendor/VendorManage?id=' + object.id + '"><img src="../assets/edit.svg" alt="edit" />Edit</a></li>';*/
                    html += '<li><a title="Delete" data-toggle="modal" data-target="#DeleteInvoiceModel" data-backdrop="static" data-keyboard="false" onclick="ConfirmationInvoiceVendor(' + object.id + ');"><img src="../assets/trash.svg" alt="trash" />Delete</a></li>';
                    html += '</ul></div>';

                    $('#InvoiceTable tbody').append(' <tr><td>' + object.id + '</td> <td>' + object.valuationRequestId + '</td><td>' + object.transactionModeId
                        + '</td><td>' + object.transactionStatusId + '</td><td>' + object.amount + '</td><td>' + moment(object.transactionDate).format('DD-MMM-YYYY') + '</td><td>' + moment(object.createdDate).format('DD-MMM-YYYY') + '</td><td>' + html + '</td></tr>');
                });
                //StaticDataTable("#QuatationTable");
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

