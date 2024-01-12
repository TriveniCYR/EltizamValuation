
var docId = 0;
var invoiceId = 0;
var isSaveBtn = 0;

function profileTab(evt, cityName) {
    var i, tabcontent, tablinks;
    tabcontent = document.getElementsByClassName("tabcontent");
    for (i = 0; i < tabcontent.length; i++) {
        tabcontent[i].style.height = 0;
        tabcontent[i].style.padding = 0;
        tabcontent[i].style.border = "none";
        tabcontent[i].style.marginTop = 0;
        tabcontent[i].style.position = "absolute";
    }
    tablinks = document.getElementsByClassName("tablinks");
    for (i = 0; i < tablinks.length; i++) {
        tablinks[i].className = tablinks[i].className.replace(" active", "");
    }



    document.getElementById(cityName).style.height = "auto";
    document.getElementById(cityName).style.padding = "6px 12px";
    document.getElementById(cityName).style.border = "1px solid var(--blue)";
    document.getElementById(cityName).style.position = "initial";
    evt.currentTarget.className += " active";
}
function redirectToComparableEvidences() {
    // Switch to the "Comparable evidences" tab
    profileTab(event, 'profile5');
    var tab_5 = document.getElementById('tab_5');
    tab_5.classList.add('active')

}
function redirectToValuationAssesment() {
    // Switch to the "Comparable evidences" tab
    profileTab(event, 'profile6');
    var tab_6 = document.getElementById('tab_6');
    tab_6.classList.add('active')

}
document.getElementById("defaultOpen").click();


