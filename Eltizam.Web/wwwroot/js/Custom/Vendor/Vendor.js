var tableId = "VendorTable";
$(document).ready(function () {
    InitializeVendorList();
});

function ConfirmationDeleteVendor(id) {
     
    $('#DeleteVendorModel #Id').val(id);
}
function DeleteVendor() {
     
    var tempInAtiveID = $('#DeleteVendorModel #Id').val();
    ajaxServiceMethod(BaseURL + DeleteVendors + "/" + tempInAtiveID, 'POST', DeleteVendorByIdSuccess, DeleteVendorByIdError);
}
function DeleteVendorByIdSuccess(data) {
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
function DeleteVendorByIdError(x, y, z) {
    toastr.error(ErrorMessage);
}

function InitializeVendorList() {
     
    var setDefaultOrder = [0, 'asc'];
    var ajaxObject = {
        "url": BaseURL + AllVendor,
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
            "data": "companyName", "name": "Company Name"
        },
        {
            "data": "estimattionDate", "name": "Estimation Date", "render": function (data, type, row, data) {
                return moment(row.estimattionDate).format('DD-MMM-YYYY');
            }
        },
        {
            "data": "businessType", "name": "Resource Type"
        },
        {
            "data": "companyDescription", "name": "Company Description"
        },
        {
            "data": "status", "name": "Active", "render": function (data, type, row, meta) {
                return GetActiveFlagCss(data);
            }
        },
        {
            "data": "id", "name": "Action", "render": function (data, type, row, meta) {
                var html = '';

                html += '<img src="../assets/dots-vertical.svg" alt="dots-vertical" class="activeDots" /> <div class="actionItem"><ul>'
                html += '<li><a title="View" href="/MasterVendor/VendorDetail?id=' + row.id + '"><img src="../assets/view.svg" alt="view" />View</a></li>';
                html += '<li><a title="Edit" href="/MasterVendor/VendorManage?id=' + row.id + '"><img src="../assets/edit.svg" alt="edit" />Edit</a></li>';
                html += '<li><a title="Delete" data-toggle="modal" data-target="#DeleteVendorModel" data-backdrop="static" data-keyboard="false" onclick="ConfirmationDeleteVendor(' + row.id + ');"><img src="../assets/trash.svg" alt="trash" />Delete</a></li>';
                html += '</ul></div>';
                return html;
            }
        }
    ];

    IntializingDataTable(tableId, setDefaultOrder, ajaxObject, columnObject);
} 