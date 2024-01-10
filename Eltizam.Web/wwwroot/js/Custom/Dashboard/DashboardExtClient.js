$(document).ready(function () {
	BindClientNameDropdown();
	BindPropertyNameDropdown();
	BindBarChart();
	submitFilterForm();
});
var ErrorMessage = 'Error Occured !'
// #region Get ClientType List

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
		LogInUserId: $("#LogInUserId").val() ?? 1,
		RoleId: $('#RoleId').val(),
		ModuleName: $('#ModuleName').val(),
		PropertyId: $('#PropertyId').val(),
		ClientId: $('#ClientId').val(),
		FromDate: $('#FromDate').val() == "" ? "" : flatpickr.formatDate(new Date($('#FromDate').val()), 'Y-m-d'),
		ToDate: $('#ToDate').val() == "" ? "" : flatpickr.formatDate(new Date($('#ToDate').val()), 'Y-m-d'),
		LogInUserId: LogInUserId,
		TabId: 0
	};
	showLoader();

	var formDataJson = JSON.stringify(formDataObject);
	ajaxServiceMethod(BaseURL + ClientPieChartURL, 'POST', GetChartDataSuccess, GetChartDataError, formDataJson);
}

function GetChartDataSuccess(data) {
	try {
	var	dataPoints = [];
		$.each(data._object.BarChart, function (key, value) {
			dataPoints.push({ y: value.y, label: value.barLable });
		});
		BindBarChart(dataPoints);
		dataPoints = [];
		$.each(data._object.PieChart, function (key, value) {
			dataPoints.push({ y: value.y, label: value.pieLable });
		});
		BindPieChart(dataPoints);

		if ($('#ModuleName').val() =='Client')
			FillClientDetails(data._object.OtheDetails);
		else if ($('#ModuleName').val() == 'Valuation')
			FillValuationDetails(data._object.OtheDetails);
		else if ($('#ModuleName').val() == 'Property')
			FillPropertyDetails(data._object.OtheDetails);

	} catch (e) {
		toastr.error('Error:' + e.message);
	}
}
function GetChartDataError(x, y, z) {
	toastr.error(ErrorMessage);
}
function FillClientDetails(otherData) {
	//RequestTable Start
	var latestRequestsTablethead = $('.latestRequestsTable thead');
	latestRequestsTablethead.empty(); // Clear existing rows
	var throwHtml = '<tr><th>ID</th> <th>Client Name</th> <th>Client Type</th> <th>TRN Number</th> <th>TRN Expiry Date</th> <th>License Number</th> <th>Active</th></tr>';
	latestRequestsTablethead.append(throwHtml);

	var latestRequestsTableBody = $('.latestRequestsTable tbody');
	latestRequestsTableBody.empty(); // Clear existing rows

	if (otherData.length != 0) {
		otherData.forEach(function (request) {
			var Active = request.isActive ? "Yes" : "No";

			var rowHtml = '<tr>' +
				/*'<td><a href="/ValuationRequest/ValuationRequestManage?id=' + request.valId + '&IsView=1">' + request.valRefNum + '</a></td>' +*/
				'<td>' + request.id + '</td>' +
				'<td>' + request.clientName + '</td>' +
				'<td>' + request.clientType + '</td>' +

				'<td>' + request.trnNumber + '</td>' +
				'<td>' + moment(request.trnExpiryDate).format('DD-MMM-YYYY') + '</td>'+

				'<td>' + request.licenseNumber + '</td>' +
				'<td>' + GetActiveFlagCss(Active) + '</td>' +
			

				'</tr>';
			latestRequestsTableBody.append(rowHtml);
		});
	}
}

function FillValuationDetails(otherData) {
	//RequestTable Start
	var latestRequestsTablethead = $('.latestRequestsTable thead');
	latestRequestsTablethead.empty(); // Clear existing rows
	var throwHtml = '<tr><th>Val Ref#</th><th>Property</th><th>Client</th><th>Status</th></tr>';
	latestRequestsTablethead.append(throwHtml);

	var latestRequestsTableBody = $('.latestRequestsTable tbody');
	latestRequestsTableBody.empty(); // Clear existing rows

	if (otherData.length != 0) {
		otherData.forEach(function (request) {
			var Active = request.isActive ? "Yes" : "No";

			var rowHtml = '<tr>' +
				'<td><a href="/ValuationRequest/ValuationRequestManage?id=' + request.id + '&IsView=1">' + request.referenceNO + '</a></td>' +
				'<td>' + request.propertyName + '</td>' +
				'<td>' + request.clientName + '</td>' +
				'<td><label class="tableStatus" style="color: ' + request.colorCode + '; background-color: ' + request.backGroundColor + '; border: 1px solid ' + request.colorCode + ';">' + request.statusName + '</label></td>' +
				'</tr>';
			latestRequestsTableBody.append(rowHtml);
		});
	}
}

function FillPropertyDetails(otherData) {
	//RequestTable Start
	var latestRequestsTablethead = $('.latestRequestsTable thead');
	latestRequestsTablethead.empty(); // Clear existing rows
	var throwHtml = '<tr><th>Id</th><th>Property Type</th><th>Property Name</th><th>Property SubType</th><th>Ownership Type</th><th>Active</th></tr>';
	latestRequestsTablethead.append(throwHtml);

	var latestRequestsTableBody = $('.latestRequestsTable tbody');
	latestRequestsTableBody.empty(); // Clear existing rows

	if (otherData.length != 0) {
		otherData.forEach(function (request) {
			var Active = request.isActive ? "Yes" : "No";

			var rowHtml = '<tr>' +
				/*'<td><a href="/ValuationRequest/ValuationRequestManage?id=' + request.valId + '&IsView=1">' + request.valRefNum + '</a></td>' +*/
				'<td>' + request.id + '</td>' +
				'<td>' + request.propertyType + '</td>' +
				'<td>' + request.propertyName + '</td>' +

				'<td>' + request.propertySubType + '</td>' +
				'<td>' + request.ownershipType + '</td>' +
				'<td>' + GetActiveFlagCss( Active) + '</td>' +
				'</tr>';
			latestRequestsTableBody.append(rowHtml);
		});
	}
}

function BindPieChart(chartdata) {
	var chart = new CanvasJS.Chart("Pie_chartContainer", {
		theme: "light2", // "light1", "light2", "dark1", "dark2"
		exportEnabled: true,
		animationEnabled: true,
		title: {
			text: ""
		},
		data: [{
			type: "pie",
			startAngle: 25,
			toolTipContent: "<b>{label}</b>: {y}%",
			showInLegend: "true",
			legendText: "{label}",
			indexLabelFontSize: 16,
			indexLabel: "{label} - {y}%",
			dataPoints: chartdata
		}]
	});
	chart.render();

}

function BindBarChart(chartdata) {
	var chart = new CanvasJS.Chart("Bar_chartContainer", {
		animationEnabled: true,
		exportEnabled: true,
		theme: "light1", // "light1", "light2", "dark1", "dark2"
		title: {
			text: ""
		},
		axisY: {
			includeZero: true
		},
		data: [{
			type: "column", //change type to bar, line, area, pie, etc
			//indexLabel: "{y}", //Shows y value on all Data Points
			indexLabelFontColor: "#5A5757",
			indexLabelFontSize: 16,
			indexLabelPlacement: "outside",
			dataPoints: chartdata
		}]
	});
	chart.render();

}1

function clearSearchFields() {
	document.getElementById("dashboardFilterForm").reset();
	$('#ClientId').val(0).trigger('change');
	$('#PropertyId').val(0).trigger('change');
	initializeDashboard();
}