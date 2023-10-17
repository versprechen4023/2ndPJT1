<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
   <head>
<!-- 헤드 -->
<jsp:include page="../include/head.jsp"></jsp:include>
<!-- 헤드 -->
    </head>
    <body class="sb-nav-fixed">  
<!-- 헤더 -->
<jsp:include page="../include/header.jsp"></jsp:include>
<!-- 헤더 -->

        <div id="layoutSidenav">
<!-- 사이드바 -->
<jsp:include page="../include/sidebar.jsp"></jsp:include>
<!-- 사이드바 -->
            <div id="layoutSidenav_content">
                <main>
                <!-- 내용들어가는곳 -->
                    <div class="container-fluid px-4">
                        <h1 class="mt-4">아이스마일</h1>
                        <ol class="breadcrumb mb-4">
<!--                      <li class="breadcrumb-item active">Dashboard</li> -->
                        </ol>
                        <div class="row">
                            <div class="col-xl-3 col-md-6">
                                <div class="card bg-primary text-white mb-4">
                                    <div class="card-body">기준정보</div>
                                    <div class="card-footer d-flex align-items-center justify-content-between">
                                        <a class="small text-white stretched-link" href="#">View Details</a>
                                        <div class="small text-white"><i class="fas fa-angle-right"></i></div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xl-3 col-md-6">
                                <div class="card bg-warning text-white mb-4">
                                    <div class="card-body">자재</div>
                                    <div class="card-footer d-flex align-items-center justify-content-between">
                                        <a class="small text-white stretched-link" href="#">View Details</a>
                                        <div class="small text-white"><i class="fas fa-angle-right"></i></div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xl-3 col-md-6">
                                <div class="card bg-success text-white mb-4">
                                    <div class="card-body">생산</div>
                                    <div class="card-footer d-flex align-items-center justify-content-between">
                                        <a class="small text-white stretched-link" href="#">View Details</a>
                                        <div class="small text-white"><i class="fas fa-angle-right"></i></div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xl-3 col-md-6">
                                <div class="card bg-danger text-white mb-4">
                                    <div class="card-body">영업</div>
                                    <div class="card-footer d-flex align-items-center justify-content-between">
                                        <a class="small text-white stretched-link" href="#">View Details</a>
                                        <div class="small text-white"><i class="fas fa-angle-right"></i></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-xl-6">
                                <div class="card mb-4">
                                    <div class="card-header">
                                        <i class="fas fa-chart-area me-1"></i>
                                        월별 판매 실적
                                    </div>
                                    <div class="card-body"><canvas id="monthlySale" width="100%" height="40"></canvas></div>
                                </div>
                            </div>
                            <div class="col-xl-6">
                                <div class="card mb-4">
                                    <div class="card-header">
                                        <i class="fas fa-chart-bar me-1"></i>
                                        월별 생산 실적
                                    </div>
                                    <div class="card-body"><canvas id="monthlyProd" width="100%" height="40"></canvas></div>
                                </div>
                            </div>
                        </div>
                    </div>
                <!-- 내용들어가는곳 -->	    
                </main>

<!-- 푸터 -->
<jsp:include page="../include/footer.jsp"></jsp:include>
<!-- 푸터 -->
            </div>
        </div>
         <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="../resources/js/scripts.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
<!--         <script src="../resources/assets/demo/chart-area-demo.js"></script> -->
        <script src="../resources/assets/demo/chart-bar-demo.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/umd/simple-datatables.min.js" crossorigin="anonymous"></script>
        <script src="../js/datatables-simple-demo.js"></script>
        
<script>

// 라인 차트 생성 함수 
function monthlySaleChart(data) {

  var context = document.getElementById('monthlySale').getContext('2d');

  if (data && data.length > 0) { 

    var labels = data.map(function(item) { return item.label; });
    var data   = data.map(function(item) { return item.data; });

    var monthlySale = new Chart(context, {
      type: 'line',
      data: {
        labels: labels,
        datasets: [{
          label:'',
          data:data,
          lineTension: 0.3,
          backgroundColor: "rgba(2,117,216,0.2)",
          borderColor: "rgba(2,117,216,1)",
          pointRadius: 5,
          pointBackgroundColor: "rgba(2,117,216,1)",
          pointBorderColor: "rgba(255,255,255,0.8)",
          pointHoverRadius: 5,
          pointHoverBackgroundColor: "rgba(2,117,216,1)",
          pointHitRadius: 50,
          pointBorderWidth: 2
        }]
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
    	          max: 400000,
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
    	  } //options
     });
   } else {
     console.error('데이터가 없습니다.');
   }
}



//AJAX 요청을 통해 서버에서 데이터 가져오기 및 차트 생성 시작하기
$.ajax({
  url: '${pageContext.request.contextPath}/main/monthlySale',
  type: 'GET',
}).done(function(data){
	monthlySaleChart(data);
}).fail(function(xhr, status, error){
	console.error('데이터를 가져오지 못했습니다.', error);
});



// 바 차트 생성 함수 
function monthlyProdChart(data) {

  var context = document.getElementById('monthlyProd').getContext('2d');

  if (data && data.length > 0) { 

    var labels = data.map(function(item) { return item.label; });
    var data   = data.map(function(item) { return item.data; });

    var monthlyProd = new Chart(context, {
      type: 'bar',
      data: {
        labels: labels,
        datasets: [{
          label:'',
          data:data,
          backgroundColor: "rgba(2,117,216,1)",
          borderColor: "rgba(2,117,216,1)",
        }]
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
    	          maxTicksLimit: 6
    	        }
    	      }],
    	      yAxes: [{
    	        ticks: {
    	          min: 0,
    	          max: 300,
    	          maxTicksLimit: 5
    	        },
    	        gridLines: {
    	        	display: true
    	        }
    	      }],
    	    },
    	    legend: {
    	      display: false
    	    }
    	  } //options
     });
   } else {
     console.error('데이터가 없습니다.');
   }
}


//AJAX 요청을 통해 서버에서 데이터 가져오기 및 차트 생성 시작하기
$.ajax({
  url: '${pageContext.request.contextPath}/main/monthlyProd',
  type: 'GET',
}).done(function(data){
	monthlyProdChart(data);
}).fail(function(xhr, status, error){
	console.error('데이터를 가져오지 못했습니다.', error);
});


</script>        
        
        
    </body>
</html>