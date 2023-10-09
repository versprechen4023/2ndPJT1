<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>in_material_add</title>

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
<body>
<h1>입고 등록</h1>

<form action="${pageContext.request.contextPath}/shipping/inMaterialInsert" method="POST">
<input type="submit" value="추가">
<input type="reset" value="취소">

<table border="1">
<tr>
<th>입고코드</th>
<th>창고코드</th>
<th>발주코드</th>
<th>담당자</th>
<th>입고현황</th>
<!-- <th>수정일</th> -->
</tr>

<tr>
<!-- 입고 코드 -->
<td><input type="text" name="in_code" size="12"></td>
<!-- 입고 창고 코드 -->
<td><input type="text" name="in_wh_code" size="12"></td>
<!-- 발주 코드 -->
<td><input type="text" name="raw_order_code"  size="12"></td>
<!-- 입고 담당자 -->
<td><input type="text" name="emp_num"  size="12"></td>
<!-- 입고 현황 -->
<td><select name="in_status" id="in_status">
	<option value="">현황 선택</option>
   	<option value="1">입고전</option>
    <option value="2">입고중</option>
    <option value="3">입고확정</option>
		</select> 
</td>

<!-- 거래지점 -->
<!-- 지점이 많을 경우 지점 찾기 페이지를 추가, 적을 경우 드롭 다운 -->
<!-- <td><input type="text" name="branch_code" size="13"></td> -->

<!-- 창고 -->
<!-- <td><select class="wh_code" name="wh_code"> -->
<!--       <option value="1">--선택--</option> -->
<!--       <option value="2">1센터</option> -->
<!--       <option value="3">2센터</option> -->
<!--       <option value="4">3센터</option> -->
<!--       <option value="5">4센터</option> -->
<!-- </select></td> -->

<!-- 비고 -->
<!-- <td><input type="text" name="in_material_note"  size="6"></td> -->
<!-- </tr> -->

</table>
</form>

</body>
</html>