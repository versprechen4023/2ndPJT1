<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>


<h1>������ �߰�</h1>

<input type="submit" value="�߰�">
<input type="button" value="���">

<table border="1">
<tr>
<th>�ڵ�</th>
<th>����</th>
<th>�̸�</th>
<th>����</th>
<th>����</th>
<th>����</th>
<th>�������</th>
<th>â��</th>
<th>���</th>
</tr>

<tr>
<td><input type="text" name="raw_code"></td>
<td><select class="raw_type" name="raw_type">
		<option value="1">--����--</option>
		<option value="2">����</option>
		<option value="3">����</option>
		<option value="4">�Ŀ��</option>
		<option value="5">���̷�</option>
</select></td>
<td><select class="raw_name" name="raw_name">
		<option value="1">--����--</option>
		<option value="2">���ũ��</option>
		<option value="3">����Ʈũ��</option>
		<option value="4">������ũ��</option>
		<option value="5">����ũ��</option>
</select></td> 
<td><input type="text" name="raw_unit" size="3"></td>
<td><input type="text" name="raw_amount"  size="3"></td>
<td><input type="text" name="raw_price"  size="5"></td>
<td><input type="text" name="raw_exp" size="13"></td>
<td><select class="wh_code" name="raw_exp">
		<option value="1">--����--</option>
		<option value="2">1����</option>
		<option value="3">2����</option>
		<option value="4">3����</option>
		<option value="5">4����</option>
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