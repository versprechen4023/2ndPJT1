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

<h1>생산실적관리 추가</h1>

<input type="submit" value="추가">
<input type="button" value="취소">

<table border="1">
<tr>
<th>실적코드</th>
<th>작업지시코드</th>
<th>품목코드</th>
<!-- <th>라인코드</th> -->
<th>양품</th>
<th>불량</th>
<th>불량사유</th>
<th>비고</th>
</tr>

<tr>
<!-- 실적코드 -->
<td><input type="text" name="result_code"></td>
<!-- 작업지시코드 -->
<td><input type="text" name="work_code"></td>
<!-- 품목코드 -->
<td><input type="text" name="prod_code"></td>
<!-- 양품 -->
<td><input type="text" name="good_prod"></td>
<!-- 불량-->
<td><input type="text" name="faulty_prod"></td>
<!-- 불량사유 -->
<td><input type="text" name="faulty_reason"></td>
<!-- 비고 -->
<td><input type="text" name="remark"></td>
</tr>
<!-- 라인코드 추가할건지? 불량은 어떻게 표기하는지? -->
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
