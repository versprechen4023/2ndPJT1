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

<h1>매입처 추가</h1>

<input type="submit" value="추가">
<input type="button" value="취소">

<table border="1">
<tr>
<th>코드</th>
<th>매입처명</th>
<th>대표자</th>
<th>업종유형</th>
<th>연락처</th>
<th>주소지</th>
<th>우편번호</th>
<th>이메일</th>
<th>매입처담당자</th>
<th>담당자</th>
<th>사업자등록번호</th>
</tr>

<tr>
<!-- 코드 -->
<td><input type="text" name="buy_code"></td>
<!-- 매입처명 -->
<td><input type="text" name="buy_name"></td>
<!-- 대표자 -->
<td><input type="text" name="buy_ceo"></td>
<!-- 업종유형 / 이런 유형이 맞는지? 아니면 수정 --> 
<td><select class="raw_type" name="buy_type">
      <option value="1">--선택--</option>
      <option value="2">우유</option>
      <option value="3">설탕</option>
      <option value="4">파우더</option>
      <option value="5">조미료</option>
</select></td>
<!-- 연락처 -->
<td><input type="text" name="buy_phone"></td>
<!-- 주소지 / 똑같이 api 사용해서 들고올건지? -->
<td><input type="text" name="buy_add"></td>
<!-- 우편번호 / 똑같이 api 사용해서 들고올건지? -->
<td><input type="text" name="buy_post"></td>
<!-- 이메일 -->
<td><input type="text" name="buy_email" size="3"></td>
<!-- 매입처 담당자 -->
<td><input type="text" name="prod_amount"  size="3"></td>
<!-- 담당자 -->
<td><input type="text" name="prod_price"  size="5"></td>
<!-- 사업자등록번호 -->
<td><input type="text" name="prod_exp" size="13"></td>
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
