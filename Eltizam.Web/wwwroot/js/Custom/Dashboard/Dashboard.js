$(document).ready(function () {
    BindClientNameDropdown();
    BindPropertyNameDropdown();
    showLoader();
    initializeDashboard(); 
});

// Function to initialize the dashboard on page load
function initializeDashboard() {
    var formDataObject = {
        PropertyId: 0,
        ClientId: 0,
        FromDate: '',
        ToDate: '',
        Pagesize: 5
    };

    var formDataJson = JSON.stringify(formDataObject);
    ajaxServiceMethod(BaseURL + Dashboardurl, 'POST', submitFilterFormSuccess, submitFilterFormError, formDataJson);
}
function BindClientNameDropdown() {
    var Client = $("#ClientId");
    var _val = 0;
    var _rpname = "clientName";
    var id = 0;
    BindDropdowns(AllClient + '/' + id, Client, _rpname, _val);
}

function BindPropertyNameDropdown() {
    var property = $("#PropertyId");
    var _val = 0;
    var _rpname = "propertyName";
    var propertytypeid = 0;
    var subpropertytypeid = 0;
    var ownershiptypeid = 0;
    BindDropdowns(AllProperty + '/' + propertytypeid + '/' + subpropertytypeid + '/' + ownershiptypeid, property, _rpname, _val);
}

function submitFilterForm() {
    var formDataObject = {
        PropertyId: $('#PropertyId').val(),
        ClientId: $('#ClientId').val(),
        FromDate: $('#FromDate').val() =="" ? "":flatpickr.formatDate(new Date($('#FromDate').val()), 'Y-m-d'), 
        ToDate: $('#ToDate').val() == "" ? "" : flatpickr.formatDate(new Date($('#ToDate').val()), 'Y-m-d')
         
    };
    showLoader();
    var formDataJson = JSON.stringify(formDataObject);
    ajaxServiceMethod(BaseURL + Dashboardurl, 'POST', submitFilterFormSuccess, submitFilterFormError, formDataJson);
}

function submitFilterFormSuccess(data) { 
     
    var widgets = data._object.dashboardWidgets;
    $('#totalClients').text(widgets.totalClients);
    $('#totalProjects').text(widgets.totalProjects);
    $('#totalRevenue').text(widgets.totalRevenue);
    $('#completedPerc').text(widgets.completedPerc + '%');
    $('#pendingPerc').text(widgets.pendingPerc + '%');
    $('#totalDue').text(widgets.totalDue);

    //RequestTable Start

    var latestRequestsTableBody = $('.latestRequestsTable tbody');
    latestRequestsTableBody.empty(); // Clear existing rows

    if (data._object.latestRequests.length != 0) {
        data._object.latestRequests.forEach(function (request) {
            var rowHtml = '<tr>' +
                '<td>' + request.clientName + '</td>' +
                '<td>' + request.propertyName + '</td>' +
                '<td>' + request.valRefNum + '</td>' +
                '<td><span class="tableStatus" style="color: ' + request.colorCode + '; background-color: ' + request.backGroundColor + '; border: 1px solid ' + request.colorCode + ';">' + request.status + '</span></td>' +
                '</tr>';
            latestRequestsTableBody.append(rowHtml);
        });
    } 
    else {
        var rowHtml = '<tr>' +
            '<td colspan="5">' + "No Data Available" + '</td>' +
            '</tr>';
        latestRequestsTableBody.append(rowHtml);
    } 

    var latestQuotationsTableBody = $('.latestQuotationsTable tbody');
    latestQuotationsTableBody.empty(); // Clear existing rows

    if (data._object.latestQuotations.length != 0){
        data._object.latestQuotations.forEach(function (quaotation) {
            var rowHtml = '<tr>' +
                '<td>' + quaotation.clientName + '</td>' +
                '<td>' + quaotation.propertyName + '</td>' +
                '<td>' + quaotation.valRefNum + '</td>' +
                '<td>' + quaotation.quotationNum + '</td>' +
                '<td class="formatting">' + quaotation.quotationFee + '</td>' + 
                '</tr>';
            latestQuotationsTableBody.append(rowHtml);
        });
    }
      else {
        var rowHtml = '<tr>' +
            '<td colspan="5">' + "No Data Available" + '</td>' +
            '</tr>';
        latestQuotationsTableBody.append(rowHtml);
    }
    //LatestQuotationsTable End

    //TopValuationsTable Start

    var topValuationsTableBody = $('.topValuationsTable tbody');
    topValuationsTableBody.empty(); // Clear existing rows

    if (data._object.topValuations.length != 0) {
        data._object.topValuations.forEach(function (valuation) {
            var rowHtml = '<tr>' +
                '<td>' + valuation.clientName + '</td>' +
                '<td>' + valuation.propertyName + '</td>' +
                '<td>' + valuation.valRefNum + '</td>' +
                '<td class="formatting">' + valuation.valuationAmount + '</td>' +
                '</tr>';
            topValuationsTableBody.append(rowHtml);
        });
    }
     else {
        var rowHtml = '<tr>' +
            '<td colspan="4">' + "No Data Available" + '</td>' +
            '</tr>';
        topValuationsTableBody.append(rowHtml);
    }
     //TopValuationsTable End

     //TopQuotationDuesTable Start
    var topQuotationDuesTableBody = $('.topQuotationDuesTable tbody');
    topQuotationDuesTableBody.empty(); // Clear existing rows
    if (data._object.topQuotationDues.length != 0) {
        data._object.topQuotationDues.forEach(function (quotationdue) {
            var rowHtml = '<tr>' +
                '<td>' + quotationdue.clientName + '</td>' +
                '<td>' + quotationdue.propertyName + '</td>' +
                '<td>' + quotationdue.valRefNum + '</td>' +
                '<td>' + quotationdue.valRefNum + '</td>' +
                '<td class="formatting">' + quotationdue.quotationFee + '</td>' +
                '</tr>';
            topQuotationDuesTableBody.append(rowHtml);
        });
    }
     else {
        var rowHtml = '<tr>' +
            '<td colspan="4">' + "No Data Available" + '</td>' +
            '</tr>';
        topQuotationDuesTableBody.append(rowHtml);
    }

    hideLoader();
     //TopQuotationDuesTable End

    formatCurrencyInElements('formatting')
}