function toggleInput(answer) {
    const yesInput = document.getElementById('yesInput');
    const yesField = document.getElementById('yesField');

    if (answer === 'yes') {
        yesInput.style.display = 'inline-flex';
        yesField.setAttribute('required', 'true');
    } else {
        yesInput.style.display = 'none';
        yesField.removeAttribute('required');
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

function getPDF(id) {
    // id = 24;
    var url1 = "/ValuationRequest/ValuationData/" + id;
    $.get(url1, function (content1) {
        var w = window.open();
        w.document.open();
        w.document.write(content1);
        if (w.document.getElementById("loading-wrapper") != null)
            w.document.getElementById("loading-wrapper").remove();
        //sideNavToggle();
        generatePDF(w.document.getElementById("PDFMainDiv")) //(w.document.body)
        w.close();
    });
}
function downloadPdf(con1) {

    var val = htmlToPdfmake(con1);
    var dd = { content: val };
    pdfMake.createPdf(dd).download();


    //var docDefinition = {
    //    content: con1,
    //    defaultStyle: {
    //    }
    //};
    //pdfMake.createPdf(con1).print();
}
function generatePDF(element) {
    var opt = {
        margin: [0, 0, 30, 0], //top, left, buttom, right,
        filename: 'my_file.pdf',
        image: { type: 'jpeg', quality: 0.98 },
        html2canvas: { dpi: 192, scale: 2, letterRendering: true },
        pagebreak: { mode: 'avoid-all' },
        jsPDF: { unit: 'pt', format: 'letter', orientation: 'landscape' }
    };
    html2pdf().set(opt).from(element).save();
}
function saveAspdf(con) {
    var pdf = new jsPDF('p', 'pt', 'a4');
    pdf.addHTML(con, function () {
        pdf.save('web.pdf');
    });
}
//document.getElementById("defaultOpenPay").click();
// payment option JS ends
function ConfirmationDocument(id, isAction) {
    $('#DeleteDocumentModel #ID').val(id);
    $('#isAction').val(isAction);


}

function DeleteDocument() {
    docId = $('#DeleteDocumentModel #ID').val()
    var by = LogInUserId;
    var action = $('#isAction').val();

    if (isDeleteSite && action === 'isSite') {
        ajaxServiceMethod(BaseURL + DeleteAssesmentDocument + "/" + docId + "?by=" + by, Delete, DeleteDocumentSuccess, DeleteDocumentError);
    }
    else if (isDeleteEvidence && action === 'isEvidence') {
        ajaxServiceMethod(BaseURL + DeleteAssesmentDocument + "/" + docId + "?by=" + by, Delete, DeleteDocumentSuccess, DeleteDocumentError);
    }
    else if (isDeleteAssesment && action === 'isAssesment') {
        ajaxServiceMethod(BaseURL + DeleteAssesmentDocument + "/" + docId + "?by=" + by, Delete, DeleteDocumentSuccess, DeleteDocumentError);
    }
    else {
        toastr.error(DeleteAccessDenied);
    }
}



function DeleteDocumentSuccess(data) {
    try {
        if (data._Success === true) {
            $('#' + docId).remove();
            toastr.success(RecordDelete);
        }

        else {
            toastr.error(data._Message);
        }
    } catch (e) {
        toastr.error('Error:' + e.message);
    }
}

function DeleteDocumentError(x, y, z) {
    toastr.error(ErrorMessage);
}


$(document).ready(function () {

    var roleId = document.getElementById('hdnRoleId').value;
    //var role = $('#LogInRoleName').val(); 

    /*var roleId = document.getElementById('hdnRoleId').value;
    var inputElement1 = $('#ApproverId');
    var inputElement2 = $('#OtherReferenceNo');
    var inputElement3 = $('#ValuerId');
    var inputElement6 = $('#ValuationDate');
    var inputElement7 = $('#ValuationModeId');
    var inputElement8 = $('#ClientTypeId');
    var inputElement9 = $('#ClientId');
    var inputElement10 = $('#ClientName');
    var inputElement11 = $('#PropertyTypeId');
    var inputElement12 = $('#PropertySubTypeId');
    var inputElement13 = $('#OwnershipTypeId');
    var inputElement14 = $('#PropertyId');
    var inputElement15 = $('#ValuationTimeFrame');
    var inputElement16 = $('#StatusId');
    var inputElement17 = $('#ApproverComment');


    var inputElement42 = $('#ValuationAssesment_SiteDescription_InternalArea');
    var inputElement41 = $('#ValuationAssesment_SiteDescription_Location');
    var inputElement43 = $('#ValuationAssesment_SiteDescription_ExternalArea');
    var inputElement44 = $('#ValuationAssesment_SiteDescription_Floor');
    var inputElement45 = $('#ValuationAssesment_SiteDescription_Room');
    var inputElement46 = $('#ValuationAssesment_SiteDescription_Bedrooms');
    var inputElement47 = $('#ValuationAssesment_SiteDescription_Storage');
    var inputElement48 = $('#ValuationAssesment_SiteDescription_Quantity');
    var inputElement49 = $('#ValuationAssesment_SiteDescription_AdditionComment');
    var inputElement410 = $('#ValuationAssesment_SiteDescription_PropertyCondition');
    var inputElement411 = $('#ValuationAssesment_SiteDescription_AdditionalNotes');
    var inputElement412 = $('#ValuationAssesment_SiteDescription_Others');

    var inputElement51 = $('#ValuationAssesment_comparableEvidenceModel_Type');
    var inputElement52 = $('#ValuationAssesment_comparableEvidenceModel_Size');
    var inputElement53 = $('#ValuationAssesment_comparableEvidenceModel_Remarks');
    var inputElement54 = $('#ValuationAssesment_comparableEvidenceModel_RateSqFt');
    var inputElement55 = $('#ValuationAssesment_comparableEvidenceModel_Price');
    var inputElement56 = $('#ValuationAssesment_comparableEvidenceModel_AddtionalComments');


    var inputElement61 = $('#ValuationAssesment_valuationAssessementModel_MarketRate');
    var inputElement62 = $('#ValuationAssesment_valuationAssessementModel_LifeOfBuilding');
    var inputElement63 = $('#ValuationAssesment_valuationAssessementModel_AnnualMaintainceCost');
    var inputElement64 = $('#ValuationAssesment_valuationAssessementModel_MarketValue');
    var inputElement65 = $('#ValuationAssesment_valuationAssessementModel_Insuarance');
    var inputElement66 = $('#ValuationAssesment_valuationAssessementModel_InsuranceDetails');


    if (roleId == RoleEnum.Approver || roleId == RoleEnum.Valuer) {
        inputElement1.prop('disabled', true);
        inputElement2.prop('disabled', true);
        inputElement3.prop('disabled', true);
        inputElement6.prop('disabled', true);
        inputElement7.prop('disabled', true);
        inputElement8.prop('disabled', true);
        inputElement9.prop('disabled', true);
        inputElement10.prop('disabled', true);
        inputElement11.prop('disabled', true);
        inputElement12.prop('disabled', true);
        inputElement13.prop('disabled', true);
        inputElement14.prop('disabled', true);
        inputElement15.prop('disabled', true);
    } else {
        if (isViewHide != "2") {
            inputElement1.prop('disabled', false);
            inputElement2.prop('disabled', false);
            inputElement3.prop('disabled', false);
            inputElement7.prop('disabled', false);
            inputElement8.prop('disabled', false);
            inputElement9.prop('disabled', false);
            inputElement10.prop('disabled', false);
            inputElement11.prop('disabled', false);
            inputElement12.prop('disabled', false);
            inputElement13.prop('disabled', false);
            inputElement14.prop('disabled', false);
            inputElement15.prop('disabled', false);
        }
    }

    if (isViewHide == "2") {
        inputElement1.prop('disabled', true);
        inputElement2.prop('disabled', true);
        inputElement3.prop('disabled', true);
        inputElement6.prop('disabled', true);
        inputElement7.prop('disabled', true);
        inputElement8.prop('disabled', true);
        inputElement9.prop('disabled', true);
        inputElement10.prop('disabled', true);
        inputElement11.prop('disabled', true);
        inputElement12.prop('disabled', true);
        inputElement13.prop('disabled', true);
        inputElement14.prop('disabled', true);
        inputElement15.prop('disabled', true);
        inputElement16.prop('disabled', true);
        inputElement17.prop('disabled', true);

        inputElement42.prop('disabled', true);
        inputElement41.prop('disabled', true);
        inputElement43.prop('disabled', true);
        inputElement44.prop('disabled', true);
        inputElement45.prop('disabled', true);
        inputElement46.prop('disabled', true);
        inputElement47.prop('disabled', true);
        inputElement48.prop('disabled', true);
        inputElement49.prop('disabled', true);
        inputElement410.prop('disabled', true);
        inputElement411.prop('disabled', true);
        inputElement412.prop('disabled', true);

        inputElement51.prop('disabled', true);
        inputElement52.prop('disabled', true);
        inputElement53.prop('disabled', true);
        inputElement54.prop('disabled', true);
        inputElement55.prop('disabled', true);
        inputElement56.prop('disabled', true);

        inputElement61.prop('disabled', true);
        inputElement62.prop('disabled', true);
        inputElement63.prop('disabled', true);
        inputElement64.prop('disabled', true);
        inputElement65.prop('disabled', true);
        inputElement66.prop('disabled', true);
    } 
    */


    $("[id^='ReferenceNo']").attr("disabled", true);
    //Approvder settings
    if (roleId === RoleEnum.Approver.toString()) {
        $("#profile1 :input").attr("disabled", true);
        $("#profile4 :input").attr("disabled", true);
        $("#profile5 :input").attr("disabled", true);
        $("#profile6 :input").attr("disabled", true);

        //$('#ApproverComment').attr("disabled", false);
    }
    //Valuer settings
    else if (roleId === RoleEnum.Valuer.toString()) {
        $("#profile1 :input").attr("disabled", true);
    }
    //
    //else {
    //    $("[id*='editables'] :input").attr("disabled", false);
    //}

    //common settings  
    $('#StatusId').attr("disabled", false);
    $("#profile1 [type='button']").attr("disabled", false);
    $("#profile1 [type='submit']").attr("disabled", false);
    $("#profile1 [type='hidden']").attr("disabled", false);



    if (roleId > 0) {
        BindValuationRequestStatus(roleId, action);
        BindValuationAction()
    }

    GetValuationMethodLists();
    BindClientType();
    BindProperty();
    BindOwnership();
    BindUnitType();
    BindFurnished();
    BindCountry();
    BindLocationCountry();
    GetApproverLists();
    GetValuerLists();
    BindQuatationList();
    BindInvoiceList();
    BindPaymentInvoiceList();

    if (document.location.href.includes('id')) {
        /* if (document.getElementById('hdnClientTypeId').value != "0" || document.getElementById('hdnClientTypeId').value != '')*/

        var comingFromAPI = document.getElementById('hdnClientTypeId').value;
        var comingFromAPIClientId = document.getElementById('hdnClientId').value;
        var comingFromAPIPropertyTypeId = document.getElementById('hdnPropertyType').value;
        var comingFromAPIPropertyId = document.getElementById('hdnPropertyId').value;

        //var id =  document.getElementById('ClientTypeId').value
        // $('ClientTypeId').val() = $('hdnClientTypeId').val();
        // var ss = document.getElementById('ClientTypeId').value = document.getElementById('hdnClientTypeId').value; 

        //document.getElementById('ClientName').value
        // document.getElementById('ClientTypeId').value = ss;
        // console.log(ss);
        // console.log(document.getElementById('ClientTypeId').value);
        //console.log(document.getElementById('hdnClientTypeId').value);
        // document.getElementById("ClientTypeId").options[document.getElementById('hdnClientTypeId').value].selected = true;
        /* document.getElementById("ClientTypeId").options[ss].selected = true;*/
        /*$("#ClientTypeId").get(0).selectedIndex = document.getElementById('hdnClientTypeId').value;*/

        //console.log($("#ClientTypeId").val(comingFromAPI));

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
});


var selectedOption = $("#StatusId option:selected").text();

function BindValuationRequestStatus() {
    var ValReqId = parseInt($('#hdnId').val());
    var RequestStatus = $("#StatusId");
    var _val = $('#hdnStatusId').val();
    var _rpname = "statusName";
    var roleId = $("#hdnRoleId").val();

    BindDropdowns(GetAllValuationRequestStatus + '/' + roleId + '?action=' + action + '&ValReqId=' + ValReqId, RequestStatus, _rpname, _val);
}


function BindClientType() {

    var ClientType = $("#ClientTypeId");
    var _val = $('#hdnClientTypeId').val();
    var _rpname = "description";
    var description = DictionaryClientTypeCode;
    BindDropdownsForDictionary(GetDictionaryWithSubDetails + '?code=' + description, ClientType, _rpname, _val);
}


function BindClientByClientType(id) {
    var clients = $("#ClientId");
    var _val = $('#hdnClientId').val();
    var _rpname = "clientName";

    BindDropdowns(ClientByClientTypeId + '/' + id, clients, _rpname, _val);

    //$.ajax({
    //    type: "GET",
    //    url: $('#hdnBaseURL').val() + PropertyByIdSubType + '/' + id,
    //    "datatype": "json",
    //    success: function (response) { 

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
    var Property = $("#PropertyTypeId");
    var _val = $('#hdnPropertyType').val();
    var _rpname = "propertyType";

    BindDropdowns(PropertyList, Property, _rpname, _val);

    //$.ajax({
    //    type: "POST",
    //    url: $('#hdnBaseURL').val() + PropertyList,
    //    "datatype": "json",
    //    success: function (response) { 
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
}


function BindOwnership() {
    var OwnershipType = $("#OwnershipTypeId");
    var _val = $('#hdnOwnershipType').val();
    var _rpname = "description";
    var description = DictionaryOwnershipTypeCode;
    BindDropdownsForDictionary(GetDictionaryWithSubDetails + '?code=' + description, OwnershipType, _rpname, _val);
}

function BindPropertyDetail() {
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
        return false;
    }
    var Property = $("#PropertyId");
    var _val = $('#hdnPropertyId').val();
    var _rpname = "propertyName";

    $.ajax({
        type: Get,
        url: BaseURL + GetPropertyByFilters + '/' + PropertyTypeId + '/' + PropertySubTypeId + '/' + OwnershipTypeId,
        "datatype": "json",
        success: function (response) {
            Property.empty().append('<option selected="selected" value="0">' + dftSel + '</option>');
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
    var UnitType = $("#UnitTypeId");
    var _rpname = "description";
    var _val = $('#hdnUnitTypeId').val();
    var description = DictionaryUnitTypeCode;
    BindDropdownsForDictionary(GetDictionaryWithSubDetails + '?code=' + description, UnitType, _rpname, _val);
}

function BindFurnished() {
    var Furnished = $("#FurnishedId");
    var _val = $('#hdnFurnishedId').val();
    var _rpname = "description";
    var description = DictionaryPropertyFurnishedCode;
    BindDropdownsForDictionary(GetDictionaryWithSubDetails + '?code=' + description, Furnished, _rpname, _val);
}

function BindPropertyDetailById(Id) {
    var Amentiesdiv = $("#amentiesdiv");
    if (Id != '0') {
        $.ajax({
            type: Get,
            url: BaseURL + GetPropertyById + '/' + Id,
            "datatype": "json",
            success: function (response) {
                document.getElementById('UnitTypeId').value = response._object.unitTypeId;
                document.getElementById('AdditionalUnits').value = response._object.additionalUnits;
                document.getElementById('UnitNumber').value = response._object.unitNumber;
                document.getElementById('FurnishedId').value = response._object.furnishedId;
                document.getElementById('ValuationPurpose').value = response._object.valuationPurpose;
                document.getElementById('BuildUpAreaSqFt').value = response._object.buildUpAreaSqFt;
                document.getElementById('BuildUpAreaSqMtr').value = response._object.buildUpAreaSqMtr;
                document.getElementById('AgeOfConstruction').value = response._object.ageOfConstruction;
                document.getElementById('Parking').value = response._object.parking;
                document.getElementById('ParkingBayNo').value = response._object.parkingBayNo;
                document.getElementById('Description').value = response._object.description;
                var AmenityList = response._object.amenityList;

                for (i = 0; i < response._object.amenityList.length; i++) {
                    if (response._object.amenityList[i].isActive == true) {
                        var ob = response._object.amenityList[i];
                        Amentiesdiv.append('<label for="" class="position-relative checkboxBtn w-30">' +
                            '<input checked data-val="true" disabled="disabled" name="AmenityList[' + ob.id + '].IsActive" type="checkbox" text="[' + ob.amenityName + ']" value="true"/> ' + '<p> ' + ob.amenityName + '  </p>' +
                            '<img src="/assets/' + ob.icon + '" class="amenitiesIcon" /> </label>')
                    }
                }

                var PropertyDetails = response._object.propertyDetail;
                if (isAddValuation) {
                    document.getElementById('hdnLocationCountryId').value = PropertyDetails.countryId;
                    document.getElementById('hdnLocationStateId').value = PropertyDetails.stateId;
                    document.getElementById('hdnLocationCityId').value = PropertyDetails.cityId;
                    document.getElementById('hdnUnitTypeId').value = response._object.unitTypeId;
                    document.getElementById('hdnFurnishedId').value = response._object.furnishedId;
                }
                document.getElementById('PropertyDetail_CountryId').value = PropertyDetails.countryId;
                document.getElementById('PropertyDetail_StateId').value = PropertyDetails.stateId;
                document.getElementById('PropertyDetail_CityId').value = PropertyDetails.cityId;
                document.getElementById('PropertyDetail_Zone').value = PropertyDetails.zone;
                document.getElementById('PropertyDetail_BuildingProject').value = PropertyDetails.buildingProject;
                document.getElementById('PropertyDetail_Latitude').value = PropertyDetails.latitude;
                document.getElementById('PropertyDetail_Longitude').value = PropertyDetails.longitude;
                document.getElementById('PropertyDetail_Address1').value = PropertyDetails.address1;
                document.getElementById('PropertyDetail_Address2').value = PropertyDetails.address2;
                document.getElementById('PropertyDetail_Pincode').value = PropertyDetails.pincode;
                document.getElementById('PropertyDetail_Landmark').value = PropertyDetails.landmark;

                BindLocationCountry();
                BindLocationState(PropertyDetails.countryId);
                BindLocationCity(PropertyDetails.stateId);

                if (isAddValuation) {
                    BindUnitType();
                    BindFurnished();
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
}

function BindCountry() {
    var countryId = $("#CountryId");
    var _val = $('#hdnCountry').val();
    var _rpname = "countryName";

    BindDropdowns(CountryList, countryId, _rpname, _val);
}

function BindLocationCountry() {
    var countryId = $("#PropertyDetail_CountryId");
    var _val = $('#hdnLocationCountryId').val();
    var _rpname = "countryName";

    BindDropdowns(CountryList, countryId, _rpname, _val);
}
function BindState(id) {
    var state = $("#StateId");
    var _val = $('#hdnState').val();
    var _rpname = "stateName";

    $.ajax({
        type: "GET",
        url: BaseURL + stateListUrl + '/' + id,
        "datatype": "json",
        success: function (response) {
            $("#StateId").val(function () {
                return response[0].stateName;//this.value + number;
            });
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

function BindLocationState(id) {
    var state = $("#PropertyDetail_StateId");
    var _val = $('#hdnLocationStateId').val();
    var _rpname = "stateName";

    $.ajax({
        type: "GET",
        url: BaseURL + stateListUrl + '/' + id,
        "datatype": "json",
        success: function (response) {
            state.empty().append('<option selected="selected" value="0">-- select --</option>');
            for (var i = 0; i < response.length; i++) {
                state.append($("<option></option>").val(response[i].id).html(response[i].stateName));
            }
            if ($('#hdnLocationStateId').val() != 0) {
                state.val($('#hdnLocationStateId').val());
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

    $.ajax({
        type: "GET",
        url: BaseURL + cityListUrl + '/' + id,
        "datatype": "json",
        success: function (response) {
            $("#CityId").val(function () {
                return response[0].cityName;
            });
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

function BindLocationCity(id) {
    var city = $("#PropertyDetail_CityId");
    var _val = $('#hdnLocationCityId').val();
    var _rpname = "cityName";

    $.ajax({
        type: "GET",
        url: BaseURL + cityListUrl + '/' + id,
        "datatype": "json",
        success: function (response) {
            city.empty().append('<option selected="selected" value="0">-- select --</option>');
            for (var i = 0; i < response.length; i++) {
                city.append($("<option></option>").val(response[i].id).html(response[i].cityName));
            }
            if ($('#hdnLocationCityId').val() != 0) {
                city.val($('#hdnLocationCityId').val());
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
    $.ajax({
        type: Get,
        url: BaseURL + GetClientDetailById + '/' + Id,
        "datatype": "json",
        success: function (response) {
            //document.getElementById('ClientName').value = response._object.clientName;
            document.getElementById('LicenseNumber').value = response._object.licenseNumber;

            const inputDateString = response._object.trnexpiryDate;
            const inputDate = new Date(inputDateString);
            const formattedDate = formatDateTo_ddMMMyyyy(inputDate);
            document.getElementById('TrnexpiryDate').value = formattedDate;

            document.getElementById('Trnnumber').value = response._object.trnnumber;
            //document.getElementById('Trnnumber').value = response._object.address.address1;
            //document.getElementById('CountryId').value = response._object.address.countryId;
            //if (response._object.address.countryId) {
            //    BindState(response._object.address.countryId);
            //}
            ////var HdnStateId = $('#hdnState').val();
            //if (response._object.address.stateId) {
            //    BindCity(response._object.address.stateId);
            //}
            //document.getElementById('StateId').value = response._object.address.stateId;
            //document.getElementById('CityId').value = response._object.address.cityId;
            //document.getElementById('PinCode').value = response._object.address.pinNo;

            if (response._object.addresses.length > 0) {
                $('#NewAddressTable tbody').html('');
                $.each(response._object.addresses, function (index, object) {
                    $('#NewAddressTable tbody').append(' <tr><td>' + object.address1 + '</td> <td>' + object.address2 + '</td><td>' + object.countryName
                        + '</td><td>' + object.stateName + '</td><td>' + object.cityName + '</td><td>' + object.pinNo + '</td></tr>');
                })
            }

            if (response._object.contacts.length > 0) {
                $('#NewContactTable tbody').html('');
                $.each(response._object.contacts, function (index, object) {
                    $('#NewContactTable tbody').append(' <tr><td>' + object.contactPersonName + '</td> <td>' + object.department + '</td><td>' + object.designation
                        + '</td><td>' + object.email + '</td><td>' + object.mobile + '</td></tr>');
                })
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
    var currentUserId = LogInUserId;

    BindDropdowns(GetApproverList + '/' + currentUserId + '/Approver', statusId, _rpname, _val);

}

function GetValuerLists() {

    var statusId = $("#ValuerId");
    var _val = $('#hdnValuerId').val();
    var _rpname = "userName";
    var currentUserId = LogInUserId;

    BindDropdowns(GetValuerList + '/' + currentUserId + '/Valuer', statusId, _rpname, _val);

}


function GetValuationMethodLists() {
    var statusId = $("#ValuationModeId");
    var _val = $('#hdnValuationModeId').val();
    var _rpname = "description";
    //var description = "Valuation Method";
    // var currentUserId = "@ViewBag.CurrentUserId";

    var description = DictionaryValuationMethodCode;
    BindDropdownsForDictionary(GetDictionaryWithSubDetails + '?code=' + description, statusId, _rpname, _val); 
}


$('#btnSaveApprove').on('click', function () {
    //var approverComment = $("#ApproverComment").val() === undefined ? "" : $("#ApproverComment").val();
    var _id = $("#Id").val();
    var statusId = $("#StatusId").val();
    var oldStatusId = $('#hdnStatusId').val();
    var requestId = $('#hdnId').val();
    if (requestId > 0) {
        if (statusId != oldStatusId) {
            $('#ValuationApproverAction').modal('show');
            isSaveBtn = 1;
            return false;

        }
        else {
            return true;
        }
    }
    //var request = {
    //    Id: _id,
    //    StatusId: $("#StatusId").val(),
    //    //ApproverComment: approverComment,
    //    Comment: approverComment,
    //    LogInUserId: LogInUserId
    //};

    //UpdateValuationStatus(request);
});

$('#btnSaveEdit').on('click', function () {

    var statusId = $("#StatusId").val();
    var oldStatusId = $('#hdnStatusId').val();
    var requestId = $('#hdnId').val();
    if (requestId > 0) {
        if (statusId != oldStatusId) {
            $('#ValuationApproverAction').modal('show');
            isSaveBtn = 1;
            return false;

        }
        else {
            return true;
        }
    }
});

function UpdateValuationStatus(request) {

    $.ajax({
        type: "POST",
        url: BaseURL + UpdateRequestStatus,
        "datatype": "json",
        headers: {
            'Accept': 'application/json',
            'Content-Type': 'application/json'
        },

        data: JSON.stringify(ValutionRequestForApproverModel),
        success: function (response) {
            toastr.success(SucessMsg);
            setTimeout(function () {
                window.location.href = "/ValuationRequest/ValuationRequestManage?id=" + _id;
            }, 1000);
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


function BindQuatationList() { 
    let id = $('#hdnId').val();
    $.ajax({
        type: Get,
        url: BaseURL + ValuationQuatationList + '?requestId=' + id,
        "datatype": "json",
        success: function (response) {
            if (response != null) {
                $.each(response, function (index, object) {
                    var html = '';

                    var url = '/ValuationRequest/ValuationQuotationManage?id=' + object.id + '&vId=' + id;
                    html += '<img src="../assets/dots-vertical.svg" alt="dots-vertical" class="activeDots" /> <div class="actionItem"><ul>'
                    html += '<li><a title="View" href=' + url + '><img src="../assets/view.svg" alt="view" />View</a></li>';
                    if (view == 2) {
                        html += '<li style="display:none"><a title="Delete" data-toggle="modal" data-target="#DeleteQuotationModel" data-backdrop="static" data-keyboard="false" onclick="ConfirmationDeleteQuotation(' + object.id + ');"><img src="../assets/trash.svg" alt="trash" />Delete</a></li>';
                    }
                    else {
                        html += '<li><a title="Delete" data-toggle="modal" data-target="#DeleteQuotationModel" data-backdrop="static" data-keyboard="false" onclick="ConfirmationDeleteQuotation(' + object.id + ');"><img src="../assets/trash.svg" alt="trash" />Delete</a></li>';
                    }
                    html += '</ul></div>';

                    $('#QuatationTable tbody').append(' <tr id="' + object.id + '"><td><a href=' + url + '>' + object.referenceNo + '</a></td> <td class="formatting">' + object.valuationFee + '</td><td class="formatting">' + object.vat
                        + '</td><td class="formatting">' + object.otherCharges + '</td><td class="formatting">' + object.discount + '</td><td class="formatting">' + object.totalFee + '</td><td>' + object.userName + '</td> <td>' + moment(object.createdDate).format('DD-MMM-YYYY') + '</td><td>' + html + '</td></tr>');
                });
                formatCurrencyInElements('formatting');
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
            if (response != null) {
                $.each(response, function (index, object) {
                    var html = '';

                    var url = '/ValuationRequest/ValuationInvoiceManage?id=' + object.id + '&vId=' + id;
                    html += '<img src="../assets/dots-vertical.svg" alt="dots-vertical" class="activeDots" /> <div class="actionItem"><ul>'
                    html += '<li><a title="View" href=' + url + '><img src="../assets/view.svg" alt="view" />View</a></li>';
                    if (view == 2) {
                        html += '<li style="display:none"><a title="Delete" data-toggle="modal" data-target="#DeleteInvoiceModel" data-backdrop="static" data-keyboard="false" onclick="ConfirmationDeleteInvoice(' + object.id + ');"><img src="../assets/trash.svg" alt="trash" />Delete</a></li>';
                    }
                    else {
                        html += '<li><a title="Delete" data-toggle="modal" data-target="#DeleteInvoiceModel" data-backdrop="static" data-keyboard="false" onclick="ConfirmationDeleteInvoice(' + object.id + ');"><img src="../assets/trash.svg" alt="trash" />Delete</a></li>';
                    }
                    html += '</ul></div>';

                    $('#PaymentTable tbody').append(' <tr id="' + object.id + '"><td><a href=' + url + '>' + object.referenceNo + '</a></td><td>' + moment(object.transactionDate).format('DD-MMM-YYYY') + '</td><td>' + object.transactionMode
                                                    + '</td><td>' + object.transactionStatusName + '</td><td class="formatting">' + object.amount + '</td><td>' + object.userName + '</td><td>' + moment(object.createdDate).format('DD-MMM-YYYY') + '</td><td>' + html + '</td></tr>');
                });
                formatCurrencyInElements('formatting');
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

function BindPaymentInvoiceList() {
    let id = $('#hdnId').val();
    $.ajax({
        type: Get,
        url: BaseURL + GetPaymentInvoiceById + '?requestId=' + id,
        "datatype": "json",
        success: function (response) {
            if (response != null) { 
                $.each(response._object, function (index, object) {
                    var html = '';
                    var url = '/ValuationRequest/ValuationPaymentInvoiceManage?id=' + object.id + '&vId=' + id;
                    html += '<img src="../assets/dots-vertical.svg" alt="dots-vertical" class="activeDots" /> <div class="actionItem"><ul>'
                    html += '<li><a title="View" href=' + url + '><img src="../assets/view.svg" alt="view" />View</a></li>';
                    if (view == 2) {
                        html += '<li style="display:none"><a title="Delete" data-toggle="modal" data-target="#DeletePaymentInvoiceModel" data-backdrop="static" data-keyboard="false" onclick="ConfirmationDeletePaymentInvoice(' + object.id + ');"><img src="../assets/trash.svg" alt="trash" />Delete</a></li>';
                    }
                    else {
                        html += '<li><a title="Delete" data-toggle="modal" data-target="#DeletePaymentInvoiceModel" data-backdrop="static" data-keyboard="false" onclick="ConfirmationDeletePaymentInvoice(' + object.id + ');"><img src="../assets/trash.svg" alt="trash" />Delete</a></li>';
                    }
                    html += '</ul></div>';

                    $('#InvoiceTable tbody').append(' <tr id="' + object.id + '"><td><a href=' + url + '>' + object.referenceNO + '</a></td><td>' + object.invoiceNo + '</td><td>' + moment(object.transactionDate).format('DD-MMM-YYYY') + '</td><td>' + object.transactionMode
                        + '</td><td class="formatting">' + object.amount + '</td><td>' + object.userName + '</td><td>' + moment(object.createdDate).format('DD-MMM-YYYY') + '</td><td>' + html + '</td></tr>');
                });
                formatCurrencyInElements('formatting');
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



//#region Delete Quotation
function ConfirmationDeleteQuotation(id) {
    $('#DeleteQuotationModel #Id').val(id);
}
function DeleteQuotation() {
    if (isDeleteQt) {
        var tempInAtiveID = $('#DeleteQuotationModel #Id').val();
        var by = LogInUserId;
        ajaxServiceMethod(BaseURL + DeleteQuotationByIdUrl + "/" + tempInAtiveID + "?by=" + by, Post, DeleteQuotationByIdSuccess, DeleteQuotationByIdError);
    }

    else {
        toastr.error(DeleteAccessDenied);
    }
}
function DeleteQuotationByIdSuccess(data) {
    try {
        if (data._Success === true) {
            var deletedId = $('#DeleteQuotationModel #Id').val();
            $('#' + deletedId).remove();

            toastr.success(RecordDelete);
            //$('#' + tableId).DataTable().draw();
        }
        else {
            toastr.error(data._Message);
        }
    } catch (e) {
        toastr.error('Error:' + e.message);
    }
}
function DeleteQuotationByIdError(x, y, z) {
    toastr.error(ErrorMessage);
}
//#endregion Delete Quotation


//#region Delete Invoice
function ConfirmationDeleteInvoice(id) {
    $('#DeleteInvoiceModel #Id').val(id);
}
function DeletePayment() {
    invoiceId = $('#DeleteInvoiceModel #ID').val()
    var by = LogInUserId;
    if (isDeleteIn) {
        var tempInAtiveID = $('#DeleteInvoiceModel #Id').val();
        ajaxServiceMethod(BaseURL + DeleteInvoiceByIdUrl + "/" + tempInAtiveID + "?by=" + by, Post, DeleteInvoiceByIdSuccess, DeleteInvoiceByIdError);
    }
    else {
        toastr.error(DeleteAccessDenied);
    }
}
function DeleteInvoiceByIdSuccess(data) {
    try {
        if (data._Success === true) {
            invoiceCurrentId = $('#DeleteInvoiceModel #Id').val()
            /*$('#' + tableId).DataTable().draw();*/
            $('#' + invoiceCurrentId).remove();
            toastr.success(RecordDelete);
        }
        else {
            toastr.error(data._Message);
        }
    } catch (e) {
        toastr.error('Error:' + e.message);
    }
}
function DeleteInvoiceByIdError(x, y, z) {
    toastr.error(ErrorMessage);
}

//invoice Payment

function ConfirmationDeletePaymentInvoice(id) {
    $('#DeletePaymentInvoiceModel #Id').val(id);
}
function DeleteInvoice() {
    invoiceId = $('#DeletePaymentInvoiceModel #ID').val()
    var by = LogInUserId;
    if (isDeleteIn) {
        var tempInAtiveID = $('#DeletePaymentInvoiceModel #Id').val();
        ajaxServiceMethod(BaseURL + DeletePyamentInvoice + "/" + tempInAtiveID + "?by=" + by, Delete, DeletePaymentInvoiceByIdSuccess, DeletePaymentInvoiceByIdError);
    }
    else {
        toastr.error(DeleteAccessDenied);
    }
}
function DeletePaymentInvoiceByIdSuccess(data) {
    try {
        if (data._Success === true) {
            invoiceCurrentId = $('#DeletePaymentInvoiceModel #Id').val()
            /*$('#' + tableId).DataTable().draw();*/
            $('#' + invoiceCurrentId).remove();
            toastr.success(RecordDelete);
        }
        else {
            toastr.error(data._Message);
        }
    } catch (e) {
        toastr.error('Error:' + e.message);
    }
}
function DeletePaymentInvoiceByIdError(x, y, z) {
    toastr.error(ErrorMessage);
}

document.getElementById('tab_4').addEventListener('click', function () {
    // Create an alert or call your desired function when the button is clicked
    changeLinksite();
});


// Add a click event listener to the button
document.getElementById('tab_5').addEventListener('click', function () {
    // Create an alert when the button is clicked
    changeLinkevidence();
});
document.getElementById('tab_6').addEventListener('click', function () {
    // Create an alert when the button is clicked
    changeLinkassesment();
});



// Assuming some event triggers this change


document.getElementById('defaultOpen').addEventListener('click', function () {
    // Call your desired function when the button is clicked
    changeLinkvaluation();
});


function changeLinksite() {
    let id = $('#siteId').val();

    // Get the anchor element by its id
    var myLink = document.getElementById('myLink');

    // Change the href attribute to the new link
    myLink.setAttribute('href', '/AuditLog/AuditLogDetailList?TableName=SiteDescription&TableKey=' + id);
}

function changeLinkevidence() {
    let id = $('#compId').val();

    // Get the anchor element by its id
    var myLink = document.getElementById('myLink');

    // Change the href attribute to the new link
    myLink.setAttribute('href', '/AuditLog/AuditLogDetailList?TableName=Comparable_Evidence&TableKey=' + id);
}


function changeLinkassesment() {
    let id = $('#assesmentId').val();

    // Get the anchor element by its id
    var myLink = document.getElementById('myLink');

    // Change the href attribute to the new link
    myLink.setAttribute('href', '/AuditLog/AuditLogDetailList?TableName=Valuation_Assessement&TableKey=' + id);
}

function changeLinkvaluation() {
    let id = $('#valuationdetailsId').val();

    // Get the anchor element by its id
    var myLink = document.getElementById('myLink');

    // Change the href attribute to the new link
    myLink.setAttribute('href', '/AuditLog/AuditLogDetailList?TableName=ValuationRequest&TableKey=' + id);
}

function updateHiddenInput() {
    var selectedValues = [];
    ["ApproverLevelId_2", "ApproverLevelId_3"].forEach(function (lId) {
        var dropdownId = "select[id^='" + lId + "']";
        var selectedValue = $(dropdownId).val();

        if (selectedValue) {
            var id = lId.match(/\d+/)[0];
            selectedValues.push(id + "," + selectedValue);
        }
    });

    $("#Valuationapprovalvalues").val(selectedValues.join(";"));
}

function BindValuationAction() {
    var ValReqId = parseInt($('#hdnId').val());
    var RequestStatus = $("#StatusId");
    var _val = $('#hdnStatusId').val();
    var _rpname = "statusName";
    var roleId = $("#hdnRoleId").val();

    $.ajax({
        type: Get,
        url: BaseURL + GetAllValuationRequestStatus + '/' + roleId + '?action=' + action + '&ValReqId=' + ValReqId,
        "datatype": "json",
        success: function (response) {
            $('#ValuationActions ul').html('');
           
            $.each(response, function (index, object) {

              //old  //$('#ValuationActions ul').append(' <li /*class="tableStatusBanner"*/ style="text-align:center; display: block; margin: 0 10px; color:' + object.colorCode + '; background-color:' + object.backGroundColor + '; border: 1px solid ' + object.colorCode + ';" onclick="CheckValuationAction(' + object.id + ');"><span style="text-align:center;">' + object.statusName + '</span></li>');
                $('#ValuationActions ul').append(' <li style="justify-content: center" onclick="CheckValuationAction(' + object.id + ');"><span class="tableStatusBanner" style="text-align:center; display: block; margin: 0 10px; color:' + object.colorCode + '; background-color:' + object.backGroundColor + '; border: 1px solid ' + object.colorCode + ';">' + object.statusName + '</span></li>');

            })
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


function CheckValuationAction(statusId) {
    debugger
    var oldStatusId = $('#hdnStatusId').val();
    var requestId = $('#hdnId').val();
    if (requestId > 0) {
        if (statusId != oldStatusId) {
            $('#ValuationApproverAction').modal('show');
            $('#hdnActionStatusId').val(statusId);
            isSaveBtn = 0;
            //return false;
        }
        else {
            toastr.error("Status already exist for this Request.");
        }
    }
}

function AssignApproverAction() {

    var statusId = $('#hdnActionStatusId').val();
    var comment = $('#ActionComment').val();
    var requestId = $('#hdnId').val();

    if (comment == "") {
        toastr.error("Please enter comment.");
        return false;
    }    
    if (isSaveBtn == 1) {
        statusId = $("#StatusId").val();
    }
    var modelReq = {
        Id: requestId,
        StatusId: statusId,
        ApproverComment: comment,
        Comment: comment,
        LogInUserId: LogInUserId
    };

    $.ajax({
        type: "POST",
        url: BaseURL + UpdateRequestStatus,
        "datatype": "json",
        headers: {
            'Accept': 'application/json',
            'Content-Type': 'application/json'
        },
        data: JSON.stringify(modelReq),
        success: function (response) {
            toastr.success(SucessMsg);
            setTimeout(function () {
                window.location.href = "/ValuationRequest/ValuationRequestManage?id=" + requestId;
            }, 1000);
        },
        failure: function (response) {
            toastr.error("Error is occured.")
        },
        error: function (response) {
            toastr.error(response)
            $("#loader").hide();
        }
    });
}


//#endregion Delete Invoice