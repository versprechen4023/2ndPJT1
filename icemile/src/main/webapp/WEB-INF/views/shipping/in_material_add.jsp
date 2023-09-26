<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>in_material_add</title>
</head>
<body>
<h1>입고 관리</h1>

<input type="submit" value="추가">
<input type="button" value="취소">

<table border="1">
<tr>
<th>입고 코드</th>
<th>입고 창고 코드</th>
<th>발주 코드</th>
<th>입고 담당자</th>
<th>입고 현황</th>
<th>거래 지점</th>
<th>창고</th>
<th>비고</th>
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
<td><input type="text" name="instatus" size="12"></td>

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
<td><input type="text" name="in_material_note"  size="6"></td>
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