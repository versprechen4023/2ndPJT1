<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>소요량 추가</h1>

<input type="submit" value="추가">
<input type="button" value="취소">

<table border="1">
<tr>
<th>코드</th>
<th>종류</th>
<th>이름</th>
<th>단위</th>
<th>수량</th>
<th>판매단가</th>
<th>유통기한</th>
<th>거래지점</th>
<th>창고</th>
<th>비고</th>
</tr>

<tr>
<!-- 코드 -->
<td><input type="text" name="prod_code"></td>
<!-- 종류 -->
<td><select class="raw_type" name="prod_taste">
		<option value="1">--선택--</option>
		<option value="2">우유</option>
		<option value="3">설탕</option>
		<option value="4">파우더</option>
		<option value="5">조미료</option>
</select></td>
<!-- 이름 -->
<td><select class="raw_name" name="prod_name">
		<option value="1">--선택--</option>
		<option value="2">아빠는 외계인</option>
		<option value="3">사랑에 빠진 포도</option>
		<option value="4">화이트 소르베</option>
		<option value="5">요거트 쉐이크</option>
</select></td> 
<!-- 단위 -->
<td><input type="text" name="prod_unit" size="3"></td>
<!-- 수량 -->
<td><input type="text" name="prod_amount"  size="3"></td>
<!-- 판매단가 -->
<td><input type="text" name="prod_price"  size="5"></td>
<!-- 유통기한 -->
<td><input type="text" name="prod_exp" size="13"></td>
<!-- 거래지점 -->
<!-- 지점이 많을 경우 지점 찾기 페이지를 추가, 적을 경우 드롭 다운 -->
<td><input type="text" name="branch_code" size="13"></td>
<!-- 창고 -->
<td><select class="wh_code" name="wh_code">
		<option value="1">--선택--</option>
		<option value="2">1센터</option>
		<option value="3">2센터</option>
		<option value="4">3센터</option>
		<option value="5">4센터</option>
</select></td>
<!-- 비고 -->
<td><input type="text" name="prod_note"  size="6"></td>
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