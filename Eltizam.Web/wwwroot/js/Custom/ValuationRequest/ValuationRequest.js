var tableId = "ValuationRequestTable";
$(document).ready(function () {
    InitializeValutionRequestDataList();
});

//Load data into table
function InitializeValutionRequestDataList() {
    var setDefaultOrder = [0, 'asc'];
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
            "data": "valuationDate", "name": "Valuation Date"
        },
        {
            "data": "requestor", "name": "Requestor"
        },
        {
            "data": "valuator", "name": "Valuator"
        },
        {
            "data": "approver", "name": "Approver"
        },
        {
            "data": "statusName", "name": "Status"
        },
        //{
        //    "data": "isActive", "name": "Active", "render": function (data, type, row, meta) {
        //        return GetActiveFlagCss(data);
        //    }
        //},
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
