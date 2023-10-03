var tableId = "UserTable";
$(document).ready(function () {
    InitializeUserList();
});

//#region Delete User
function ConfirmationDeleteUser(id) {
    $('#DeleteUserModel #UserID').val(id);
}
function DeleteUser() {
    var tempInAtiveID = $('#DeleteUserModel #UserID').val();
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

function InitializeUserList () {
    var setDefaultOrder = [0, 'asc'];
    var ajaxObject = {
        "url": $('#hdnBaseURL').val() + AllUser,
        "type": "POST",
        "data": function (d) {
            var pageNumber = $('#' + tableId).DataTable().page.info();
            d.PageNumber = pageNumber.page;
        },
        "datatype": "json"
    };

    var columnObject = [
      
            
        { data: 'userName' },
        { data: 'dateOfBirth' },
        { data: 'address1' },
        { data: 'address2' },
        { data: 'address3' },
        { data: 'countryName' },
        { data: 'stateName' },
        { data: 'cityName' },
        { data: 'email' },
        { data: 'mobile' },
        { data: 'contactPersonName' },
        { data: 'isActive' },
        { data: 'createdBy' },
            {
                data: 'status',
                render: function (data, type, row) {
                    return '<span class="tableStatus ' + (data === 'Active' ? 'green' : 'red') + '">' + data + '</span>';
                }
            },
            {
                data: null, // Placeholder for action buttons
                render: function (data, type, row) {
                    // Add action buttons here
                    return '<button onclick="edit(' + row.id + ')">Edit</button>' +
                        '<button onclick="delete(' + row.id + ')">Delete</button>';
                }
            }
        ]
        

    IntializingDataTable(tableId, setDefaultOrder, ajaxObject, columnObject, {
        left: 1,
        right: 1
    });
}

//#endregion