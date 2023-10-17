// Set new default font family and font color to mimic Bootstrap's default styling
Chart.defaults.global.defaultFontFamily = '-apple-system,system-ui,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif';
Chart.defaults.global.defaultFontColor = '#292b2c';

// Bar Chart Example
var ctx = document.getElementById("myChart");
var myLineChart = new Chart(ctx, {
  type: 'bar',
  data: {
    labels: ['Red', 'Blue', 'Yellow', 'Green', 'Purple', 'Orange'],
    datasets: [{
      label: '# of ',
      backgroundColor: 'rgba(68, 112, 175, 0.69)',
      borderColor: 'rgba(68, 112, 175, 0.69)',
      data: [12, 19, 3, 5, 2, 3],
    }],
  },
  options: {
    scales: {
      yAxes: [{
        ticks: {
          min: 0,
          max: 100,
          maxTicksLimit: 5
        }
        }]
        }
        }
  
});
