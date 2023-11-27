var tableId = "AuditLogHistory";
$(document).ready(function () {
    InitializeAuditLogHistoryList();
});

function InitializeAuditLogHistoryList() {
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
        "type": "POST",
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
      
    ];

    IntializingDataTable(tableId, setDefaultOrder, ajaxObject, columnObject);
}

//#endregion