function submitFilterFormError(x, y, z) {
    toastr.error(ErrorMessage);
}

function fetchDataForModal() {
    var formDataObject = {
        PropertyId: 0,
        ClientId: 0,
        FromDate: '',
        ToDate: '',
        Pagesize: -1
    };
    var formDataJson = JSON.stringify(formDataObject);
    return $.ajax({
        url: BaseURL + Dashboardurl,
        method: 'POST',
        contentType: 'application/json; charset=utf-8',
        dataType: 'json',
        data: formDataJson,
    });
}

$('#openModalLinklatestRequestsTable').on('click', function () {
    // Clear the table body before making a new request
    $('#data-tablerequest tbody').empty();
    fetchDataForModal()
        .done(function (data) {
            // Handle data for modal 1
            $.each(data._object.latestRequests, function (index,request) {
                $('#data-tablerequest tbody').append('<tr>' +
                    '<td>' + request.clientName + '</td>' +
                    '<td>' + request.propertyName + '</td>' +
                    '<td>' + request.valRefNum + '</td>' +
                    '<td><span class="tableStatus" style="color: ' + request.colorCode + '; background-color: ' + request.backGroundColor + '; border: 1px solid ' + request.colorCode + ';">' + request.status + '</span></td>' +
                    '</tr>');
            });

            // Open the modal for modal 1
            $('#myModallatestRequestsTable').modal('show');
        })
        .fail(function () {
            alert('Failed to fetch data for modal 1 from the API');
        });
    return false;
});

$('#openModalLinklatestQuotationsTable').on('click', function () {
    // Clear the table body before making a new request
    $('#data-tablequaotation tbody').empty();
    fetchDataForModal()
        .done(function (data) {
            $.each(data._object.latestQuotations, function (index, quaotation) {
                $('#data-tablequaotation tbody').append('<tr>' +
                    '<td>' + quaotation.clientName + '</td>' +
                    '<td>' + quaotation.propertyName + '</td>' +
                    '<td>' + quaotation.valRefNum + '</td>' +
                    '<td>' + quaotation.quotationNum + '</td>' +
                    '<td class="formatting">' + quaotation.quotationFee + '</td>' +
                    '</tr>');
            });

            formatCurrencyInElements('formatting');
            $('#myModallatestQuotationsTable').modal('show');
        })
        .fail(function () {
            alert('Failed to fetch data for modal  from the API');
        });
    return false;
        
    });

$('#openModalLinktopValuationsTable').on('click', function () {
        // Clear the table body before making a new request
    $('#data-tabletopValuations tbody').empty();
        fetchDataForModal()
            .done(function (data) {
                // Handle data for modal 1
                $.each(data._object.topValuations, function (index, valuation) {
                    $('#data-tabletopValuations tbody').append('<tr>' +
                        '<td>' + valuation.clientName + '</td>' +
                        '<td>' + valuation.propertyName + '</td>' +
                        '<td>' + valuation.valRefNum + '</td>' +
                        '<td class="formatting">' + valuation.valuationAmount + '</td>' +
                        '</tr>');
                });
                formatCurrencyInElements('formatting');
                $('#myModaltopValuationsTable').modal('show');
            })
            .fail(function () {
                alert('Failed to fetch data for modal 1 from the API');
            });
       
        return false;
    });

 $('#openModalLinktopQuotationDuesTable').on('click', function () {
        // Clear the table body before making a new request
     $('#data-tableQuotationDues tbody').empty();
     fetchDataForModal()
         .done(function (data) {
             // Handle data for modal 1
             $.each(data._object.topQuotationDues, function (index, quotationdue) {
                 $('#data-tableQuotationDues tbody').append('<tr>' +
                     '<td>' + quotationdue.clientName + '</td>' +
                     '<td>' + quotationdue.propertyName + '</td>' +
                     '<td>' + quotationdue.valRefNum + '</td>' +
                     '<td>' + quotationdue.valRefNum + '</td>' +
                     '<td class="formatting">' + quotationdue.quotationFee + '</td>' +
                     '</tr>');
             });
             formatCurrencyInElements('formatting');
             $('#myModaltopQuotationDuesTable').modal('show');
         })
         .fail(function () {
             alert('Failed to fetch data for modal from the API');
         });
        return false;
    });