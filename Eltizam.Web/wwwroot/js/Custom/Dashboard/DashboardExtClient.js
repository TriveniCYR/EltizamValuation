$(document).ready(function () {
	BindPieChart();
	BindBarChart();
});

function BindPieChart() {
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
			dataPoints: [
				{ y: 51.08, label: "New" },
				{ y: 27.34, label: "Cancelled" },
				{ y: 10.62, label: "Quoted" },
				{ y: 5.02, label: "Paid" },
				{ y: 4.07, label: "Sub. to Approver" },
				{ y: 1.22, label: "Approved" },
				{ y: 0.44, label: "Rejected" }
			]
		}]
	});
	chart.render();

}

function BindBarChart() {
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
			dataPoints: [
				{ x: 10, y: 71, indexLabel: "New"},
				{ x: 20, y: 55, indexLabel: " Cancelled"},
				{ x: 30, y: 50, indexLabel: "Quoted"},
				{ x: 40, y: 65, indexLabel: "Paid" },
				{ x: 50, y: 92, indexLabel: " Approved" }
			]
		}]
	});
	chart.render();

}