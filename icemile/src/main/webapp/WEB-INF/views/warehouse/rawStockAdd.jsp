<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<!-- 헤더 -->
<jsp:include page="../include/header.jsp"></jsp:include>
<!-- 헤더 -->
<!-- 헤드 -->
<jsp:include page="../include/head.jsp"></jsp:include>
<!-- 헤드 -->
</head>
<body class="sb-nav-fixed">
<div id="layoutSidenav">
		<!-- 사이드바 -->
		<jsp:include page="../include/sidebar.jsp"></jsp:include>
		<!-- 사이드바 -->
            <div id="layoutSidenav_content">
<main>

<h1>원자재 재고</h1>

<div class = "btn">
<input type="submit" value="추가">
<input type="button" value="취소">
</div>

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
<!-- 코드 -->
<td><input type="text" name="stock_code"></td>
<!-- 원자재 이름 -->
<td><input type="text" name="raw_name"></td>
<!-- 종류 -->
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
<!-- 담당자 -->
<td><input type="text" name="emp_num"></td>
<!-- 실수량 / DB에 없으면 내가 알아서 이름 설정 해주면 됌 -->
<td><input type="text" name="stock_status"></td>
<!-- 재고실사  -->
<td><input type="text" name="stock_amount"></td>
<!-- 재고체크날짜 -->
<td><input type="date" name="stock_date"></td>

</tr>
</table>
				
</main>
<!-- 푸터 -->
<jsp:include page="../include/footer.jsp"></jsp:include>
<!-- 푸터 -->

            </div>
        </div>
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="../resources/js/scripts.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/umd/simple-datatables.min.js" crossorigin="anonymous"></script>
        <script src="../resources/js/facilityList_im.js"></script>
    </body>
</html>
