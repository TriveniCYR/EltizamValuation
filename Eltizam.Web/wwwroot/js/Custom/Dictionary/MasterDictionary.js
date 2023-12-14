var tableId = "DictionaryTable";
$(document).ready(function () {
    InitializeDictionaryList();
});

function InitializeDictionaryList() {
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
                html += '<li><a title="View" href="/MasterDictionary/MasterDictionaryManage?id=' + row.id + '&IsView=1"><img src="../assets/view.svg" alt="view" />View</a></li>';
                html += '<li><a title="Edit" href="/MasterDictionary/MasterDictionaryManage?id=' + row.id + '"><img src="../assets/edit.svg" alt="edit" />Edit</a></li>';
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
        ajaxServiceMethod(BaseURL + url, 'POST', DeleteRoleByIdSuccess, DeleteFailure);
    }
    else {
        toastr.error(DeleteAccessDenied);
    }
}
function DeleteRoleByIdSuccess(data) {
    if (data._Success === true) { 
        CleareRoleFields();

        toastr.success(RecordDelete);
        location.reload(true); 
    }
    else {
        toastr.error(data._Message);
    }
}


//#endregion


