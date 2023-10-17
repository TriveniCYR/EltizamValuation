var tableId = "ClientTable";
$(document).ready(function () {
    InitializeClientList();
});

function InitializeClientList() {
    debugger
    var setDefaultOrder = [0, 'asc'];
    var ajaxObject = {
        "url": $('#hdnBaseURL').val() + AllClient,
        "type": "POST",
        "data": function (d) {
            var pageNumber = $('#' + tableId).DataTable().page.info();
            d.PageNumber = pageNumber.page;
        },
        "datatype": "json"
    };
    var columnObject = [
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
            "data": "trnexpiryDate", "name": "TRN Expiry"
        },
        {
            "data": "licenseNumber", "name": "License Number"
        },
        {
            "data": "isActive", "name": "Active", "render": function (data, type, row, meta) {
                if (data) {
                    return "<span class='text-success text-bold'>Yes</span>";
                } else {
                    return "<span class='text-danger text-bold'>No</span>";
                }
            }
        },
        {
            "data": "id", "name": "Action", "render": function (data, type, row, meta) {
                var html = '';

                html += '<a title="Edit" class="large-font"  href="/Client/ClientManage?UserId=' + row.id + '"><img src="../assets/edit.svg" alt = "edit" />';
                html += '<a title="Delete" class="large-font text-danger" data-toggle="modal" data-target="#DeleteUserModel" data-backdrop="static" data-keyboard="false" onclick="ConfirmationDeleteClient(' + row.userId + '); return false;"><i class="fa fa-fw fa-trash mr-1"></i></a>';

                return html;
            }
        }
    ];

    IntializingDataTable(tableId, setDefaultOrder, ajaxObject, columnObject);
}

//#endregion