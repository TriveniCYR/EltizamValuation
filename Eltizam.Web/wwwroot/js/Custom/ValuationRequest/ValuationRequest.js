﻿var tableId = "ValuationRequestTable";
$(document).ready(function () {
    InitializeValutionRequestDataList();
});

//Load data into table
function InitializeValutionRequestDataList() {
    debugger
    var setDefaultOrder = [1, 'asc'];
    var ajaxObject = {
        "url": BaseURL + GetAll,
        "type": "POST",
        "data": function (d) {
            var pageNumber = $('#' + tableId).DataTable().page.info();
            d.PageNumber = pageNumber.page;
        },
        "datatype": "json"
    };
    var columnObject = [
        
        {
            "data": "referenceNO",
            "name": "ReferenceNO",
            "render": function (data, type, row, meta) {
                var html = '';
                html += '<div class="checkboxColumn">'
                html += '<input type="checkbox"  height:10px; width:10px; /><span>' + row.referenceNO + '</span></div> '
                return html;
            }
        },
        {
            "data": "id", "name": "Id"
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
                // Define a custom CSS style based on the color code
                var statusStyle = "color: " + statusColorCode;
                //var statusStyle = "background-color: " + statusColorCode + "; color: statusColorCode;";
                return '<span style="' + statusStyle + '">' + data + '</span>';
            }

        },

        {
            "data": "action", className: 'notexport actionColumn', "name": "Action", "render": function (data, type, row, meta) {
                var html = '';
                html += '<img src="../assets/dots-vertical.svg" alt="dots-vertical" class="activeDots" /> <div class="actionItem"><ul>'
                html += '<li><a title="View" href="/MasterPropertyType/PropertyTypeDetail?id=' + row.id + '"><img src="../assets/view.svg" alt="view" />View</a></li>';
                html += '<li><a title="Edit" href="/MasterPropertyType/PropertyTypeManage?id=' + row.id + '"><img src="../assets/edit.svg" alt="edit" />Edit</a></li>';
                html += '<li><a title="Delete" data-toggle="modal" data-target="#DeletePropertyTypeModel" data-backdrop="static" data-keyboard="false" onclick="ConfirmationDeletePropertyType(' + row.id + ');"><img src="../assets/trash.svg" alt="trash" />Delete</a></li>';
                html += '</ul></div>';

                return html;
            }
        }
    ];



    IntializingDataTable(tableId, setDefaultOrder, ajaxObject, columnObject);
}

function CheckAssignId(id, eve) {
    debugger
}
//#region Delete Role  
function ConfirmationDeletePropertyType(id) {
    debugger;
    $('#DeletevalutionRequestModel #Id').val(id);
}
function DeletePropertyType() {
    var tid = $('#DeletevalutionRequestModel #Id').val();
    ajaxServiceMethod(BaseURL + DeleteByIdUrl + "/" + tid, Delete, DeleteUserByIdSuccess, DeleteUserByIdError);
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
