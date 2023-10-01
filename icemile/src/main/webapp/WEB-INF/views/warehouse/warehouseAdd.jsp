<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	
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
<script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js"
	crossorigin="anonymous"></script>

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
	<form
		action="${pageContext.request.contextPath }/warehouse/warehouseAdd"
		id="warehouseAdd" name="warehouseAdd" method="post">
		<h1>â�� �߰�</h1>
		<table border="1" id="whTable">
			<tr>
				<th>â�� �ڵ�</th>
				<th>â�� �̸�</th>
				<th>â�� ����</th>
				<th>â�� ��ġ</th>
				<th>â�� ��ȭ��ȣ</th>
				<th>����ǰ �ڵ�</th>
				<th>������ �ڵ�</th>
				<th>â�� �����</th>
				<th>���</th>
			</tr>

			<tr>
				<!-- �ڵ� -->
				<td><input type="text" name="wh_code" size="11"></td>
				<!-- �̸� -->
				<td><input type="text" name="wh_name" size="7"></td>
				<!-- ���� -->
				<td><select class="wh_type" name="wh_type">
						<option value="1">--����--</option>
						<option value="2">R:������</option>
						<option value="3">R:����ǰ</option>			
				</select></td>
				<!-- ��ġ -->
				<td><input type="text" name="wh_location" size="7"></td>
				<!-- ��ȭ��ȣ -->
				<td><input type="text" name="wh_phone" size="11"></td>
				<!-- ����ǰ �ڵ� -->
				<td><input type="text" name="prod_code"></td>
				<!-- ������ �ڵ� -->
				<td><input type="text" name="raw_code" size="11"></td>
				<!-- ����� -->
				<td><input type="text" name="emp_num" size="5"></td>
				<!-- ��� -->
				<td><input type="text" name="wh_note" size="6"></td>
				
				
				<div>
				<button id="add" >�߰�</button>
				<button type="reset" id="cancle" >���</button>
				<button type="submit" id="save" >����</button>
				</div>
				
			</tr>

		</table>
	</form>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
		crossorigin="anonymous"></script>
	<script src="../resources/js/scripts.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/umd/simple-datatables.min.js"
		crossorigin="anonymous"></script>
	<script src="../resources/js/datatables-simple-demo.js"></script>
	
	
	<script type="text/javascript">   
	//============================ ��ư ���� ====================================//	
	//�߰�//////////////////////////////////////////////////
	
	// �߰� �� �ʿ��� ������
    var counter = 0;
    var codeNum = 0;
   	var whCode = 0;
		
   	    //id="add"�� Ŭ����
       	$('#add').click(function () {
			
       		//������ư�� ������ư�� ��Ȱ��ȭ ���·� ����°�
        	event.preventDefault();
        	$('#modify').attr("disabled", true);
			$('#delete').attr("disabled", true);       		
       		
			//
			$.ajax({
				//��û�� url�� �Է� 
				url: "/warehouse/whCode",
				//http �޼��带 get���� �ϰڴ�
				method: "GET",
				//���� �������� ���� ������ ������ ����
	 			dataType: "text",
	 			//��û�� �������� �� ������ �Լ��� �����մϴ�.�����κ��� ���� �����ʹ� 'data'�ް������� ���޵ȴ�.
	 			success: function (data) {
	 				 // Ajax ��û �ȿ��� �����͸� �޾ƿͼ� ������ �Ҵ� �� �ļ� �۾� ����	 				
	 				codeNum = data;
	 				 //����� �������� ��� ���� �޾ƿ����� Ȯ���ϱ� ���ؼ�
	 				 console.log("Ajax ���ο����� codeNum:", codeNum); // Ajax ���ο����� codeNum: [�޾ƿ� ������]
			
					// ������ �Ҵ�� �����͸� ������� �߰� �۾� ����
 				    someFunction(codeNum);
	 			
	 			}//success
			
			})//ajax
			
			
			
			//������ someFunction�� �߰� �۾��� ���� �Լ�
			function someFunction(data) {
				 codeNum = data; // �ܺο����� codeNum: [�޾ƿ� ������]
				 
				 //���⼭ �츮�� �������� ����ǰ���� �ƴϸ� ������������ �����ϱ� ���� ������ ö�ڰ� ���Ƿ� ������ ������ �������ش�.
				 var num = parseInt(codeNum.substring(2,6)) + counter+1; // ���ڿ��� ���ڷ� ��ȯ�Ͽ� 1 ����
				 
				 // number: �е��� �����Դϴ�. �� ��� num ������ ���� ����մϴ�.
                 // length: �е��� ������ ���̸� ��Ÿ���� ������, codeNum.length - 2 ���� ���˴ϴ�.
                 // �̴� �е��� ���ڰ� �󸶳� ��������� �����ϴµ� ���˴ϴ�.
				 var paddedNum = padNumber(num, codeNum.length - 2); // ���ڸ� �е��Ͽ� ���� ����
				 
				 //codeNum�� ���ڸ� �����ִ°� 
	             whCode = codeNum.charAt(0)+ codeNum.charAt(1) + paddedNum.toString()+codeNum.charAt(6); // �е��� ���ڸ� �ٽ� ���ڿ��� ��ȯ
	             
	             
	             if ($('#add').hasClass('true')) {
	             //���� �߰����ִ� �Լ�
	             addRow();
	          	$('#add').removeClass('true');
	             }
	             
	             //ī���� ������ 1�� ���ؼ� �߰��� ���� ���� �����ϴ� ���� ���� ���� ��ȣ �Ǵ� ���� ������ �����ϴ� �� ���Ǿ�����.
	             counter++;
			} // someFunction(data)
			
			
			 
			//0�� �߰��ϴ� �Լ�
			//number�� �е��� ����
			//length �е��� ����� ����� �ϴ� ������ ����
			function padNumber(number, length) {
				//number �Ű������� ���ڿ��� ��ȯ�Ͽ� paddedNumber�� �����ϴ� ��
                var paddedNumber = number.toString();
				//0�� �߰� ���ִ� ��Ȱ
                while (paddedNumber.length < length) {
                    paddedNumber = "0" + paddedNumber;
                }
                return paddedNumber;
        } // padNumber(number, length)
        
        
        
        	// ���� -> ����
			$('#save').click(function () {
				
				var wh_code = $('#wh_code').val();
				var wh_name = $('#wh_name').val();
				var wh_type = $('#wh_type').val();
				var wh_location = $('#wh_location').val();
				var wh_phone = $('#wh_phone').val();
				var prod_code = $('#prod_code').val();
				var raw_code = $('#raw_code').val();
				var emp_num = $('#emp_num').val();
				var wh_note = $('#wh_note').val();
				
				if(wh_code == "" || wh_name == "" || wh_type == "" ||
				   wh_location == "" || wh_phone == "" || prod_code == "" || raw_code == ""|| 
				   raw_code == "" || emp_num == "" ){
					
					Swal.fire({
						title: "<div style='color:#495057;font-size:20px;font-weight:lighter'>" + "�׸��� ��� �Է��ϼ���"+ "</div>",
						icon: 'info',
						width: '300px',
					})
					
					
				}else{
					$('#warehouseAdd').attr("action", "/warehouse/warehouseAdd");
					$('#warehouseAdd').attr("method", "POST");
					$('#warehouseAdd').submit();
				}
				
			}); // save
        
	});//add.click
		
	
	
        // �߰� ��ư Ŭ�� �� row ����
        function addRow() {
        	
			var row = "<tr>";
			
			// â���ڵ�
			row += "<td>";
			row += "<input type='text' name='wh_code' id='wh_code' required value='"+whCode+"' size="11" class='input-fieldb'>";
			row += "</td>";
			
			// â���̸�
			row += "<td>";
			row += "<input type='text' name='wh_name' id='wh_name' size="7" required class='input-fieldb'>";
			row += "</td>";
			
			// â������
			row += "<td>";
			row += "<select name='wh_type' id='wh_type'";
			row += "<option value="����">--����--</option>";
			row += "<option value="������">R:������</option>";
			row += "<option value="����ǰ">R:����ǰ</option>";
			row += "</select>";
			row += "</td>";
			
			// ��ġ 
			row += "<td>";
			row += "<input type='text' name="wh_location" size="7" id='wh_location' required class='input-fieldb'>";
			row += "</td>";
			
			// ��ȭ��ȣ
			row += "<td>";
			row += "<input type='text' name="wh_phone" size="11" id='wh_phone' required class='input-fieldb'>";
			row += "</td>";
			
			// ����ǰ �ڵ�
			row += "<td>";
			row += "<input type="text" name="prod_code">"
			row += "</td>";
			
			// ������ �ڵ�
			row += "<td>";
			row += "<input type="text" name="raw_code" size="11">"
			row += "</td>";
			
			// �����
			row += "<td>";
			row += "<input type="text" name="emp_num" size="5">"
			row += "</td>";
			
			// ���
			row += "<td>";
			row += "<input type="text" name="wh_note" size="6">"
			row += "</tr>";
			
            $('#whTable').append(row);		
		} // addRow()
            
	
			// ��ҹ�ư(=����)
			$('#cancle').click(function () {
				$('#fr').each(function () {
					this.reset();
				});
			}); // cancle click	
	</script>
</body>
</html>
