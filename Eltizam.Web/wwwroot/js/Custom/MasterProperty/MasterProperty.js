var tableId = "PropertyTable";
$(document).ready(function () {
    InitializePropertyList();
});

function InitializePropertyList() {
    var setDefaultOrder = [0, 'asc'];
    var ajaxObject = {
        "url": BaseURL + AllProperty,
        "type": Post,
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
            "data": "propertyName", "name": "Property Name"
        },
        {
            "data": "propertyType", "name": "Property Type"
        },
        {
            "data": "propertySubType", "name": "Property Sub Type"
        },
        {
            "data": "ownershipType", "name": "Ownership Type"
        },
        {
            "data": "location", "name": "Location"
        },
        {
            "data": "isActive", "name": "Active", "render": function (data, type, row, meta) {
                return GetActiveFlagCss(data);
            }
        },
        {
            "data": "action", className: 'notexport actionColumn', "name": "Action", "render": function (data, type, row, meta) {
                var html = '';
                html += '<img src="../assets/dots-vertical.svg" alt="dots-vertical" class="activeDots" /> <div class="actionItem"><ul>'
                html += '<li><a title="View" href="/MasterProperty/PropertyDetail?id=' + row.id + '"><img src="../assets/view.svg" alt="view" />View</a></li>';
                html += '<li><a title="Edit" href="/MasterProperty/PropertyManage?id=' + row.id + '"><img src="../assets/edit.svg" alt="edit" />Edit</a></li>';
                html += '<li><a title="Delete" data-toggle="modal" data-target="#DeletePropertyModel" data-backdrop="static" data-keyboard="false" onclick="ConfirmationDeleteProperty(' + row.id + ');"><img src="../assets/trash.svg" alt="trash" />Delete</a></li>';
                html += '</ul></div>';

                return html;
            }
        }
    ];

    IntializingDataTable(tableId, setDefaultOrder, ajaxObject, columnObject);
}



//#region Delete User
function ConfirmationDeleteProperty(id) {
    $('#DeletePropertyModel #Id').val(id);
}
function DeleteProperty() {
    var tId = $('#DeletePropertyModel #Id').val();
    ajaxServiceMethod(BaseURL + DeletePropertyByIdUrl + "/" + tId, Delete, DeletePropertyByIdSuccess, DeletePropertyByIdError);
}
function DeletePropertyByIdSuccess(data) {
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
function DeletePropertyByIdError(x, y, z) {
    toastr.error(ErrorMessage);
}
