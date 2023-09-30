<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
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
<script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
	
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


<h1>원자재 추가</h1>

<input type="submit" value="추가">
<input type="button" value="취소">

<table border="1">
<tr>
<th>코드</th>
<th>종류</th>
<th>이름</th>
<th>단위</th>
<th>수량</th>
<th>가격</th>
<th>유통기한</th>
<th>창고</th>
<th>비고</th>
</tr>

<tr>
<!-- 코드 -->
<td><input type="text" name="raw_code"></td>
<!-- 종류 -->
<td><select class="raw_type" name="raw_type">
		<option value="1">--선택--</option>
		<option value="2">우유</option>
		<option value="3">설탕</option>
		<option value="4">파우더</option>
		<option value="5">조미료</option>
</select></td>
<!-- 이름 -->
<td><select class="raw_name" name="raw_name">
		<option value="1">--선택--</option>
		<option value="2">헤비크림</option>
		<option value="3">라이트크림</option>
		<option value="4">반지질크림</option>
		<option value="5">휘핑크림</option>
</select></td> 
<!-- 단위 -->
<td><input type="text" name="raw_unit" size="3"></td>
<!-- 수량 -->
<td><input type="text" name="raw_amount"  size="3"></td>
<!-- 가격 -->
<td><input type="text" name="raw_price"  size="5"></td>
<!-- 유통기한 -->
<td><input type="text" name="raw_exp" size="13"></td>
<!-- 창고 -->
<td><select class="wh_code" name="raw_exp">
		<option value="1">--선택--</option>
		<option value="2">1센터</option>
		<option value="3">2센터</option>
		<option value="4">3센터</option>
		<option value="5">4센터</option>
</select></td>
<!-- 비고 -->
<td><input type="text" name="raw_note"  size="6"></td>
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
