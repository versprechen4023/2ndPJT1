<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
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
	
	<style>
body {
	display: flex;
	justify-content: center;
	align-items: center;
	height: 100vh; /* 화면 높이 100%로 설정하여 수직 중앙 정렬 */
	margin: 0; /* 페이지 바깥 여백 제거 */
}
h1 {
	text-align: center; /* 가로 중앙 정렬 */
	margin: 30px;
}
#btn {
	text-align: center; /* 가로 중앙 정렬 */
	margin: 20px; /* 버튼 간격 설정 */
	font-size: 16px; /* 버튼 텍스트 크기 설정 */
	padding: 5px 20px; /* 버튼 안 여백 설정 */
}
th {
	text-align: center; /* 가로 중앙 정렬 */
}
</style>
</head>

<body class="sb-nav-fixed">

			<main>
<h1>소요량 수정</h1>

<form action="${pageContext.request.contextPath}/factory/updateRequirement?req_code=${requirementDTO.req_code}" method="POST">


<table>
<tr>
<th>소요량 코드</th>
<th>완제품 코드</th>
<th>원자재 코드</th>
<th>소요량</th>
<th>등록일</th>
<th>수정일</th>
<th>비고</th>
</tr>


<tr>
<!-- 소요량 코드 -->
<td><input type="text" name="req_code" id="req_code" value="${requirementDTO.req_code }"></td>
<!-- 완제품 코드 -->
<td><input type="text" name="prod_code"></td>
<!-- 원자재 코드 -->
<td><input type="text" name="raw_code" ></td> 
<!-- 소요량 -->
<td><input type="text" name="req_amount"></td>
<!-- 등록일 -->
<td><input type="date" name="req_insertDATE"></td>
<!-- 수정일 -->
<td><input type="date" name="req_upDATEDATE" ></td>
<!-- 비고 -->
<td><input type="text" name="req_note"></td>
</tr>

</table>

		<!-- 등록 버튼 -->
		<div id="btn">
			<input type="submit" id="btn" value="수정">
		</div>
		
<!-- 푸터 -->
<jsp:include page="../include/footer.jsp"></jsp:include>
<!-- 푸터 --> 

</form>

			</main>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="../resources/js/scripts.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/umd/simple-datatables.min.js" crossorigin="anonymous"></script>
        <script src="../resources/js/datatables-simple-demo.js"></script>
    </body>
</html>
