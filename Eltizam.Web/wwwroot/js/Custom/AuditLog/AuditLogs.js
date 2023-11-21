var tableId = "AuditLogTable";
$(document).ready(function () {
    InitializeAuditLogList();
});

function InitializeAuditLogList() {
    $("#AuditLogTable").dataTable().fnDestroy();
    
    var userName = $("#UserName").val();
    if (userName === undefined || isNaN(parseInt(userName))) {
        userName = 0; // Set a default value when the input is not a valid integer.
    } else {
        userName = parseInt(userName);
    }

    var tableName = $("#ParentTableName").val() === undefined ? "" : $("#ParentTableName").val();
   

    var datefrom = $("#FromDate").val() === undefined ? "" : $("#FromDate").val();

    var dateto = $("#ToDate").val() === undefined ? "" : $("#ToDate").val();
   
    var _appendURL = "?UserName=" + userName +"&TableName=" + tableName + "&DateFrom=" + datefrom + "&DateTo=" + dateto; 
    var ajaxObject = {
        "url": BaseURL + AllAudit + _appendURL,
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
            "data": "createdByName", "name": "Created User"
        },
        {
            "data": "createdDate", "name": "Created Date",

             "render": function (data, type, row, data) {
                 return moment(row.createdDate).format('DD-MMM-YYYY');
            }
        },
        {
            "data": "actionType", "name": "Action Type"
        },
        {
            "data": "parentTableName", "name": "Table Name"
        },
        {
            "data": "id", "name": "Action", "render": function (data, type, row, meta) {
                var html = '';
                html += '<img src="../assets/dots-vertical.svg" alt="dots-vertical" class="activeDots" /> <div class="actionItem"><ul>'
                html += '<li><a title="View" href="/AuditLog/AuditLogDetails?id=' + row.id + '"><img src="../assets/view.svg" alt="view" />View</a></li>';
                html += '<li><a title="View All" href="/AuditLog/AuditLogDetails?TableName=' + row.parentTableName +'"><img src="../assets/view.svg" alt="view" />View All History</a></li>';
                html += '</ul></div>';

                return html;
            }
        }
    ];

    IntializingDataTable(tableId, setDefaultOrder, ajaxObject, columnObject);
} 

//#endregion


