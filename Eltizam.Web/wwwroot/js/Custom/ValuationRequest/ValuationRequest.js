var tableId = "ValuationRequestTable";
$(document).ready(function () {
    InitializeValutionRequestDataList(); 
});

//Load data into table
function InitializeValutionRequestDataList() { 
   
    $("#ValuationRequestTable").dataTable().fnDestroy();
    var userName = $("#UserName").val() === undefined ? "" : $("#UserName").val();
    var clientName = $("#ClientName").val() === undefined ? "" : $("#ClientName").val();
    var propertyName = $("#PropertyName").val() === undefined ? "" : $("#PropertyName").val();
    var requestStatusId = $("#RequestStatusId").val();
    var propertyTypeId = $("#PropertyTypeId").val();
    if (propertyTypeId === undefined || isNaN(parseInt(propertyTypeId))) {
        propertyTypeId = 0; // Set a default value when the input is not a valid integer.
    } else {
        propertyTypeId = parseInt(propertyTypeId);
    }

    if (requestStatusId === undefined || isNaN(parseInt(requestStatusId))) {
        requestStatusId = 0; // Set a default value when the input is not a valid integer.
    } else {
        requestStatusId = parseInt(requestStatusId);
    }

    var countryId = $("#CountryId").val();
    if (countryId === undefined || isNaN(parseInt(countryId))) {
        countryId = 0; // Set a default value when the input is not a valid integer.
    } else {
        countryId = parseInt(countryId);
    }

    var stateId = $("#StateId").val();

    if (stateId === undefined || isNaN(parseInt(stateId))) {
        stateId = 0; // Set a default value when the input is not a valid integer.
    } else {
        stateId = parseInt(stateId);
    }

    var cityId = $("#CityId").val();
    if (cityId === undefined || isNaN(parseInt(cityId))) {
        cityId = 0; // Set a default value when the input is not a valid integer.
    } else {
        cityId = parseInt(cityId);
    }

    var resourceId = $("#ResourceId").val();
    if (resourceId === undefined || isNaN(parseInt(resourceId))) {
        resourceId = 0; // Set a default value when the input is not a valid integer.
    } else {
        resourceId = parseInt(resourceId);
    }

    var fromDate = $("#FromDate").val() === undefined ? "" : $("#FromDate").val();

    var toDate = $("#ToDate").val() === undefined ? "" : $("#ToDate").val();

    var setDefaultOrder = [0, 'asc'];
    var ajaxObject = {
        "url": BaseURL + GetAll + "?userName=" + userName + "&clientName=" + clientName + "&propertyName=" + propertyName + "&requestStatusId=" + requestStatusId + "&resourceId=" + resourceId + '&propertyTypeId=' + propertyTypeId + '&countryId=' + countryId + '&stateId=' + stateId + '&cityId=' + cityId + '&fromDate=' + fromDate + '&toDate=' + toDate,

        "type": "POST",
        "data": function (d) {
            var pageNumber = $('#' + tableId).DataTable().page.info();
            d.PageNumber = pageNumber.page;
        },
        "datatype": "json"
    };


    var columnObject = [

        {
            "data": "id", "name": "Id",
            "render": function (data, type, row, data) {
                return '<div class="checkboxColumn"><input type="checkbox" value="' + row.id + '"><span>' + row.id + '</span><div>';
            }
        },
        {
            "data": "referenceNO", "name": "ReferenceNO"
        },

        {
            "data": "clientName", "name": "Client Name"
        },
        {
            "data": "clientType", "name": "Client Type"
        },
        {
            "data": "location", "name": "Location"
        },
        {
            "data": "propertyName", "name": "Property Use Type"
        },
        {
            "data": "valuationPurpose", "name": "Valuation Purpose"
        },

        {
            "data": "methodOfValution", "name": "Method of Valuation"
        },
        {
            "data": "valuationDate",
            "name": "Valuation Date",
            "render": function (data, type, row, data) {
                return moment(row.valuationDate).format('DD-MMM-YYYY');
            }
        },

        {
            "data": "requestor", "name": "Requestor"
        },

        {
            "data": "approver", "name": "Approver"
        },
        {
            "data": "valuator", "name": "Valuator"
        },

        {

            "data": "statusName",
            "name": "Status",
            "render": function (data, type, row, meta) {
                var statusColorCode = row.colorCode;
                var backGroundColor = row.backGroundColor;
                // Define a custom CSS style based on the color code
                //var statusStyle = "color: " + statusColorCode;
                var statusStyle = "color: " + statusColorCode + "; background-color: " + backGroundColor;
                return '<span style="' + statusStyle + '">' + data + '</span>';
            }

        },

        {
            "data": "action", className: 'notexport actionColumn', "name": "Action", "render": function (data, type, row, meta) {
                var html = '';
                html += '<img src="../assets/dots-vertical.svg" alt="dots-vertical" class="activeDots" /> <div class="actionItem"><ul>'
                html += '<li><a title="View" href="/MasterPropertyType/PropertyTypeDetail?id=' + row.id + '"><img src="../assets/view.svg" alt="view" />View</a></li>';
                html += '<li><a title="Edit" href="/ValuationRequest/ValuationRequestManage?id=' + row.id + '"><img src="../assets/edit.svg" alt="edit" />Edit</a></li>';
                html += '<li><a title="Delete" data-toggle="modal" data-target="#DeletevalutionRequestModel" data-backdrop="static" data-keyboard="false" onclick="ConfirmationDeleteValuationRequest(' + row.id + ');"><img src="../assets/trash.svg" alt="trash" />Delete</a></li>';
                html += '</ul></div>';

                return html;
            }
        }
    ];



    IntializingDataTable(tableId, setDefaultOrder, ajaxObject, columnObject);
}

