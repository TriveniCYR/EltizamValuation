var tableId = "MasterApproverTable";
$(document).ready(function () {
    InitializeApproverMasterTableDataList();
});

//Load data into table
function InitializeApproverMasterTableDataList() {
    var ajaxObject = {
        "url": BaseURL + GetAll,
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
                return '<a href="/MasterApproverLevel/MasterApproverLevelDetail?id=' + row.id + '" title="View">' + data + '</a>';
            }
        },
        {
            "data": "description", "name": "Description"
        },
        {
            "data": "fromAmount", "name": "From Amount", "render": function (data, type, row, meta) {
                return '<span class="formatting">'+data+'</span>';
            }
        },
        {
            "data": "toAmount", "name": "To Amount", "render": function (data, type, row, meta) {
                return '<span class="formatting">'+data+'</span>';
            }
        },
        {
            "data": "isActive", "name": "Active", "render": function (data, type, row, meta) {
                return GetActiveFlagCss(data);
            }
        },
        {
            "data": "action", className: 'notexport actionColumn', "name": "Action", "render": function (data, type, row, meta) {
                var html = '';
                html += '<img src="../assets/dots-vertical.svg" alt="dots-vertical" class="activeDots" /> <div class="actionItem"><ul>'
                html += '<li><a title="View" href="/MasterApproverLevel/MasterApproverLevelDetail?id=' + row.id + '"><img src="../assets/view.svg" alt="view" />View</a></li>';
                html += '<li><a title="Edit" href="/MasterApproverLevel/MasterApproverLevelManage?id=' + row.id + '"><img src="../assets/edit.svg" alt="edit" />Edit</a></li>';
                html += '</ul></div>';

                return html;
            }
        }
    ];

    var dataTable = IntializingDataTable(tableId, setDefaultOrder, ajaxObject, columnObject);

    dataTable.on('init.dt', function () {
        formatCurrencyInElements('formatting');
    });
}
