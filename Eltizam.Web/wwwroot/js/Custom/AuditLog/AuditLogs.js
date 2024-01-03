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
            "data": "id", "name": "Id", "render": function (data, type, row, meta) {
                return '<a href="/AuditLog/AuditLogDetailList?id=' + row.id + '&IsView=1" title="View">' + data + '</a>';
            }
        }, 
        //{
        //    "data": "actionType", "name": "Action Type"
        //}, 
        {
            "data": "tableKeyId", "name": "Module Id"
        }, 
        {
            "data": "tableName", "name": "Module Name"
        },
        {
            "data": "parentTableKeyId", "name": "Parent Module Id"
        },
        {
            "data": "parentTableName", "name": "Parent Module Name"
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
            "data": "id", className: 'notexport actionColumn', "name": "Action", "render": function (data, type, row, meta) {
                var html = '';

                html += '<img src="../assets/dots-vertical.svg" alt="dots-vertical" class="activeDots" /> <div class="actionItem"><ul>'
                html += '<li><a title="View" href="/AuditLog/AuditLogDetailList?id=' + row.id + '"><img src="../assets/view.svg" alt="view" />View</a></li>';
                html += '<li><a title="View All" href="/AuditLog/AuditLogDetailList?TableName=' + row.tableName + '&TableKey=' + row.tableKeyId + '"><img src="../assets/view.svg" alt="view" />View History</a></li>';

                html += '</ul></div>';

                return html;
            }
        }
    ];

    IntializingDataTable(tableId, setDefaultOrder, ajaxObject, columnObject);
}

//#endregion


function clearSearchFields() {
    document.getElementById("auditLogFilterForm").reset();
    $('#UserName').val();
    $('#ParentTableName').val();
    $('#FromDate').val();
    $('#ToDate').val();


    InitializeAuditLogList();
}
