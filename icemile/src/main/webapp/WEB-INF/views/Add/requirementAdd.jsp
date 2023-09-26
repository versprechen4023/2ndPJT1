<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>���̽�����</title>
<link
	href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css"
	rel="stylesheet" />
<link href="../resources/css/styles.css" rel="stylesheet" />
<script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
	
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
	<!-- ��� -->
	<jsp:include page="../include/header.jsp"></jsp:include>
	<!-- ��� -->

	<div id="layoutSidenav">
		<!-- ���̵�� -->
		<jsp:include page="../include/sidebar.jsp"></jsp:include>
		<!-- ���̵�� -->
		<div id="layoutSidenav_content">
			<main>
<h1>�ҿ䷮ �߰�</h1>

<input type="submit" value="�߰�">
<input type="button" value="���">

<table border="1">
<tr>
<th>�ҿ䷮ �ڵ�</th>
<th>����ǰ �ڵ�</th>
<th>������ �ڵ�</th>
<th>�����</th>
<th>�ҿ䷮</th>
<th>������</th>
<th>���</th>
</tr>

<tr>
<!-- �ҿ䷮ �ڵ� -->
<td><input type="text" name="req_code" size="11"></td>
<!-- ����ǰ �ڵ� -->
<td><input type="text" name="prod_code" size="11"></td>
<!-- ������ �ڵ� -->
<td><input type="text" name="raw_code" size="11"></td> 
<!-- ����� -->
<td><input type="text" name="req_insertdate" size="12"></td>
<!-- �ҿ䷮ -->
<td><input type="text" name="req_amount"  size="3"></td>
<!-- ������ -->
<td><input type="text" name="req_updatedate"  size="12"></td>
<!-- ��� -->
<td><input type="text" name="req_note"  size="6"></td>
</tr>

</table>

				<!-- ������°� -->
				
			</main>
<!-- Ǫ�� -->
<jsp:include page="../include/footer.jsp"></jsp:include>
<!-- Ǫ�� -->  
                
            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="../resources/js/scripts.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/umd/simple-datatables.min.js" crossorigin="anonymous"></script>
        <script src="../resources/js/datatables-simple-demo.js"></script>
    </body>
</html>
