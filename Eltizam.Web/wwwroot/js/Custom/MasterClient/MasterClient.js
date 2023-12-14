var tableId = "ClientTable";
$(document).ready(function () {
    InitializeClientList();
});

function ConfirmationDeleteClient(id) {
    $('#DeleteClientModel #Id').val(id);
}
function DeletedClient() {
    if (IsDeletePerm) {
        var by = LogInUserId;
        var tempInAtiveID = $('#DeleteClientModel #Id').val();
        ajaxServiceMethod(BaseURL + DeleteClient + "/" + tempInAtiveID + "?by=" + by, Post, DeleteClientByIdSuccess, DeleteFailure);
    }
    else {
        toastr.error(DeleteAccessDenied);
    }
}

function DeleteClientByIdSuccess(data) {
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

function InitializeClientList() {  
    var ajaxObject = {
        "url": BaseURL + AllClient,
        "type": Post,
        "data": function (d) {
            var pageNumber = $('#' + tableId).DataTable().page.info();
            d.PageNumber = pageNumber.page;
        },
        "datatype": "json"
    };
    var columnObject = [
        {
            "data": "id", "name": "Clent Name"
        },
        {
            "data": "clientName", "name": "Clent Name"
        },
        {
            "data": "clientType", "name": "Client Type"
        },
        {
            "data": "trnnumber", "name": "TRN Number"
        },
        {
            "data": "trnexpiryDate", "name": "TRN Expiry", "render": function (data, type, row, meta) {
                return moment(row.trnexpiryDate).format('DD-MMM-YYYY');
            }
        },
        {
            "data": "licenseNumber", "name": "License Number"
        },
        {
            "data": "isActive", "name": "Active", "render": function (data, type, row, meta) {
                return GetActiveFlagCss(data);
            }
        },
        {
            "data": "id", className: 'notexport actionColumn', "name": "Action", "render": function (data, type, row, meta) {
                var html = '';
                html += '<img src="../assets/dots-vertical.svg" alt="dots-vertical" class="activeDots" /> <div class="actionItem"><ul>'
                html += '<li><a title="View" href="/MasterClient/ClientDetail?id=' + row.id + '"><img src="../assets/view.svg" alt="view" />View</a></li>';
                html += '<li><a title="Edit" href="/MasterClient/ClientManage?id=' + row.id + '"><img src="../assets/edit.svg" alt="edit" />Edit</a></li>';
                html += '<li><a title="Delete" data-toggle="modal" data-target="#DeleteClientModel" data-backdrop="static" data-keyboard="false" onclick="ConfirmationDeleteClient(' + row.id + ');"><img src="../assets/trash.svg" alt="trash" />Delete</a></li>';
                html += '</ul></div>';
                return html;
            }
        }
    ];

    IntializingDataTable(tableId, setDefaultOrder, ajaxObject, columnObject);
}

//#endregion