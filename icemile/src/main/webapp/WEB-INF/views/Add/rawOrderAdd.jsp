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
<th>발주 코드</th>
<th>발주처</th>
<th>품명</th>
<th>발주량</th>
<th>발주 일자</th>
<th>입고예정일</th>
<th>진행 상황</th>
<th>담당자</th>
</tr>

<tr>
<!-- 발주 코드 -->
<td><input type="text" name="raw_order_code"></td>
<!-- 발주처 -->
<td><select class="buy_name" name="buy_name">
		<option value="1">--선택--</option>
		<option value="2">매일유업</option>
		<option value="3">CJ프레시웨이</option>
		<option value="4">비앤씨마켓</option>
</select></td>
<!-- 제품명 -->
<td><select class="prod_name" name="prod_name">
		<option value="1">--선택--</option>
		<option value="2">헤비크림</option>
		<option value="3">라이트크림</option>
		<option value="4">반지질크림</option>
		<option value="5">휘핑크림</option>
</select></td> 
<!-- 발주량 -->
<td><input type="text" name="raw_order_amount" size="3"></td>
<!-- 발주 일자 -->
<td><input type="text" name="raw_order_date"  size="13"></td>
<!-- 입고예정일 -->
<td><input type="text" name="in_plan_date"  size="13"></td>
<!-- 발주 진행 상황 -->
<td><input type="text" name="raw_status" size="10"></td>
<!-- 발주 담당자 -->
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