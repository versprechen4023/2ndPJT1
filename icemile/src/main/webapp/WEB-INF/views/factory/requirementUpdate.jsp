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
	  	<script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
 		<link href="../resources/css/addTableHorizontal.css" rel="stylesheet" />
</head>

<body>
		<div id ="container">	
		<form action="${pageContext.request.contextPath}/factory/updateRequirement?req_code=${requirementDTO.req_code}" method="POST">
			<h1>소요량 수정</h1>

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
					<td><input type="text" name="req_code" id="req_code" value="${requirementDTO.req_code }"></td> <!-- 소요량 코드 -->
					<td><input type="text" name="prod_code"></td>  <!-- 완제품 코드 -->
					<td><input type="text" name="raw_code" ></td>  <!-- 원자재 코드 -->
					<td><input type="text" name="req_amount"></td>  <!-- 소요량 -->
					<td><input type="date" name="req_insertDATE"></td>  <!-- 등록일 -->
					<td><input type="date" name="req_upDATEDATE" ></td>  <!-- 수정일 -->
					<td><input type="text" name="req_note"></td>  <!-- 비고 -->
			</tr>
			</table>

			<!-- 등록 버튼 -->
			<div id="bottomContainer">
				<input type="submit" id="btn" value="수정">
			</div>
			
		</form>
		</div>
		
<!-- 푸터 -->
<jsp:include page="../include/footer.jsp"></jsp:include>
<!-- 푸터 --> 

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="../resources/js/scripts.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/umd/simple-datatables.min.js" crossorigin="anonymous"></script>
        <script src="../resources/js/datatables-simple-demo.js"></script>
    </body>
</html>
