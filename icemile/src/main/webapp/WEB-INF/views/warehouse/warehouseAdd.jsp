<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	
<!DOCTYPE html>
<html lang="en">
<head>
 <title>icemile</title>
  <link href="../resources/css/addTable.css" rel="stylesheet" />
</head>

<body>
	
	<main>
	<form action="${pageContext.request.contextPath }/warehouse/warehouseAdd"
		id="warehouseAdd" name="warehouseAdd" method="post">
		<h1>창고 추가</h1>
		   <div class = "btn">
			 <button type="reset" id="cancle" >취소</button>
			 <button type="submit" id="save" >저장</button>
			</div>
		<table border="1" id="whTable">
			<tr>
				<th>창고 코드</th>
				<th>창고 이름</th>
				<th>창고 종류</th>
				<th>창고 위치</th>
				<th>창고 전화번호</th>
				<th>완제품 코드</th>
				<th>원자재 코드</th>
				<th>창고 담당자</th>
				<th>비고</th>
			</tr>

			<tr>
				<!-- 코드 -->
				<td><input type="text" name="wh_code" size="11"></td>
				<!-- 이름 -->
				<td><input type="text" name="wh_name" size="7"></td>
				<!-- 종류 -->
				<td><select class="wh_type" name="wh_type">
						<option value="1">--선택--</option>
						<option value="2">R:원자재</option>
						<option value="3">R:완재품</option>			
				</select></td>
				<!-- 위치 -->
				<td><input type="text" name="wh_location" size="7"></td>
				<!-- 전화번호 -->
				<td><input type="text" name="wh_phone" size="11"></td>
				<!-- 완제품 코드 -->
				<td><input type="text" name="prod_code"></td>
				<!-- 원자재 코드 -->
				<td><input type="text" name="raw_code" size="11"></td>
				<!-- 담당자 -->
				<td><input type="text" name="emp_num" size="5"></td>
				<!-- 비고 -->
				<td><input type="text" name="wh_note" size="6"></td>			
			</tr>

		</table>
	</form>
	
	</main>
	
<!-- 푸터 -->
<jsp:include page="../include/footer.jsp"></jsp:include>
<!-- 푸터 -->
	
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
		crossorigin="anonymous"></script>
	<script src="../resources/js/scripts.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/umd/simple-datatables.min.js"
		crossorigin="anonymous"></script>
	<script src="../resources/js/datatables-simple-demo.js"></script>
	
	
	<script type="text/javascript">   
	//============================ 버튼 구현 ====================================//	
	//추가//////////////////////////////////////////////////
	
	   // 저장 -> 저장
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
				icon: 'info',
				width: '300px',
			})
			
		}else{
		}
		
	       }); // save
		
			// 취소버튼(=리셋)
			$('#cancle').click(function () {
				$('#fr').each(function () {
					this.reset();
				});
			}); // cancle click	
			
			
			
//	 		페이지를 새로 고치는 함수
			function cancle() {
			    location.reload();
			}		

	</script>
</body>
</html>
