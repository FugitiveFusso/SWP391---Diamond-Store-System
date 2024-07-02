
// ---------- CHARTS ----------

Highcharts.mapChart('map-chart', {
  chart: {
    map: 'custom/world'
  },
  title: {
    text: 'Top 5 Countries with Most Diamonds Sold'
  },
  mapNavigation: {
    enabled: true,
    buttonOptions: {
      verticalAlign: 'bottom'
    }
  },
  colorAxis: {
    min: 0
  },
  series: [{
    data: [
      { 'code': 'US', 'value': 1000 },
      { 'code': 'SZ', 'value': 900 },
      { 'code': 'IN', 'value': 800 },
      { 'code': 'ML', 'value': 700 },
      { 'code': 'MZ', 'value': 600 }
    ],
    mapData: Highcharts.maps['custom/world'],
    joinBy: ['iso-a2', 'code'],
    name: 'Diamonds Sold',
    states: {
      hover: {
        color: '#a4edba'
      }
    },
    dataLabels: {
      enabled: true,
      format: '{point.name}'
    }
  }]
});

// Bar Chart
var optionsBar = {
  series: [{
    data: [500, 400, 300, 200, 100] // Example data, replace with actual data
  }],
  chart: {
    type: 'bar',
    height: 350
  },
  plotOptions: {
    bar: {
      horizontal: true,
      colors: {
        ranges: [{
          from: 0,
          to: 1000,
          color: '#007bff' // Color for the bars
        }]
      }
    }
  },
  dataLabels: {
    enabled: false
  },
  yaxis: {
    labels: {
      style: {
        colors: ['#fff', '#fff', '#fff', '#fff', '#fff'], // Colors for each label
        fontSize: '14px'
      }
    }
  },
  xaxis: {
    categories: ['Product 1', 'Product 2', 'Product 3', 'Product 4', 'Product 5'], // Example categories, replace with actual data
    labels: {
      style: {
        colors: ['#fff', '#fff', '#fff', '#fff', '#fff'], // Colors for each label
        fontSize: '14px'
      }
    }
  }
};

var chartBar = new ApexCharts(document.querySelector("#bar-chart"), optionsBar);
chartBar.render();


// AREA CHART
const areaChartOptions = {
  series: [
    {
      name: 'Purchase Orders',
      data: [31, 40, 28, 51, 42, 109, 100],
    },
    {
      name: 'Sales Orders',
      data: [11, 32, 45, 32, 34, 52, 41],
    },
  ],
  chart: {
    type: 'area',
    background: 'transparent',
    height: 250,  // Reduced height
    width: 900,
    stacked: false,
    toolbar: {
      show: false,
    },
  },
  colors: ['#00ab57', '#d50000'],
  labels: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul'],
  dataLabels: {
    enabled: false,
  },
  fill: {
    gradient: {
      opacityFrom: 0.4,
      opacityTo: 0.1,
      shadeIntensity: 1,
      stops: [0, 100],
      type: 'vertical',
    },
    type: 'gradient',
  },
  grid: {
    borderColor: '#55596e',
    yaxis: {
      lines: {
        show: true,
      },
    },
    xaxis: {
      lines: {
        show: true,
      },
    },
  },
  legend: {
    labels: {
      colors: '#f5f7ff',
    },
    show: true,
    position: 'top',
  },
  markers: {
    size: 6,
    strokeColors: '#1b2635',
    strokeWidth: 3,
  },
  stroke: {
    curve: 'smooth',
  },
  xaxis: {
    axisBorder: {
      color: '#55596e',
      show: true,
    },
    axisTicks: {
      color: '#55596e',
      show: true,
    },
    labels: {
      offsetY: 5,
      style: {
        colors: '#f5f7ff',
      },
    },
  },
  yaxis: [
    {
      title: {
        text: 'Purchase Orders',
        style: {
          color: '#f5f7ff',
        },
      },
      labels: {
        style: {
          colors: ['#f5f7ff'],
        },
      },
    },
    {
      opposite: true,
      title: {
        text: 'Sales Orders',
        style: {
          color: '#f5f7ff',
        },
      },
      labels: {
        style: {
          colors: ['#f5f7ff'],
        },
      },
    },
  ],
  tooltip: {
    shared: true,
    intersect: false,
    theme: 'dark',
  },
};

const areaChart = new ApexCharts(
  document.querySelector('#area-chart'),
  areaChartOptions
);
areaChart.render();

// DEGREE USAGE PIE CHART
const degreePieChartOptions = {
  series: [95.24, 4.76],
  chart: {
    type: 'pie',
    background: 'transparent',
    height: 130,  // Reduced height
  },
  labels: ['Used', 'Not Used'],
  legend: {
    labels: {
      colors: '#f5f7ff',
    },
    show: true,
    position: 'bottom',
  },
  tooltip: {
    theme: 'dark',
  },
};

const degreePieChart = new ApexCharts(
  document.querySelector('#degree-pie-chart'),
  degreePieChartOptions
);
degreePieChart.render();

// DIAMOND USAGE PIE CHART
const diamondPieChartOptions = {
  series: [53.33, 46.67],
  chart: {
    type: 'pie',
    background: 'transparent',
    height: 130,  // Reduced height
  },
  labels: ['Used', 'Not Used'],
  legend: {
    labels: {
      colors: '#f5f7ff',
    },
    show: true,
    position: 'bottom',
  },
  tooltip: {
    theme: 'dark',
  },
};

const diamondPieChart = new ApexCharts(
  document.querySelector('#diamond-pie-chart'),
  diamondPieChartOptions
);
diamondPieChart.render();

$(document).ready(function () {
  $('.menu-btn').click(function () {
    $('.side-bar').addClass('active');
    $('.menu-btn').css("visibility", "hidden");
  });

  $('.close-btn').click(function () {
    $('.side-bar').removeClass('active');
    $('.menu-btn').css("visibility", "visible");
  });

  $('.sub-btn').click(function () {
    $(this).closest('.charts-card').find('.table-container').slideToggle();
    $(this).find('.dropdown').toggleClass('rotate');
  });
});

