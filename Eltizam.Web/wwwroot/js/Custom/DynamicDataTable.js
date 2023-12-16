function IntializingDataTable(id, setDefaultOrder, ajaxObject, columnObject, fixedCols) {
    var dataTableInst =
        $('#' + id).removeAttr('width').DataTable({
            order: setDefaultOrder,
            scrollX: true,
            scrollCollapse: true,
            fixedColumns: fixedCols,
            autoWidth: false,
            processing: false,
            serverSide: true,
            //stateSave: true,
            orderMulti: false,
            filter: true,
            orderCellsTop: true,
            "bLengthChange": true,
            'bSortable': true,
            fixedHeader: true,
            pageLength: 25,
            bPaginate: false,
            paging: true,
            lengthMenu: [
                [10, 25, 50, 100, -1],
                [10, 25, 50, 100, 'All'],
            ],
            dom: 'Bfrtip',
            "language": {
                //'loadingRecords': 'Processing...',
                processing: '<i class="fa fa-spinner fa-spin fa-2x fa-fw"></i>'
            },
            stateSaveCallback: function (settings, data) {
                localStorage.setItem('DataTables_' + settings.sInstance, JSON.stringify(data));
            },
            stateLoadCallback: function (settings, data) {
                return JSON.parse(localStorage.getItem('DataTables_' + settings.sInstance));
            },
            buttons: [
                {
                    extend: 'excel', text: '<i class="far fa-file-excel" style="font-size: x-large;color:var(--green);"></i>', className: "btn-primary", exportOptions:
                    {
                        columns: ':not(.notexport)'
                    }
                },
                {
                    extend: 'pdf', text: '<i class="far fa-file-pdf" style="font-size: x-large;color:var(--error);"></i>', className: "btn-primary", exportOptions:
                    {
                        columns: ':not(.notexport)'
                    }
                }
                //,{
                //    extend: 'csv', text: '<i class="far fa-file-csv"></i>', className: "btn-primary", exportOptions:
                //    {
                //        columns: ':not(.notexport)'
                //    }
                //}
                /*{ extend: 'colvis', className: "btn-primary", columns: ':not(.notexport)' }*/
            ],
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

