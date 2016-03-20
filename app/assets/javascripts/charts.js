$(document).ready(function(){

    function drawChart(order,content) {

        var container = document.getElementById('chart_timeline_'+order);
        var chart     = new google.visualization.Timeline(container);
        var dataTable = new google.visualization.DataTable();
        dataTable.addColumn({ type: 'string', id: 'Role' });
        dataTable.addColumn({ type: 'string', id: 'Name' });
        dataTable.addColumn({ type: 'date', id: 'Start' });
        dataTable.addColumn({ type: 'date', id: 'End' });
        dataTable.addRows([
            [ "", "", new Date(1789, 3, 30), new Date(1797, 2, 4) ],
            [ 'President', '', new Date(1801, 2, 4, 0, 0, 0), new Date(1801, 2, 4, 0, 0, 0) ]
        ]);
        //dataTable.addRows = content;

        var options = {
            colors: ['#D64F05'],
        };
                               
        chart.draw(dataTable, options);
    }

    function drawCharts(){
        
        for( var i = 0; i < window.chartdata.length; i++ ){
            $("#content-wrapper").append('<h2>'+window.chartdata[i].name+'</h2>');

            for(var y = 0; y < chartdata[i].values.length; y++ ){
                var kind = window.chartdata[i].values[y].kind;
                var nazev = window.chartdata[i].values[y].name;
                $("#content-wrapper").append('<div class="chart-box-1"><div id="chart_timeline_'+y+'"></div></div>');                
                var content = ([]);

                for(var z = 0; z < window.chartdata[i].values[y].values.length; z++ ){
                    var time  = window.chartdata[i].values[y].values[z].time;
                    var value  = window.chartdata[i].values[y].values[z].value;
                    alert();
                    if( value == 1 ){
                        content = [kind, nazev, new Date(2016, 3, 30), new Date(1797, 2, 4)];
                    }
                }

                //alert(content);
                drawChart(y,content);
            }
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