function IntializingDataTable(id, setDefaultOrder, ajaxObject, columnObject, fixedCols) {
    var dataTableInst =
        $('#' + id + '').removeAttr('width').DataTable({
            order: setDefaultOrder,
            scrollX: true,
            scrollCollapse: true,
            fixedColumns: fixedCols,
            autoWidth: false,
            processing: true,
            serverSide: true,
            //stateSave: true,
            orderMulti: false,
            filter: true,
            orderCellsTop: true,
            "bLengthChange": true,
            'bSortable': true,
            fixedHeader: true,
            pageLength: 5,
            bPaginate: false,
            paging: true,
            //lengthMenu: [
            //    [10, 25, 50, -1],
            //    [10, 25, 50, 'All'],
            //],
            "aLengthMenu": [[10, 25, 50, 75, 100, -1], [10, 25, 50, 75, 100, "All"]],
            "iDisplayLength": 10,
            // "dom": '<"top"i>rt<"bottom"flp><"clear">',
            // "dom": '<"pull-left"B><"pull-right"f>rt<"row"<"col-sm-4"l><"col-sm-4"i><"col-sm-4"p>>', //'<"top"i>rt<"bottom"flp><"clear">',
            //  dom: 'Bfrtip',
            stateSaveCallback: function (settings, data) {
                localStorage.setItem('DataTables_' + settings.sInstance, JSON.stringify(data));
            },
            stateLoadCallback: function (settings, data) {
                return JSON.parse(localStorage.getItem('DataTables_' + settings.sInstance));
            },
            //buttons: [
            //    {
            //        extend: 'excel', text: '<i class="far fa-file-excel"></i> Export In Excel ', className: "btn-primary", exportOptions: {
            //            columns: ':not(.notexport)'
            //        }
            //    },
            //    { extend: 'colvis', className: "btn-primary", columns: ':not(.notexport)' }
            //],
            "ajax": ajaxObject,
            //"fnRowCallback": rowCallBack,
            "columns": columnObject,
            initComplete: function (settings, json) {
            },
            //"drawCallback": function (settings) {
            //    if (drawCallback != null)
            //        drawCallback();
            //}
        });
    $('body').find('.dataTables_scrollBody').addClass("scrollbar");
    return dataTableInst;
}