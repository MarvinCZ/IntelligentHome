$(document).ready(function(){

    function drawTimeLineChart(i, order,content, name) {

        var container = document.getElementById('chart_'+i+'_'+order);
        var chart     = new google.visualization.Timeline(container);
        var dataTable = new google.visualization.DataTable();
        dataTable.addColumn({ type: 'string', id: 'Name' });
        dataTable.addColumn({ type: 'date', id: 'Start' });
        dataTable.addColumn({ type: 'date', id: 'End' });
        console.log(content);
        for(var i = 0; i < content.length; i++ ){
            dataTable.addRow(
                [ name , content[i][0], content[i][1] ]
            );
            console.log(name);
        }

        var options = {
            colors: ['#D64F05'],
            tooltip: {
                trigger: 'none'
            }
        };
                               
        chart.draw(dataTable, options);
    }

    function drawPointLineChart(i, order,content, name){
        var container = document.getElementById('chart_'+i+'_'+order);
        var chart     = new google.visualization.LineChart(container);
        var arr = [['time', 'value']];
        for(var i = 0; i < content.length; i++ ){
            arr.push(content[i]);
        }
        var options = {
          title: name,
          curveType: 'none',
          legend: { position: 'bottom' }
        };
        var data = google.visualization.arrayToDataTable(arr);
        chart.draw(data, options);
    }

    function drawCharts(){
        
        for( var i = 0; i < window.chartdata.length; i++ ){
            $("#content-wrapper").append('<h2>'+window.chartdata[i].name+'</h2>');

            for(var y = 0; y < chartdata[i].values.length; y++ ){
                var kind = window.chartdata[i].values[y].kind;
                var nazev = window.chartdata[i].values[y].name;
                var c = kind == "movement" ?  '1' : '2';
                $("#content-wrapper").append('<div class="chart-box-' + c + '"><div id="chart_'+i+'_'+y+'"></div></div>');

                if(kind === "movement"){
                    var content = [];
                    var progres = false;
                    var start;
                    var konec;
                    for(var z = 0; z < window.chartdata[i].values[y].values.length; z++ ){
                        var time  = window.chartdata[i].values[y].values[z].time;
                        var value  = window.chartdata[i].values[y].values[z].value;
                        konec = moment(time);
                        if( value == 1 && !progres){
                            progres = true;
                            start = moment(time);
                        }
                        if( value == 0 && progres){
                            progres = false;
                            content.push([start.toDate(), konec.toDate()]);
                        }
                    }
                    if(progres){
                        content.push([start.toDate(), konec.toDate()]);
                    }
                    drawTimeLineChart(i, y,content, nazev || "Sensor");
                }
                else{
                    var data = [];
                    for(var z = 0; z < window.chartdata[i].values[y].values.length; z++ ){
                        var v = window.chartdata[i].values[y].values[z];
                        data.push([moment(v.time).format("h:mm:ss"), v.value]);
                    }
                    drawPointLineChart(i, y,data,nazev || "Sensor");
                }
            }
        } 
    }

    if($('.charts').length > 0){
        function run(){
            drawCharts();
        }
        google.charts.load("current", {packages:["corechart", "timeline"]});
        google.charts.setOnLoadCallback(run);
    }
});        