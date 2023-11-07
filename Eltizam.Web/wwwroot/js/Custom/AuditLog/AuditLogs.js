var tableId = "AuditLogTable";
$(document).ready(function () {
    InitializeAuditLogList();
});

function InitializeAuditLogList() {
    var tableName = ""; 
    var datefrom = "";
    var dateto = "";

    var _appendURL = ""; // "?TableName=" + tableName + "&DateFrom=" + datefrom + "&DateTo=" + dateto;
    var setDefaultOrder = [0, 'asc'];
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
            "data": "createdDate", "name": "Created Date"
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
                html += '<li><a title="View" href="/AuditLog/GetLogDetails?id=' + row.id + '"><img src="../assets/view.svg" alt="view" />View</a></li>';
                html += '<li><a title="View All" href="/AuditLog/GetLogDetails?TableName=' + row.parentTableName +'"><img src="../assets/view.svg" alt="view" />View All History</a></li>';
                html += '</ul></div>';

                return html;
            }
        }
    ];

    IntializingDataTable(tableId, setDefaultOrder, ajaxObject, columnObject);
} 

//#endregion


