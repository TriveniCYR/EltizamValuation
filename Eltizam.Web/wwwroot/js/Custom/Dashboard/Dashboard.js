$(document).ready(function () {
    BindClientNameDropdown();
    BindPropertyNameDropdown();
    initializeDashboard();
});

// Function to initialize the dashboard on page load
function initializeDashboard() {
    var formDataObject = {
        PropertyId: 0,
        ClientId: 0,
        FromDate: '',
        ToDate: ''
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

    var formDataJson = JSON.stringify(formDataObject);
    ajaxServiceMethod(BaseURL + Dashboardurl, 'POST', submitFilterFormSuccess, submitFilterFormError, formDataJson);
}

function submitFilterFormSuccess(data) {
    console.log(data);
    $('#totalClients').text(data._object.totalClients);
    $('#totalProjects').text(data._object.totalProjects);
    $('#totalRevenue').text(data._object.totalRevenue);
    $('#completedPerc').text(data._object.completedPerc + '%');
    $('#pendingPerc').text(data._object.pendingPerc + '%');
    $('#totalDue').text(data._object.totalDue);

    //RequestTable Start

    var latestRequestsTableBody = $('.latestRequestsTable tbody');
    latestRequestsTableBody.empty(); // Clear existing rows
    if (data._object.latestRequests.length != 0) {
        data._object.latestRequests.forEach(function (request) {
            var rowHtml = '<tr>' +
                '<td>' + request.clientName + '</td>' +
                '<td>' + request.propertyName + '</td>' +
                '<td>' + request.valRefNum + '</td>' +
                '<td>' + request.status + '</td>' +
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

    //RequestTable end


    //LatestQuotationsTable Start

    var latestQuotationsTableBody = $('.latestQuotationsTable tbody');
    latestQuotationsTableBody.empty(); // Clear existing rows

    if (data._object.latestQuotations.length != 0){
        data._object.latestQuotations.forEach(function (quaotation) {
            var rowHtml = '<tr>' +
                '<td>' + quaotation.clientName + '</td>' +
                '<td>' + quaotation.propertyName + '</td>' +
                '<td>' + quaotation.quotationFee + '</td>' +
                '<td>' + quaotation.quotationNum + '</td>' +
                '<td>' + quaotation.valRefNum + '</td>' +
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
                '<td>' + valuation.valuationAmount + '</td>' +
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
                '<td>' + quotationdue.quotationFee + '</td>' +
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

     //TopQuotationDuesTable End
}
function submitFilterFormError(x, y, z) {
    toastr.error(ErrorMessage);
}



