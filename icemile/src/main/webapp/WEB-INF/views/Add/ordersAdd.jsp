<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>발주</h1>

<input type="submit" value="추가">
<input type="button" value="취소">

<table border="1">
<tr>
<th>수주 코드</th>
<th>지점코드</th>
<th>제품명</th>
<th>주문량</th>
<th>납품예정일</th>
<th>진행 상황</th>
<th>담당자</th>
</tr>

<tr>
<!-- 수주 코드 -->
<td><input type="text" name="order_code"></td>
<!-- 지점코드 -->
<td><select class="branch_code" name="branch_code">
		<option value="1">--선택--</option>
</select></td> 
<!-- 제품명 -->
<td><select class="prod_name" name="prod_name">
		<option value="1">--선택--</option>
		<option value="2">아빠는 외계인</option>
		<option value="3">사랑에 빠진 포도</option>
		<option value="4">화이트 소르베</option>
		<option value="5">요거트 쉐이크</option>
</select></td>
<!-- 주문량 -->
<td><input type="text" name="order_amount" size="3"></td>
<!-- 납품예정일 -->
<td><input type="text" name="out_plan_date" size="13"></td>
<!-- 수주 진행 상황 -->
<td><input type="text" name="order_status" size="10"></td>
<!-- 수주 담당자 -->
<td><input type="text" name="emp_num" size="13"></td>

</tr>

</table>


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
</body>
</html>