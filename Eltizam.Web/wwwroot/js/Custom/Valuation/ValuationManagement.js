var tableId = "ValuationFeesTable";
$(document).ready(function () {
    InitializeUserList();
});


//#region Delete User
function ConfirmationDeleteUser(id) {
    $('#DeleteValuationFeesModel #Id').val(id);
}
function DeleteUser() {
    debugger
    var tempInAtiveID = $('#DeleteValuationFeesModel #Id').val();
    ajaxServiceMethod($('#hdnBaseURL').val() + DeleteUserByIdUrl + "/" + tempInAtiveID, 'POST', DeleteUserByIdSuccess, DeleteUserByIdError);
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

function InitializeUserList() {
   debugger
    var setDefaultOrder = [0, 'asc'];
    var ajaxObject = {
        "url": $('#hdnBaseURL').val() + ValuationFees,
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
        {            "data": "isActive", "name": "Active", "render": function (data, type, row, meta) {
                return GetActiveFlagCss(data);
            }
        },
        {
            "data": "action", className: 'notexport actionColumn', "name": "Action", "render": function (data, type, row, meta) {
                var html = '';
                html += '<a title="Edit" class="large-font"  href="/ValuationFees/ValuationFeesManage?id=' + row.id + '"><img src="../assets/edit.svg" alt = "edit" />';
                html += '<a title="Delete" class="large-font text-danger" data-toggle="modal" data-target="#DeleteUserModel" data-backdrop="static" data-keyboard="false" onclick="ConfirmationDeleteUser(' + row.id + ');"><i class="fa fa-fw fa-trash mr-1"></i></a>';
                html += '<a title="Delete" class="large-font text-danger" data-toggle="modal" data-target="#DeleteUserModel" data-backdrop="static" data-keyboard="false" onclick="ConfirmationDeleteUser(' + row.userId + '); return false;"><i class="fa fa-fw fa-trash mr-1"></i></a>';

                return html;
            }
        }
    ];

    IntializingDataTable(tableId, setDefaultOrder, ajaxObject, columnObject);
    
}


//#endregion