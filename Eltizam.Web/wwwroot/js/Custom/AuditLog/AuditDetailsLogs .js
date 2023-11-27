var tableId = "AuditLogHistory";
$(document).ready(function () {
    InitializeAuditLogList();
});

function InitializeAuditLogList() {
    var tbl = $("#AuditLogHistory");
    if (tbl.find('tbody tr').length > 0)
        tbl.dataTable().fnDestroy();

    //var userName = $("#UserName").val();
    //userName = GetIntegerVal(userName); 
    var tableName = $("#tableName").val() === undefined ? "" : $("#tableName").val();  
    var datefrom = $("#FromDate").val() === undefined ? "" : $("#FromDate").val(); 
    var dateto = $("#ToDate").val() === undefined ? "" : $("#ToDate").val();
    
   /* var _appendURL = "?UserName=" + userName + "&TableName=" + tableName + "&DateFrom=" + datefrom + "&DateTo=" + dateto;*/
    var _appendURL = "?TableName=" + tableName + "&DateFrom=" + datefrom + "&DateTo=" + dateto;
    //var _appendURL = "?DateFrom=" + datefrom + "&DateTo=" + dateto;



    var ajaxObject = {
        "url": BaseURL + AllAuditDetails + _appendURL,
        "type": "Get",
        "data": function (d) {
            var pageNumber = $('#' + tableId).DataTable().page.info();
            d.PageNumber = pageNumber.page;
        },
        "datatype": "json"
    };


    var columnObject = [
        {
            "data": "createdByName", "name": "Updated By"
        },

        {
            "data": "createdDate", "name": "Updated Date",

            "render": function (data, type, row, data) {
                return moment(row.createdDate).format('DD-MMM-YYYY');
            }
        },
        {
            "data": "propertyName", "name": "Field Name"
        },
        {
            "data": "oldValue", "name": "Before Update",

        },

        {
            "data": "newValue", "name": "After Update",

        }
       
        //{
        //    "data": "id", "name": "Action", "render": function (data, type, row, meta) {
        //        var html = '';
        //        html += '<img src="../assets/dots-vertical.svg" alt="dots-vertical" class="activeDots" /> <div class="actionItem"><ul>'
        //        html += '<li><a title="View" href="/AuditLog/AuditLogDetails?id=' + row.id + '"><img src="../assets/view.svg" alt="view" />View</a></li>';
        //        html += '<li><a title="View All" href="/AuditLog/AuditLogDetails?TableName=' + row.parentTableName + '"><img src="../assets/view.svg" alt="view" />View All History</a></li>';
        //        html += '</ul></div>';

        //        return html;
        //    }
        //}
    ];

    IntializingDataTable(tableId, setDefaultOrder, ajaxObject, columnObject);
}

//#endregion


