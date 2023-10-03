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
<h1>소요량 수정</h1>

<form action="${pageContext.request.contextPath}/factory/updateRequirement?req_code=${requirementDTO.req_code}" method="POST">
<input type="submit" value="수정">
<!-- <input type="button" value="취소" onclick="window.close();"> 스크립트 사용시 화면 닫음-->
<!-- 초기화 버튼 -->
<input type="reset" value="취소">

<table border="1">
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
<td>${requirementDTO.req_code }</td>
<!-- 완제품 코드 -->
<td><input type="text" name="prod_code" size="11"></td>
<!-- 원자재 코드 -->
<td><input type="text" name="raw_code" size="11"></td> 
<!-- 소요량 -->
<td><input type="text" name="req_amount" size="3"></td>
<!-- 등록일 -->
<td><input type="date" name="req_insertDATE"  size="12"></td>
<!-- 수정일 -->
<td><input type="date" name="req_upDATEDATE"  size="12"></td>
<!-- 비고 -->
<td><input type="text" name="req_note"  size="6"></td>
</tr>

</table>
</form>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="../resources/js/scripts.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/umd/simple-datatables.min.js" crossorigin="anonymous"></script>
        <script src="../resources/js/datatables-simple-demo.js"></script>
    </body>
</html>
