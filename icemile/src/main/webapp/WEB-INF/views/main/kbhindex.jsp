<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>아이스마일</title>
        <link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css" rel="stylesheet" />
        <link href="../resources/css/styles.css" rel="stylesheet" />
        <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
    </head>
    <body class="sb-nav-fixed">  
<!-- 헤더 -->
<jsp:include page="../include/header.jsp"></jsp:include>
<!-- 헤더 -->

<style>
@font-face {
    font-family: 'Pretendard-Regular';
    src: url('https://cdn.jsdelivr.net/gh/Project-Noonnu/noonfonts_2107@1.1/Pretendard-Regular.woff') format('woff');
    font-weight: 400;
    font-style: normal;
}
*{
    font-family: 'Pretendard-Regular';
}
h1{
	font-weight: 600;
}
</style>
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
                                <!-- 주어진 HTML 코드에서 "월별판매실적"을 표시하는 원리는 다음과 같습니다: -->

<!-- Chart.js 라이브러리 사용: "월별판매실적" 카드 내부에는 <canvas> 요소가 있습니다. -->
<!--  이 요소의 ID는 "myAreaChart"로 설정되어 있습니다. Chart.js는 HTML5 <canvas> 요소를 사용하여 그래프 및 차트를 그리는 JavaScript 라이브러리입니다. -->

<!-- Chart.js 라이브러리 로드: 아래의 스크립트를 통해 Chart.js 라이브러리가 로드됩니다. -->

<!-- html -->
<!-- Copy code -->
<!-- <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script> -->
<!-- 차트 데이터 제공: "월별판매실적"을 표시하는 JavaScript 파일인 "chart-area-demo.js"가 로드됩니다. -->
<!-- html -->
<!-- Copy code -->
<!-- <script src="../resources/assets/demo/chart-area-demo.js"></script> -->
<!-- Chart.js 설정 및 데이터 연결: "chart-area-demo.js" 파일에서 Chart.js 라이브러리를 사용하여 "myAreaChart"  -->
<!-- <canvas> 요소에 월별 판매 실적 데이터를 연결하고 차트를 그립니다. 이 파일에는 차트 유형, 레이블, 데이터 등의 설정이 포함되어 있습니다. -->

<!-- 차트 그리기: "myAreaChart" 요소에 설정된 데이터에 따라 Chart.js가 그래프를 생성하고 "월별판매실적"을 해당 차트로 표시합니다. -->

<!-- Chart.js를 사용하면 사용자에게 시각적인 방식으로 데이터를 제공할 수 있으며, "월별판매실적"을 효과적으로 시각화할 수 있게 도와줍니다. -->
<!--  이러한 라이브러리를 사용하면 데이터를 다양한 그래프 및 차트로 표현하는 작업을 간편하게 수행할 수 있습니다.                                     -->
                                    <div class="card-header">
                                        <i class="fas fa-chart-area me-1"></i>
                                        월별판매실적
                                    </div>
                                    <div class="card-body"><canvas id="myAreaChart" width="100%" height="40"></canvas></div>
                                    
                                </div>
                                
                            </div>
                            
                            <div class="col-xl-6">
                                <div class="card mb-4">
                                    <div class="card-header">
                                        <i class="fas fa-chart-bar me-1"></i>
                                        생산일정(달력)
                                    </div>
                                    <div class="card-body"><canvas id="myBarChart" width="100%" height="40"></canvas></div>
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
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="../resources/js/scripts.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
        <script src="../resources/assets/demo/chart-area-demo.js"></script>
        <script src="../resources/assets/demo/chart-bar-demo.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/umd/simple-datatables.min.js" crossorigin="anonymous"></script>
        <script src="../js/datatables-simple-demo.js"></script>
   
   
        <script type="text/javascript">
        
        //차트 월별 실적
        var salesData = [1, 2, 15, 3, 25, 4, 35];

        var ctx = document.getElementById('myAreaChart').getContext('2d');
        
        var myChart = new Chart(ctx, {
            type: 'bar', // 차트 유형 (예: 'line', 'bar', 'pie' 등)
            data: {
                labels: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul'], // X축 레이블
                datasets: [{
                    label: '월별 판매 실적',
                    data: salesData, // 위에서 설정한 데이터 배열
                    borderColor: 'rgba(75, 192, 192, 1)', // 선 색상
                    borderWidth: 1, // 선 굵기
                }]
            },
            options: {
                // 차트 옵션 설정 (예: 스케일, 제목, 축 레이블 등)
            }
        });

        
        
        </script> 
    </body>
</html>