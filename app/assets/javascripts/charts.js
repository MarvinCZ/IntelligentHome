$(document).ready(function(){
    var dvs = [{name:"John",time_start:"xx1",time_end:"xx2"},{name:"Sekačka",value:"yyy"}];

    function drawChart(order,time) {
        var arr_time = time.split("|");

        var container = document.getElementById('chart_timeline_'+order);
        var chart     = new google.visualization.Timeline(container);
        var dataTable = new google.visualization.DataTable();
        dataTable.addColumn({ type: 'string', id: 'Role' });
        dataTable.addColumn({ type: 'string', id: 'Name' });
        dataTable.addColumn({ type: 'date', id: 'Start' });
        dataTable.addColumn({ type: 'date', id: 'End' });
        dataTable.addRows([
            [ 'President', '', new Date(1789, 3, 30), new Date(1797, 2, 4) ],
            [ 'President', '', new Date(1801, 2, 4), new Date(1809, 2, 4) ]
        ]);

        var options = {
            colors: ['#D64F05'],
        };
                               
        chart.draw(dataTable, options);
    }

    function drawCharts(){
        
        for( var i = 0; i < 2; i++ ){
            time = dvs[i]["time_start"]+"|"+dvs[i]["time_end"];
            
            $("#content-wrapper").append('<h2>'+dvs[i]["name"]+'</h2><div class="chart-box-1"><div id="chart_timeline_'+i+'"></div></div>');
            drawChart(i,time);
        } 
    }

    if($('.charts').length > 0){
        function finalCharts(){
            drawCharts();
        }
        google.charts.load("current", {packages:["timeline"]});
        google.charts.setOnLoadCallback(finalCharts);
    }
});        