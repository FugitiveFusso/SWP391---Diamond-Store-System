
// ---------- CHARTS ----------

Highcharts.mapChart('map-chart', {
  chart: {
    map: 'custom/world',
    width: 600, // Adjusted width
    height: 300 // Adjusted height (if needed)
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
    height: 200, // Adjusted height
    width: 400   // Adjusted width
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
    categories: ['United States', 'Swaziland', 'India', 'Mali', 'Mozambique'], // Example categories, replace with actual data
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

document.querySelectorAll('.collapse-link').forEach(link => {
  link.addEventListener('click', function () {
    const collapseContent = this.closest('.x_title').nextElementSibling;
    collapseContent.classList.toggle('show');
    const icon = this.querySelector('i');
    icon.classList.toggle('fa-chevron-up');
    icon.classList.toggle('fa-chevron-down');
  });
});

document.addEventListener("DOMContentLoaded", function () {
  // Sample data for charts (replace with actual data)
  const ordersData = {
    categories: ['Home Delivery', 'Store Pickup'],
    series: [{
      data: [120, 80]
    }]
  };

  const weeklyOrdersData = {
    categories: ['Week 1', 'Week 2', 'Week 3', 'Week 4'],
    series: [{
      name: 'Orders',
      data: [30, 45, 60, 40]
    }]
  };

  const monthlyOrdersData = {
    categories: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun'],
    series: [{
      name: 'Orders',
      data: [150, 200, 180, 250, 210, 190]
    }]
  };

  // Initialize ApexCharts for each chart
  const ordersBarChartOptions = {
    chart: {
      type: 'bar',
      height: 350
    },
    plotOptions: {
      bar: {
        horizontal: false,
        columnWidth: '55%',
        endingShape: 'rounded'
      },
    },
    dataLabels: {
      enabled: true,
      style: {
        colors: ['#ffffff'] // White color for data labels
      }
    },
    stroke: {
      show: true,
      width: 2,
      colors: ['transparent']
    },
    xaxis: {
      categories: ordersData.categories,
      labels: {
        style: {
          colors: ['#ffffff'], // White color for x-axis labels
        }
      }
    },
    yaxis: {
      title: {
        text: 'Orders',
        style: {
          color: '#ffffff' // White color for y-axis title
        }
      },
      labels: {
        style: {
          colors: ['#ffffff'], // White color for y-axis labels
        }
      }
    },
    fill: {
      opacity: 1
    },
    tooltip: {
      y: {
        formatter: function (val) {
          return val
        }
      }
    }
  };
  
  const ordersWeeklyLineChartOptions = {
    chart: {
      type: 'line',
      height: 150,
    },
    series: [{
      name: 'Orders',
      data: weeklyOrdersData.series[0].data
    }],
    xaxis: {
      categories: weeklyOrdersData.categories,
      labels: {
        style: {
          colors: ['#ffffff', '#ffffff', '#ffffff', '#ffffff'], // White color for x-axis labels
        }
      }
    },
    yaxis: {
      title: {
        text: 'Orders',
        style: {
          color: '#ffffff' // White color for y-axis title
        }
      },
      labels: {
        style: {
          colors: ['#ffffff'], // White color for y-axis labels
        }
      }
    },
    markers: {
      size: 6
    },
    tooltip: {
      shared: true
    }
  };
  
  const ordersMonthlyLineChartOptions = {
    chart: {
      type: 'line',
      height: 150,
    },
    series: [{
      name: 'Orders',
      data: monthlyOrdersData.series[0].data
    }],
    xaxis: {
      categories: monthlyOrdersData.categories,
      labels: {
        style: {
          colors: ['#ffffff', '#ffffff', '#ffffff', '#ffffff', '#ffffff', '#ffffff'], // White color for x-axis labels
        }
      }
    },
    yaxis: {
      title: {
        text: 'Orders',
        style: {
          color: '#ffffff' // White color for y-axis title
        }
      },
      labels: {
        style: {
          colors: ['#ffffff'], // White color for y-axis labels
        }
      }
    },
    markers: {
      size: 6
    },
    tooltip: {
      shared: true
    }
  };
  

  // Render ApexCharts
  const ordersBarChart = new ApexCharts(document.querySelector("#orders-bar-chart"), ordersBarChartOptions);
  ordersBarChart.render();

  const ordersWeeklyLineChart = new ApexCharts(document.querySelector("#orders-weekly-line-chart"), ordersWeeklyLineChartOptions);
  ordersWeeklyLineChart.render();

  const ordersMonthlyLineChart = new ApexCharts(document.querySelector("#orders-monthly-line-chart"), ordersMonthlyLineChartOptions);
  ordersMonthlyLineChart.render();
});

const ordersColumnChartOptions = {
  chart: {
    type: 'bar',
    height: 150,
    colors: ['#3bafda', '#1abc9c'],
  },
  plotOptions: {
    bar: {
      horizontal: false,
      columnWidth: '55%',
      endingShape: 'rounded'
    },
  },
  dataLabels: {
    enabled: false
  },
  stroke: {
    show: true,
    width: 2,
    colors: ['transparent']
  },
  series: [{
    name: 'Home Delivery',
    data: [44, 55, 41, 67, 22, 43, 21],
    color: '#3bafda'
  }, {
    name: 'Store Pickup',
    data: [13, 23, 20, 8, 13, 27, 33],
    color: '#1abc9c'
  }],
  xaxis: {
    categories: ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'],
    labels: {
      style: {
        colors: ['#ffffff', '#ffffff', '#ffffff', '#ffffff', '#ffffff', '#ffffff'], // White color for x-axis labels
      }
    }
  },
  yaxis: {
    title: {
      text: 'Number of Orders',
      style: {
        color: '#ffffff' // White color for y-axis title
      }
    }
  },
  fill: {
    opacity: 1
  },
  tooltip: {
    y: {
      formatter: function (val) {
        return val + " orders"
      }
    }
  },
  legend: {
    colors: ['#ffffff', '#ffffff'], // White color for legend items
  }
};

const ordersColumnChart = new ApexCharts(document.querySelector("#orders-column-chart"), ordersColumnChartOptions);
ordersColumnChart.render();

const revenueWeekColumnChartOptions = {
  chart: {
    type: 'bar',
    width: 550,
    height: 150,
  },
  plotOptions: {
    bar: {
      horizontal: false,
      columnWidth: '55%',
      endingShape: 'rounded'
    },
  },
  dataLabels: {
    enabled: false
  },
  stroke: {
    show: true,
    width: 2,
    colors: ['transparent']
  },
  series: [{
    name: 'Revenue',
    data: [400, 550, 620, 800, 700, 850, 900]
  }],
  xaxis: {
    categories: ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'],
    labels: {
      style: {
        colors: '#ffffff' // White color for x-axis labels
      }
    }
  },
  yaxis: {
    title: {
      text: 'Revenue ($)',
      style: {
        color: '#ffffff' // White color for y-axis title
      }
    }
  },
  fill: {
    opacity: 1
  },
  tooltip: {
    y: {
      formatter: function (val) {
        return '$' + val
      }
    }
  },
  legend: {
    colors: ['#ffffff'], // White color for legend items
  }
};

const revenueMonthColumnChartOptions = {
  chart: {
    type: 'bar',
    width: 550,
    height: 150,
  },
  plotOptions: {
    bar: {
      horizontal: false,
      columnWidth: '55%',
      endingShape: 'rounded'
    },
  },
  dataLabels: {
    enabled: false
  },
  stroke: {
    show: true,
    width: 2,
    colors: ['transparent']
  },
  series: [{
    name: 'Revenue',
    data: [1600, 1800, 2000, 2200, 2400, 2600, 2800]
  }],
  xaxis: {
    categories: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul'],
    labels: {
      style: {
        colors: '#ffffff' // White color for x-axis labels
      }
    }
  },
  yaxis: {
    title: {
      text: 'Revenue ($)',
      style: {
        color: '#ffffff' // White color for y-axis title
      }
    }
  },
  fill: {
    opacity: 1
  },
  tooltip: {
    y: {
      formatter: function (val) {
        return '$' + val
      }
    }
  },
  legend: {
    colors: ['#ffffff'], // White color for legend items
  }
};

// Initialize the charts
const revenueWeekChart = new ApexCharts(document.querySelector("#revenue-week-column-chart"), revenueWeekColumnChartOptions);
revenueWeekChart.render();

const revenueMonthChart = new ApexCharts(document.querySelector("#revenue-month-column-chart"), revenueMonthColumnChartOptions);
revenueMonthChart.render();
