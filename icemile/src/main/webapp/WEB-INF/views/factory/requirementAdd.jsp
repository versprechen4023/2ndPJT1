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
	<!-- 헤더 -->
	<jsp:include page="../include/header.jsp"></jsp:include>
	<!-- 헤더 -->

	<div id="layoutSidenav">
		<!-- 사이드바 -->
		<jsp:include page="../include/sidebar.jsp"></jsp:include>
		<!-- 사이드바 -->
		<div id="layoutSidenav_content">
			<main>
<h1>소요량 등록</h1>

<form action="${pageContext.request.contextPath}/factory/insertRequirement" method="POST">
<input type="submit" value="추가">
<input type="reset" value="취소">

<table border="1">
<tr>

<!-- <th>소요량 코드</th> 소요량 코드는 자동추가를 하기때문에 필요없을 듯.. -->
<th>완제품 코드</th>
<th>원자재 코드</th>
<th>소요량</th>
<th>등록일</th>
<th>수정일</th>
<th>비고</th>
</tr>


<tr>
<!-- 소요량 코드 -->
<!-- <td><input type="text" value="" name="req_code" size="11"></td> -->
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
        <script src="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/umd/simple-datatables.min.js" crossorigin="anonymous"></script>
        <script src="../resources/js/datatables-simple-demo.js"></script>
<script>
$(document).ready(function() {
    $("form").submit(function(event) {
        // 입력 필드 중 빈 칸이 있는지 확인합니다.
        var reqCode = $("input[name='req_code']").val();
        var prodCode = $("input[name='prod_code']").val();
        var rawCode = $("input[name='raw_code']").val();
        var reqAmount = $("input[name='req_amount']").val();
        var reqInsertDate = $("input[name='req_insertDATE']").val();
        var reqUpdateDate = $("input[name='req_upDATEDATE']").val();
        var errorFlag = false;

        if (reqCode === "") {
            alert("소요량 코드를 입력해 주세요.");
            errorFlag = true;
        }
        if (prodCode === "") {
            alert("완제품 코드를 입력해 주세요.");
            errorFlag = true;
        }
        if (rawCode === "") {
			alert("원자재 코드를 입력해 주세요.");
			errorFlag = true;
        }
        if (reqAmount === ""){
        	alert("소요량을 입력해 주세요.");
        	errorFlag = true;
        }
        if (reqInsertDate === "") {
			alert("등록일을 입력해 주세요.");
			errorFlag = true;
        }
        if (reqUpdateDate === "") {
			alert("수정일을 입력해 주세요.");
			errorFlag = true;
        }
        if (reqUpdateDate === "") {
			alert("수정일을 입력해 주세요.");
			errorFlag = true;
        }
        if (errorFlag) {
            // 빈 칸이 있을 경우, 폼 제출을 막습니다.
            event.preventDefault();
        }
    });
});
</script>
    </body>
</html>
