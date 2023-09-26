<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>


<h1>원자재 추가</h1>

<input type="submit" value="추가">
<input type="button" value="취소">

<table border="1">
<tr>
<th>코드</th>
<th>종류</th>
<th>이름</th>
<th>단위</th>
<th>수량</th>
<th>가격</th>
<th>유통기한</th>
<th>창고</th>
<th>비고</th>
</tr>

<tr>
<td><input type="text" name="raw_code"></td>
<td><select class="raw_type" name="raw_type">
		<option value="1">--선택--</option>
		<option value="2">우유</option>
		<option value="3">설탕</option>
		<option value="4">파우더</option>
		<option value="5">조미료</option>
</select></td>
<td><select class="raw_name" name="raw_name">
		<option value="1">--선택--</option>
		<option value="2">헤비크림</option>
		<option value="3">라이트크림</option>
		<option value="4">반지질크림</option>
		<option value="5">휘핑크림</option>
</select></td> 
<td><input type="text" name="raw_unit" size="3"></td>
<td><input type="text" name="raw_amount"  size="3"></td>
<td><input type="text" name="raw_price"  size="5"></td>
<td><input type="text" name="raw_exp" size="13"></td>
<td><select class="wh_code" name="raw_exp">
		<option value="1">--선택--</option>
		<option value="2">1센터</option>
		<option value="3">2센터</option>
		<option value="4">3센터</option>
		<option value="5">4센터</option>
</select></td>
<td><input type="text" name="raw_note"  size="6"></td>
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