﻿var tableId = "ValuationFeesTable";
$(document).ready(function () {
    InitializeDataList();
});


//#region Delete User
function ConfirmationDeleteValuationFees(id) {
    $('#DeleteValuationFeesModel #Id').val(id);
}
function DeleteValuationFees() {
    if (IsDeletePerm) {
        var tempInAtiveID = $('#DeleteValuationFeesModel #Id').val();
        var by = LogInUserId;
        ajaxServiceMethod(BaseURL + DeleteValuationByIdUrl + "/" + tempInAtiveID + "?by=" + by, Delete, DeleteUserByIdSuccess, DeleteFailure);
    }
    else {
        toastr.error(DeleteAccessDenied);
    }
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

 

function InitializeDataList() {
    var setDefaultOrder = [0, 'desc'];
    var ajaxObject = {
        "url": BaseURL + ValuationFees,
        "type": Post,
        "data": function (d) {
            var pageNumber = $('#' + tableId).DataTable().page.info();
            d.PageNumber = pageNumber.page;
        },
        "datatype": "json"
    };
    var columnObject = [
        {
            "data": "id", "name": "Id", "render": function (data, type, row, meta) {
                return '<a href="/MasterValuationFee/ValuationFeeDetail?id=' + row.id + '&IsView=1" title="View">' + data + '</a>';

            }
        },
        {
            "data": "valuationType", "name": "Valuation Type"
        },
        {
            "data": "propertyType", "name": "Property Type"
        },
        {
            "data": "clientType", "name": "Client Type"
        },
        {
            "data": "valuationFeeType", "name": "Valuation Fee Type"
        },
        {
            "data": "totalValuationFees", "name": "Total Valuation Fees"
        },
        //{
        //    "data": "fixedvaluationFees", "name": "FixedvaluationFees"
        //},
        {
            "data": "isActive", "name": "Active", "render": function (data, type, row, meta) {
                return GetActiveFlagCss(data);
            }
        },
        {
            "data": "action", className: 'notexport actionColumn', "name": "Action", "render": function (data, type, row, meta) {
                var html = '';
                html += '<img src="../assets/dots-vertical.svg" alt="dots-vertical" class="activeDots" /> <div class="actionItem"><ul>'
                html += '<li><a title="View" href="/MasterValuationFee/ValuationFeeDetail?id=' + row.id + '"><img src="../assets/view.svg" alt="view" />View</a></li>';
                html += '<li><a title="Edit" href="/MasterValuationFee/ValuationFeeManage?id=' + row.id + '"><img src="../assets/edit.svg" alt="edit" />Edit</a></li>';
                html += '<li><a title="Delete" data-toggle="modal" data-target="#DeleteValuationFeesModel" data-backdrop="static" data-keyboard="false" onclick="ConfirmationDeleteValuationFees(' + row.id + ');"><img src="../assets/trash.svg" alt="trash" />Delete</a></li>';
                html += '</ul></div>';

                return html;
            }
        }
    ];

    IntializingDataTable(tableId, setDefaultOrder, ajaxObject, columnObject);
}


//#endregion