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
<th>�����ڵ�</th>
<th>��ǰ��</th>
<th>�ֹ���</th>
<th>��ǰ������</th>
<th>���� ��Ȳ</th>
<th>�����</th>
</tr>

<tr>
<!-- ���� �ڵ� -->
<td><input type="text" name="order_code"></td>
<!-- �����ڵ� -->
<td><select class="branch_code" name="branch_code">
		<option value="1">--����--</option>
</select></td> 
<!-- ��ǰ�� -->
<td><select class="prod_name" name="prod_name">
		<option value="1">--����--</option>
		<option value="2">�ƺ��� �ܰ���</option>
		<option value="3">����� ���� ����</option>
		<option value="4">ȭ��Ʈ �Ҹ���</option>
		<option value="5">���Ʈ ����ũ</option>
</select></td>
<!-- �ֹ��� -->
<td><input type="text" name="order_amount" size="3"></td>
<!-- ��ǰ������ -->
<td><input type="text" name="out_plan_date" size="13"></td>
<!-- ���� ���� ��Ȳ -->
<td><input type="text" name="order_status" size="10"></td>
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