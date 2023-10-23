var tableId = "DictionaryTable";
$(document).ready(function () {
    InitializeDictionaryList();
});

function ConfirmationDeleteDictionary(id) {
    $('#DeleteDictionaryModel #Id').val(id);
}
function DeleteDictionary() {
    var tempInAtiveID = $('#DeleteDictionaryModel #Id').val();
    ajaxServiceMethod($('#hdnBaseURL').val() + DeleteDictionary + "/" + tempInAtiveID, 'POST', DeleteClientByIdSuccess, DeleteClientByIdError);
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
function DeleteClientByIdError(x, y, z) {
    toastr.error(ErrorMessage);
}

function InitializeDictionaryList() {
    debugger
    var setDefaultOrder = [0, 'asc'];
    var ajaxObject = {
        "url": $('#hdnBaseURL').val() + AllDictionary,
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
        //{
        //    "data": "isactive", "name": "Is Active"
        //},
       
        {
            "data": "isActive", "name": "Active", "render": function (data, type, row, meta) {
                if (data.isActive) {
                    return "<span class='tableStatus green'>Active</span>";
                } else {
                    return "<span class='tableStatus red'>Inactive</span>";
                }
            }
        },
        {
            "data": "id", "name": "Action", "render": function (data, type, row, meta) {
                var html = '';
                html += '<img src="../assets/dots-vertical.svg" alt="dots-vertical" class="activeDots" /> <div class="actionItem"><ul>'
                html += '<li><a title="View" href="/Dictionary/DictionaryAllManage?id=' + row.id + '&description=' + row.description +'"><img src="../assets/view.svg" alt="view" />View</a></li>';
                html += '<li><a title="Edit" href=""><img src="../assets/edit.svg" alt="edit" id="editRole" />Edit</a></li>';
                html += '<li><a title="Delete" data-toggle="modal" data-target="#DeleteDictionaryModel" data-backdrop="static" data-keyboard="false" onclick="ConfirmationDeleteDictionary(' + row.id + ');"><img src="../assets/trash.svg" alt="trash" />Delete</a></li>';
                html += '</ul></div>';
                return html;
            }
        }
    ];

    IntializingDataTable(tableId, setDefaultOrder, ajaxObject, columnObject);
}

//#endregion