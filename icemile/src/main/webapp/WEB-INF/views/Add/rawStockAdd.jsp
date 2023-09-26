<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>아이스마일</title>
<link
	href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css"
	rel="stylesheet" />
<link href="../resources/css/styles.css" rel="stylesheet" />
<script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js"
	crossorigin="anonymous"></script>
	
	<style>
 table {
    width: 100%;
    border-top: 1px solid #444444;
    border-collapse: collapse;
  }
  th, td {
    border-bottom: 1px solid #444444;
    padding: 10px;
        text-align: center;
  }
  

</style>
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

<h1>원자재재고 추가</h1>

<input type="submit" value="추가">
<input type="button" value="취소">

<table border="1">
<tr>
<th>코드</th>
<th>원자재이름</th>
<th>종류</th>
<th>수량</th>
<th>창고</th>
<th>담당자</th>
<th>실수량</th>
<th>재고실사</th>
<th>재고확인날짜</th>
</tr>

<tr>
<!-- 코드(재고코드?, 자재코드?) -->
<td><input type="text" name="stock_code"></td>
<!-- 원자재 이름 -->
<td><input type="text" name="raw_name"></td>
<!-- 종류 (종류가 뜻하는게 이게 맞는지? 혹은 원자재, 완젤품을 나누는건지? 원자제,완제품을 나눈다면 페이지를 따로 나눌 필요가 없음) -->
<td><select class="raw_type" name="raw_type">
      <option value="1">--선택--</option>
      <option value="2">우유</option>
      <option value="3">설탕</option>
      <option value="4">파우더</option>
      <option value="5">조미료</option>
</select></td>
<!-- 수량 -->
<td><input type="text" name="raw_amount" size="3"></td>
<!-- 창고(코드) -->
<td><input type="text" name="wh_code"></td>
<!-- 담당자(창고담당자?) -->
<td><input type="text" name="emp_num"></td>
<!-- 실수량 ( 원자재수량 - 소요량?? ) 재고현황으로 name 설정해둠 -->
<td><input type="text" name="stock_status"></td>
<!-- 재고실사 : 재고수량이 맞는지 실제로 확인하는것을 뜻함 / int로 되어있는데 0과 1로 구분하는건지?? -->
<td><input type="text" name="stock_amount"></td>
<!-- 재고체크날짜 -->
<td><input type="date" name="stock_date"></td>

</tr>
</table>
				<!-- 내용들어가는곳 -->
				
			</main>
<!-- 푸터 -->
<jsp:include page="../include/footer.jsp"></jsp:include>
<!-- 푸터 -->  
                
            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="../resources/js/scripts.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/umd/simple-datatables.min.js" crossorigin="anonymous"></script>
        <script src="../resources/js/datatables-simple-demo.js"></script>
    </body>
</html>
