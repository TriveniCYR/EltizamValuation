$(document).ready(function () {
	
	BindBarChart();
	GetChartData();
});
var ErrorMessage = 'Error Occured !'
// #region Get ClientType List

function GetChartData() {
	ajaxServiceMethod(BaseURL + ClientPieChartURL + "/1", 'GET', GetChartDataSuccess, GetChartDataError);
}

function GetChartDataSuccess(data) {
	try {
	//var	dataPoints = [];
	//	$.each(data._object, function (key, value) {
	//		dataPoints.push({ x: value.y, label: value.Y });
	//	});

		BindPieChart(data._object.pieChartData);
		BindBarChart(data._object.barChartData);
	} catch (e) {
		toastr.error('Error:' + e.message);
	}
}
function GetChartDataError(x, y, z) {
	toastr.error(ErrorMessage);
}



function BindPieChart(chartdata) {
	var chart = new CanvasJS.Chart("Pie_chartContainer", {
		theme: "light2", // "light1", "light2", "dark1", "dark2"
		exportEnabled: true,
		animationEnabled: true,
		title: {
			text: "Pie Chart for Clinet"
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
			text: "Bar Chart for Client"
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

}