<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>�ҿ䷮ �߰�</h1>

<input type="submit" value="�߰�">
<input type="button" value="���">

<table border="1">
<tr>
<th>�ڵ�</th>
<th>����</th>
<th>�̸�</th>
<th>����</th>
<th>����</th>
<th>�ǸŴܰ�</th>
<th>�������</th>
<th>�ŷ�����</th>
<th>â��</th>
<th>���</th>
</tr>

<tr>
<!-- �ڵ� -->
<td><input type="text" name="prod_code"></td>
<!-- ���� -->
<td><select class="raw_type" name="prod_taste">
		<option value="1">--����--</option>
		<option value="2">����</option>
		<option value="3">����</option>
		<option value="4">�Ŀ��</option>
		<option value="5">���̷�</option>
</select></td>
<!-- �̸� -->
<td><select class="raw_name" name="prod_name">
		<option value="1">--����--</option>
		<option value="2">�ƺ��� �ܰ���</option>
		<option value="3">����� ���� ����</option>
		<option value="4">ȭ��Ʈ �Ҹ���</option>
		<option value="5">���Ʈ ����ũ</option>
</select></td> 
<!-- ���� -->
<td><input type="text" name="prod_unit" size="3"></td>
<!-- ���� -->
<td><input type="text" name="prod_amount"  size="3"></td>
<!-- �ǸŴܰ� -->
<td><input type="text" name="prod_price"  size="5"></td>
<!-- ������� -->
<td><input type="text" name="prod_exp" size="13"></td>
<!-- �ŷ����� -->
<!-- ������ ���� ��� ���� ã�� �������� �߰�, ���� ��� ��� �ٿ� -->
<td><input type="text" name="branch_code" size="13"></td>
<!-- â�� -->
<td><select class="wh_code" name="wh_code">
		<option value="1">--����--</option>
		<option value="2">1����</option>
		<option value="3">2����</option>
		<option value="4">3����</option>
		<option value="5">4����</option>
</select></td>
<!-- ��� -->
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