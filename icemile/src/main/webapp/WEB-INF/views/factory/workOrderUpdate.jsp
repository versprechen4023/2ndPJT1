<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<!-- 헤드 -->
<jsp:include page="../include/head.jsp"></jsp:include>
<!-- 헤드 -->
	<style>
body {
	display: flex;
	justify-content: center;
	align-items: center;
	height: 100vh; /* 화면 높이 100%로 설정하여 수직 중앙 정렬 */
	margin: 0; /* 페이지 바깥 여백 제거 */
}
h1 {
	text-align: center; /* 가로 중앙 정렬 */
}
#btn {
	text-align: center; /* 가로 중앙 정렬 */
	margin: 10px; /* 버튼 간격 설정 */
	font-size: 16px; /* 버튼 텍스트 크기 설정 */
	padding: 10px 20px; /* 버튼 안 여백 설정 */
}
</style>
</head>
<body class="sb-nav-fixed">
				<!-- 내용들어가는곳 -->
	<form action="${pageContext.request.contextPath }/factory/workOrderUpdatePro" id="registration" name="registration" method="POST" enctype="multipart/form-data">
		<h1>
			<b>작업 지시 추가</b>
		</h1>

		<br>

		<table class="">
		<tr>
						<!-- <th>지시코드</th> -->
						<th>작업지시자</th>
						<th>라인코드</th>
						<th>라인명</th>
						<th>수주코드</th>
						<th>제품명</th>
						<th>주문량</th>
						<th>생산공정</th>
						<!-- <th>지시날짜</th> -->
						<th>지점명</th>
		</tr>
		<tr>
						<!-- 일단 타입 텍스트로 다 작업. 추후에 불러올 때 수정 -->
						<!-- <td><input type="text" name="work_code" id="work_code"></td>  -->
						<td><input type="text" name="emp_num" id="emp_num" value="${workOrderDTO.emp_num}"></td>  <!-- 사원 정보 가져오기 --> 
						<td><input type="text" name="line_code" id="line_code" value="${workOrderDTO.line_code}"></td>  <!-- 라인 코드(정보) 가져오기 -->
						<td><input type="text" name="line_name" id="line_name" value="${workOrderDTO.line_name}"></td>  <!-- 사원 코드 가져왔을시 자동으로 해당 라인 이름 등록 -->
						<td><input type="text" name="order_code" id="order_code" value="${workOrderDTO.order_code}"></td>  <!-- 수주 코드(정보) 가져오기 -->
						<td><input type="text" name="prod_name" id="prod_name" value="${workOrderDTO.prod_name}"></td>   <!-- 수주 코드 가져왔을시 자동으로 해당 제품명 등록 -->
						<td><input type="text" name="order_amount" id="order_amount" value="${workOrderDTO.order_amount}"></td>  <!-- 수주 코드 가져왔을시 자동으로 해당 지시량 등록 -->
						<td><input type="text" name="line_process" id="line_process" value="${workOrderDTO.line_process}"></td>  <!-- 라인 코드 가져왔을시 자동으로 해당 라인 공정 등록 -->
						<!-- <td><input type="text" name="work_order_date" id="work_odrder_date"></td>  -->
						<td><input type="text" name="branch_name" id="branch_name" value="${workOrderDTO.branch_name}"></td>  <!-- 수주 코드 가져왔을시 자동으로 해당 지점명 등록 -->

		</tr>
		
		
		
		</table>








		<!-- 등록 버튼 -->
		<div id="btn">
			<input type="submit" id="btn" value="수정">
		</div>
	<input type="hidden" name="work_code" id="work_code" value="${workOrderDTO.work_code}">
	</form>




<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<!-- sweetalert2 API 호출 -->
<link rel="stylesheet"
		href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
	<script
src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>

<script>


// J쿼리 함수 시작지점
$(document).ready(function() {
	        
  	//서브밋 제어
    $('#registration').submit(function(event) {
    	
       	if($('#buy_name').val() == ""){
    		$('#buy_name_msg').css('color','red');
    		$('#buy_name_msg').text("상호명을 입력하십시오."); 
    		$('#buy_name').focus();
    		return false;
    	}
    	
    	if($('#buy_reg').val() == ""){
    		$('#buy_reg_msg').css('color','red');
    		$('#buy_reg_msg').text("사업자 등록번호을 입력하십시오.");
    		$('#buy_reg').focus();
    		return false;
    	}
    	
    	if($('#buy_ceo').val() == ""){
    		$('#buy_ceo_msg').css('color','red');
    		$('#buy_ceo_msg').text("대표자를 입력하십시오.");  
    		$('#buy_ceo').focus();
    		return false;
    	}
    	
    	if($('#buy_emp').val() == ""){
    		$('#buy_emp_msg').css('color','red');
    		$('#buy_emp_msg').text("거래처 직원을 입력하십시오.");
    		$('#buy_emp').focus();
    		return false;
    	}
    	
    	if($('#emp_num').val() == ""){
    		$('#emp_num_msg').css('color','red');
    		$('#emp_num_msg').text("구매 담당자를 입력하십시오.");
    		$('#emp_num').focus();
    		return false;
    	}
    	
    	if($('#buy_type').val() == ""){
    		$('#buy_type_msg').css('color','red');
    		$('#buy_type_msg').text("업종 유형을 선택하십시오.");
    		$('#buy_type').focus();
    		return false;
    	}
    	
    	if($('#hbuy_phone').val() == ""){
    		$('#buy_phone_msg').css('color','red');
    		$('#buy_phone_msg').text("전화번호를 입력하십시오.");
    		$('#buy_phone').focus();
    		return false;
    	}
    	

    	
    	if($('#buy_post').val() == "" || $('#addr1').val() == ""){
    		$('#buy_add_msg').css('color','red');
    		$('#buy_add_msg').text("주소를 입력하십시오.");
    		return false;
    	}
    	
    	if($('#email_id').val() == "" || $('#email_dns').val() == ""){
    		$('#emailmsg').css('color','red');
    		$('#emailmsg').text("이메일을 입력하십시오.");
    		return false;
    	}
    	
    	 // 다입력되었다면 AJAX 폼태그 데이터 제출시작
    	 event.preventDefault(); // 기본 폼 제출 동작을 막음
    		
    	 // 폼 데이터 객체생성
    	 var formData = new FormData(this);
         
    	 $.ajax({
    		    type: "POST",
    		    url: "${pageContext.request.contextPath}/factory_ajax/workOrderUpdate",
    		    data: formData,
    		    contentType: false,
    		    processData: false,
    		    success: function(response) {
    		        if (response === "true") {
    		            Swal.fire('정보 입력이 완료되었습니다.', '성공', 'success').then(result => {
    		                if (result.isConfirmed) {
    		                    window.opener.location.reload();
    		                    window.close();
    		                }
    		            });
    		        } else {
    		            Swal.fire('정보 입력에 실패했습니다.', '실패', 'error');
    		        }
    		    },
    		    error: function() {
    		        Swal.fire('서버 통신에 문제가 발생했습니다.', '실패', 'error');
    		    }
    		});
    	
    });//submit기능 제어 끝
});
</script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
		crossorigin="anonymous"></script>
	<script src="../resources/js/scripts.js"></script>
	
</body>
</html>