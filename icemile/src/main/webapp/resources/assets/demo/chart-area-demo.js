// Set new default font family and font color to mimic Bootstrap's default styling
Chart.defaults.global.defaultFontFamily = '-apple-system,system-ui,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif';
Chart.defaults.global.defaultFontColor = '#292b2c';

// Area Chart Example
var ctx = document.getElementById("myAreaChart");
var myLineChart = new Chart(ctx, {
  type: 'line',
  data: {
    labels: ["RS0001", "RS0002", "RS0003", "RS0004", "RS0005", "RS0006", "RS0007", "RS0008"],
    datasets: [{
      label: "Sessions",
      lineTension: 0.3,
      backgroundColor: "rgba(2,117,216,0.2)",
      borderColor: "rgba(2,117,216,1)",
      pointRadius: 5,
      pointBackgroundColor: "rgba(2,117,216,1)",
      pointBorderColor: "rgba(255,255,255,0.8)",
      pointHoverRadius: 5,
      pointHoverBackgroundColor: "rgba(2,117,216,1)",
      pointHitRadius: 50,
      pointBorderWidth: 2,
      data: [29, 777, 28, 18, 29, 88, 111],
    }],
  },
  options: {
    scales: {
      xAxes: [{
        time: {
          unit: 'date'
        },
        gridLines: {
          display: false
        },
        ticks: {
          maxTicksLimit: 7
        }
      }],
      yAxes: [{
        ticks: {
          min: 0,
          max: 5000,
          maxTicksLimit: 5
        },
        gridLines: {
          color: "rgba(0, 0, 0, .125)",
        }
      }],
    },
    legend: {
      display: false
    }
  }
});


// JS 
var chart, 
  chartConfig = { 
    debug: true, 
    type: 'calendar month solid', 
    title: { 
      margin_bottom: 15, 
      label: { 
        text: 'July 2018', 
        style: { 
          fontSize: 20, 
          fontFamily: 'Arial', 
          fontWeight: 'bold', 
          color: '#0b7285'
        } 
      } 
    }, 
    yAxis_visible: true, 
    legend_visible: false, 
    calendar: { 
      range: ['7/1/2018', '7/31/2018'], 
      defaultEdgePoint: { 
        color: 'white', 
        label_color: '#83b2b7', 
        mouseTracking: false
      } 
    }, 
    defaultSeries: { 
      shape_innerPadding: 0, 
      mouseTracking_enabled: false, 
      defaultPoint: { 
        tooltip_enabled: false, 
        states_hover: { color: '#e3fafc' }, 
        label: { 
          text: 
            '<span style="align:right; font-size:14px;"><b>%name</b></span><br>%events', 
          align: 'left', 
          verticalAlign: 'top', 
          padding: 3, 
          style: { 
            fontWeight: 'bold', 
            color: '#1098ad', 
            fontFamily: 'Arial'
          } 
        }, 
        attributes_events: ''
      } 
    } 
  }; 
  
loadData(makeChart); 
  
function loadData(cb) { 
  JSC.fetch('./resources/events_data.csv') 
    .then(function(response) { 
      return response.text(); 
    }) 
    .then(function(text) { 
      var parsed = JSC.parseCsv(text); 
      cb(parsed.data); 
    }) 
    .catch(function(err) { 
      console.error(err); 
    }); 
} 
  
function makeChart(data) { 
  //Format csv data into points that will bind the calendar cells. 
  chartConfig.series = [ 
    { 
      points: data.map(function(row) { 
        var labelText = 
          '<br><span style="color:#78909c;font-size:12px; font-weight:normal">' + 
          row[2] + 
          '</span>' + 
          " <br><span  style='font-size:9px; font-weight:normal; color:#9da9af;'>" + 
          JSC.formatDate(new Date(row[0]), 't') + 
          ' - ' + 
          JSC.formatDate(new Date(row[1]), 't') + 
          '</span>'; 
        return { 
          date: [row[0], row[1]], 
          attributes: { events: [labelText] } 
        }; 
      }) 
    } 
  ]; 
  chart = JSC.chart('chartDiv', chartConfig); 
} 