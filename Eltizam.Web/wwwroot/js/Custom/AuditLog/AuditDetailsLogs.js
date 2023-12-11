var tableId = "AuditLogHistory";
$(document).ready(function () {
    InitializeAuditLogHistoryList();
});

function InitializeAuditLogHistoryList() {
    var tbl = $("#AuditLogHistory");
    if (tbl.find('tbody tr').length > 0)
        tbl.dataTable().fnDestroy();

    //var userName = $("#id").val(); 
    var tableName = $("#tableName").val() === undefined ? "" : $("#tableName").val();  
    var datefrom = $("#FromDate").val() === undefined ? "" : $("#FromDate").val(); 
    var dateto = $("#ToDate").val() === undefined ? "" : $("#ToDate").val();
    var id = $("#alid").val() === undefined ? "" : $("#alid").val(); 
    var tkey = $("#tableKey").val() === undefined ? "" : $("#tableKey").val(); 
    
    var _appendURL = "?UserName=" + LogInUserId + "&TableName=" + tableName + "&TableKey=" + tkey + "&Id=" + id + "&DateFrom=" + datefrom + "&DateTo=" + dateto; 
    assignToggleFilter();
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
            "data": "createdDate", "name": "Updated Date", class: "formatted-td-date-input",
            "render": function (data, type, row, data) {
                return moment(row.createdDate).format(defaultDateFormat);
            }
        },
        {
            "data": "propertyName", "name": "Field Name"
        },
        {
            "data": "oldValue", "name": "Before Update",
            "render": function (data, type, row, data) { 
                return row.propertyName.indexOf('Date') > -1 ? moment(row.oldValue).format(defaultDateFormat) : row.oldValue;
            }
        }, 
        {
            "data": "newValue", "name": "After Update",
            "render": function (data, type, row, data) {
                return row.propertyName.indexOf('Date') > -1 ? moment(row.oldValue).format(defaultDateFormat) : row.oldValue;
            }
        } 
    ];

    IntializingDataTable(tableId, setDefaultOrder, ajaxObject, columnObject);
}


//#endregion