function CheckAssignId(id, eve) { 
}
//#region Delete Role  
function ConfirmationDeleteValuationRequest(id) { 
    $('#DeletevalutionRequestModel #Id').val(id);
}
function DeleteValuationRequestType() {
    var tid = $('#DeletevalutionRequestModel #Id').val();
    debugger;
    ajaxServiceMethod(BaseURL + ValuationRequestDeleteById + "/" + tid, Delete, DeleteUserByIdSuccess, DeleteUserByIdError);
}
function DeleteUserByIdSuccess(data) {
    try {
        if (data._Success === true) {
            toastr.success(RecordDelete);
            $('#' + tableId).DataTable().draw();
        }
        else {
            toastr.error(data._Message);
        }
    } catch (e) {
        toastr.error('Error:' + e.message);
    }
}
function DeleteUserByIdError(x, y, z) {
    toastr.error(ErrorMessage);
}

$("#cbSelectAll").on("click", function () {
    var ischecked = this.checked;
    $("#ValuationRequestTable  tbody").find("input:checkbox").each(function () {
        this.checked = ischecked;
    });
});


function AssignRequest() { 
   
    var approverId = $("#ApproverId").val();
    var remarks = $("#Remarks").val();
    var ids = '';

    $("#ValuationRequestTable  tbody").find("input:checkbox:checked").each(function () { 
        ids += this.value + ','; 
    });
    ids = ids.replace(/(^[,\s]+)|([,\s]+$)/g, '');


     
    if (approverId === undefined || isNaN(parseInt(approverId))) {
        toastr.error("Please select approver.");
        return false;
    }
    else if (remarks == '') {
        toastr.error("Please add remarks comments.");
        return false;
    }
    else if (ids.length == 0) {
        toastr.error("Please select atleast one valuation request.");
        return false;
    } 

    var modelReq = {
        'RequestIds': ids,
        'ApprovorId': parseInt(approverId),
        'Remarks': remarks
    } 

    $.ajax({
        type: "POST",
        url: BaseURL + AssignApproverUrl,
        "datatype": "json",
        headers: {
            'Accept': 'application/json',
            'Content-Type': 'application/json'
        },
        data: JSON.stringify(modelReq),
        success: function (response) {
            assignToggle();
            toastr.success("Valuation Request(s) assinged to Approver.");

            InitializeValutionRequestDataList();
            /*window.location.href = "/ValuationRequest/ValuationRequests";*/
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
