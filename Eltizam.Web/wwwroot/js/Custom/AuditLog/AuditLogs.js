var tableId = "AuditLogTable";
$(document).ready(function () {
    InitializeAuditLogList();
});

function InitializeAuditLogList() {
    var tbl = $("#AuditLogTable");
    if (tbl.find('tbody tr').length > 0)
        tbl.dataTable().fnDestroy();

    var userName = $("#UserName").val();
    userName = GetIntegerVal(userName); 
    var tableName = $("#ParentTableName").val() === undefined ? "" : $("#ParentTableName").val();  
    var datefrom = $("#FromDate").val() === undefined ? "" : $("#FromDate").val(); 
    var dateto = $("#ToDate").val() === undefined ? "" : $("#ToDate").val();

    var _appendURL = "?UserName=" + userName + "&TableName=" + tableName + "&DateFrom=" + datefrom + "&DateTo=" + dateto;

    assignToggleFilter();

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
                html += '<li><a title="View" href="/AuditLog/AuditLogDetailList?id=' + row.id + '"><img src="../assets/view.svg" alt="view" />View</a></li>';
                html += '<li><a title="View All" href="/AuditLog/AuditLogDetailList?TableName=' + row.parentTableName + '"><img src="../assets/view.svg" alt="view" />View All History</a></li>';
                html += '</ul></div>';

                return html;
            }
        }
    ];

    IntializingDataTable(tableId, setDefaultOrder, ajaxObject, columnObject);
}

//#endregion


