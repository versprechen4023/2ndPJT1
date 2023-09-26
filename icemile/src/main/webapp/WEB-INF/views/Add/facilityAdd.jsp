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

<h1>생산설비관리 추가</h1>

<input type="submit" value="추가">
<input type="button" value="취소">

<table border="1">
<tr>
<th>생산라인코드</th>
<th>생산라인이름</th>
<th>생산공정</th>
<th>가동상태</th>
<th>설비전화번호</th>
<!-- <th>라인등록일</th> -->
<th>담당자</th>
<th>비고</th>

<tr>
<!-- 생산라인코드 -->
<td><input type="text" name="line_code"></td>
<!-- 생산라인이름 -->
<td><input type="text" name="line_name"></td>
<!-- 생산공정 -->
<td><select class="raw_taste" name="line_process">
      <option value="1">--선택--</option>
      <option value="2">1</option>
      <option value="3">2</option>
      <option value="4">3</option>
</select></td>
<!-- 가동상태 --> 
<td><select class="raw_name" name="line_status">
      <option value="1">--선택--</option>
      <option value="2">1</option>
      <option value="3">2</option>
      <option value="4">3</option>
</select></td>
<!-- 설비전화번호 -->
<td><input type="text" name="line_phone"></td>
<!-- 라인등록일 -->
<!-- <td><input type="date" name="line_indate"></td> -->
<!-- 담당자 -->
<td><input type="text" name="emp_num"></td>
<!-- 비고 -->
<td><input type="text" name="line_note"></td>
<!-- 라인등록일 필요한가? -->
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
