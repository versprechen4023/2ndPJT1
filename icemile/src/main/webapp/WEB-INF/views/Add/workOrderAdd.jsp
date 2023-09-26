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

<h1>작업지시관리 추가</h1>

<input type="submit" value="추가">
<input type="button" value="취소">

<table border="1">
<tr>
<th>코드</th>
<th>품목</th>
<th>제품명</th>
<th>수주량</th>
<th>납품예정일</th>
<th>원자재소요량</th>
<th>지시일자</th>
<th>지시수량</th>

<tr>
<!-- 코드 -->
<td><input type="text" name="work_code"></td>
<!-- 품목(완제품 종류(맛?)) -->
<td><select class="raw_taste" name="prod_taste">
      <option value="1">--선택--</option>
      <option value="2">초코</option>
      <option value="3">포도</option>
      <option value="4">레몬</option>
      <option value="5">요거트</option>
</select></td>
<!-- 제품명 --> 
<td><select class="raw_name" name="prod_name">
      <option value="1">--선택--</option>
      <option value="2">아빠는 외계인</option>
      <option value="3">사랑에 빠진 포도</option>
      <option value="4">화이트소르베</option>
      <option value="5">요거트쉐이크</option>
</select></td>
<!-- 수주량 (수주관리-주문량) -->
<td><input type="text" name="order_amount" size="3"></td>
<!-- 납품예정일 (수주관리-납품예정일) -->
<td><input type="date" name="out_plan_date"></td>
<!-- 원자재소요량 (소요량-소요량???) -->
<td><input type="text" name="req_amount" size="3"></td>
<!-- 지시일자 -->
<td><input type="date" name="work_order_date"></td>
<!-- 지시수량 -->
<td><input type="text" name="work_order_amount" size="3"></td>
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
