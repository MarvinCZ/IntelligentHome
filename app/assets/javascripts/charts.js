function drawChart(order) {
    var container = document.getElementById('chart_timeline_'.concat(order));
    var chart = new google.visualization.Timeline(container);
    var dataTable = new google.visualization.DataTable();
    dataTable.addColumn({ type: 'string', id: 'Role' });
    dataTable.addColumn({ type: 'string', id: 'Name' });
    dataTable.addColumn({ type: 'date', id: 'Start' });
    dataTable.addColumn({ type: 'date', id: 'End' });
    dataTable.addRows([
        [ 'President', 'George Washington', new Date(1789, 3, 30), new Date(1797, 2, 4) ],
        [ 'President', 'John Adams', new Date(1797, 2, 4), new Date(1801, 2, 4) ],
        [ 'President', 'Thomas Jefferson', new Date(1801, 2, 4), new Date(1809, 2, 4) ]]);

    var options = {
        colors: ['#cbb69d', '#603913', '#c69c6e'],
    };
                           
    chart.draw(dataTable, options);
}

function drawCharts(){
    var arr_activities = ["2016,0,0,14,0,0","2016,0,0,15,0,0"];
    var output_charts = "";
    
    for( var i = 0; i < 3; i++ ){
        $("#content-wrapper").append('<h2>Sekačka</h2><div class="chart-box-1"><div id="chart_timeline_'+i+'"></div></div>');
        drawChart(i);
    } 
}

$(document).ready(function(){
    if($('.charts').length > 0){
        google.charts.load("current", {packages:["timeline"]});
        google.charts.setOnLoadCallback(drawCharts);
    }
});        