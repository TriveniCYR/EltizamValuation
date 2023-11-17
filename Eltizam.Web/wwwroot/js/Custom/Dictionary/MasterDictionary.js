var tableId = "DictionaryTable";
$(document).ready(function () {
    InitializeDictionaryList();
});

function InitializeDictionaryList() {
    var setDefaultOrder = [0, 'asc'];
    var ajaxObject = {
        "url": BaseURL + AllDictionary,
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
            "data": "description", "name": "Description"
        },
        {
            "data": "values", "name": "Values"
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
                html += '<li><a title="View" href="/MasterDictionary/DictionaryAllManage?id=' + row.id + '&description=' + row.description +'"><img src="../assets/view.svg" alt="view" />View</a></li>';
                html += '<li><a title="Edit" href="/MasterDictionary/MasterDictionaryManage?id=' + row.id + '"><img src="../assets/edit.svg" alt="edit" />Edit</a></li>';
                             // html += '<li><a title="Delete" data-toggle="modal" data-target="#DeleteDictionaryModel" data-backdrop="static" data-keyboard="false" onclick="ConfirmationDeleteDictionary(' + row.id + ');"><img src="../assets/trash.svg" alt="trash" />Delete</a></li>';
                html += '</ul></div>';
                return html;
            }
        }
    ];

    IntializingDataTable(tableId, setDefaultOrder, ajaxObject, columnObject);
}
function CleareRoleFields() {
    $('#DeleteLocationModel #ID').val("0");
}
function ConfirmationDeleteDictionary(id) {
    $('#DeleteDictionaryChildModel #ID').val(id);
}
function DeleteRole() {
    if (IsDeletePerm) {
        var tempInAtiveID = $('#DeleteDictionaryChildModel #ID').val();
        var url = DeleteDictionaryById + "/" + tempInAtiveID;
        ajaxServiceMethod(BaseURL + url, 'POST', DeleteRoleByIdSuccess);
    }
    else {
        toastr.error(DeleteAccessDenied);
    }
}
function DeleteRoleByIdSuccess(data) {
    try {
        if (data._Success === true) {

            CleareRoleFields();
            toastr.success(RecordDelete);
            location.reload(true);

        }
        else {
            toastr.error(data._Message);
        }
    } catch (e) {
        toastr.error('Error:' + e.message);
    }
    function DeleteRoleByIdError(x, y, z) {
        if (x.get)
            toastr.error(ErrorMessage);
        location.reload(true);
    }
}


//#endregion


