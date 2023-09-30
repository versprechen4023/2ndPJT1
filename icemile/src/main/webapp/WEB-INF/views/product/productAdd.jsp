<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html lang="en">
<head>
<!-- ��� -->
<jsp:include page="../include/head.jsp"></jsp:include>
<!-- ��� -->
	
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

<body class="sb-nav-fixed">
<main>

<h1>����ǰ �߰�</h1>

<form>
<input type="submit" value="�߰�">
<input type="button" value="���">
<table border="1">
<tr>
<th>�̸�</th>
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
<td><input type="text" name="prod_name" id="prod_name"></td>
<!-- ǰ������ -->
<td>
<select name="type" id="type">
		<option value="">ǰ�������� �����Ͻʽÿ�</option>
		<option value="R">������</option>
		<option value="P">����ǰ</option>
</select>
</td>
<!-- �̸� -->
<td>
<select name="prod_type" id="prod_type">
		<option value="">������������ �����Ͻʽÿ�</option>
		<option value="1">����</option>
		<option value="2">ũ��</option>
</select>
</td> 
<!-- ���� -->
<td><input type="text" name="prod_unit" size="3"></td>
<!-- ���� -->
<td><input type="text" name="prod_amount" size="3"></td>
<!-- �ǸŴܰ� -->
<td><input type="text" name="prod_price" size="5"></td>
<!-- ������� -->
<td><input type="text" name="prod_exp" size="13" readonly></td>
<!-- �ŷ����� -->
<!-- ������ ���� ��� ���� ã�� �������� �߰�, ���� ��� ��� �ٿ� -->
<td><input type="text" name="branch_code" size="13"></td>
<!-- â�� -->
<td>
<input type="text" name="wh_code" size="13">
</td>
<!-- ��� -->
<td><input type="text" name="prod_note"  size="6"></td>
</tr>

</table>
</form>
				
			</main>
                
            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="../resources/js/scripts.js"></script>
        
<!-- ����Ʈ��Ŀ J�������� ����ϱ����� ȣ�� -->
<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<!--  ����Ʈ��Ŀ Ŀ���� css-->
<link rel="stylesheet" type="text/css" href="../resources/css/datepicker.css">

<!-- sweetalert2 API ȣ�� -->
<link rel="stylesheet"
		href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
	<script
src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>
<script>
// ���� ���� ����
var currentDate = new Date();

$(document).ready(function() {
	
	//������� ����Ʈ ��Ŀ
	$("#prod_exp").datepicker({
	dateFormat: 'yy-mm-dd',
	prevText: '���� ��',
	nextText: '���� ��',
	monthNames: ['1��','2��','3��','4��','5��','6��','7��','8��','9��','10��','11��','12��'],
	monthNamesShort: ['1��','2��','3��','4��','5��','6��','7��','8��','9��','10��','11��','12��'],
	dayNames: ['��','��','ȭ','��','��','��','��'],
	dayNamesShort: ['��','��','ȭ','��','��','��','��'],
	dayNamesMin: ['��','��','ȭ','��','��','��','��'],
	showMonthAfterYear: true,
	yearSuffix: '��',
	minDate: currentDate
	});

});
</script>
    </body>
</html>
