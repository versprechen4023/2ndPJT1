<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>����</h1>

<input type="submit" value="�߰�">
<input type="button" value="���">

<table border="1">
<tr>
<th>���� �ڵ�</th>
<th>����ó</th>
<th>ǰ��</th>
<th>���ַ�</th>
<th>���� ����</th>
<th>�԰�����</th>
<th>���� ��Ȳ</th>
<th>�����</th>
</tr>

<tr>
<!-- ���� �ڵ� -->
<td><input type="text" name="raw_order_code"></td>
<!-- ����ó -->
<td><select class="buy_name" name="buy_name">
		<option value="1">--����--</option>
		<option value="2">��������</option>
		<option value="3">CJ�����ÿ���</option>
		<option value="4">��ؾ�����</option>
</select></td>
<!-- ��ǰ�� -->
<td><select class="prod_name" name="prod_name">
		<option value="1">--����--</option>
		<option value="2">���ũ��</option>
		<option value="3">����Ʈũ��</option>
		<option value="4">������ũ��</option>
		<option value="5">����ũ��</option>
</select></td> 
<!-- ���ַ� -->
<td><input type="text" name="raw_order_amount" size="3"></td>
<!-- ���� ���� -->
<td><input type="text" name="raw_order_date"  size="13"></td>
<!-- �԰����� -->
<td><input type="text" name="in_plan_date"  size="13"></td>
<!-- ���� ���� ��Ȳ -->
<td><input type="text" name="raw_status" size="10"></td>
<!-- ���� ����� -->
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