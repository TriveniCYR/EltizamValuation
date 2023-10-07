var tableId = "UserTable";
$(document).ready(function () {
    debugger
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
    var setDefaultOrder = [1, 'asc'];
    debugger
    var search = {
        'userName': 'Pawan',
        'countryId': 1,
        'stateId': 1
    }
    var paging = {
        'pageNo': 1,
        'pageSize': 10,
        'sortName': 'Id',
        'sortType': 'ASC'
    }
    var data1 = {
        'paging': paging,
        'search': search
    }
    debugger
    var ajaxObject = {
        "url": $('#hdnBaseURL').val() + AllUser,
        "type": "POST",
        "data": data1,
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
        { data: 'createdBy' },
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
            data: "id", "name": "Action", "render": function (data, type, row, meta) {
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