<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
	<form action="#" id="signup" name="signup" method="POST">
		<h1>
			<b>비밀번호 변경</b>
		</h1>
    
    <br><br>

		<!-- 현재비밀번호 -->
		<b>현재 비밀번호:</b> <input type="password" name="emp_pw" id="emp_pw">
		<br>

		<!-- 현재비밀번호 -->
		<b>변경할 비밀번호:</b> <input type="password" name="emp_newPw1" id="emp_newPw1">
		<br>

		<!-- 현재비밀번호 -->
		<b>변경할 비밀번호 재확인:</b> <input type="password" name="emp_newPw2" id="emp_newPw2">
		<br>
		<span id="passmsg"></span>
		<br>

		<!-- 등록 버튼 -->
		<div id="btn">
			<input type="submit" id="btn" value="등록">
		</div>
	</form>


<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<!-- sweetalert2 API 호출 -->
<link rel="stylesheet"
		href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
	<script
src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>

<script>
//J쿼리 함수 시작지점
$(document).ready(function() {
	
  	//서브밋 제어
    $('#signup').submit(function(event) {
    	
    	if($('#emp_pw').val() == ""){
    		$('#passmsg').css('color','red');
    		$('#passmsg').text("현재 비밀번호를 입력하십시오."); 
    		$('#emp_pw').focus();
    		return false;
    	}
    	
    	 // 다입력되었다면 AJAX 폼태그 데이터 제출시작
    	 event.preventDefault(); // 기본 폼 제출 동작을 막음
    		
    	 // 폼 데이터 직렬화
    	 var formData = $('#signup').serialize();
         
         $.ajax({
             type: "POST",
             url: "${pageContext.request.contextPath}/member_ajax/updatePassword",
             data: formData,
             success: function(response) {
            	 
            	 const result = $.trim(response);
            	 
            	 // 비밀번호 정상변경 되었을경우 변경 출력
                 if (result == "true") {
                	 Swal.fire('비밀번호 변경이 완료되었습니다.', '성공', 'success').then(result => {
					 	if(result.isConfirmed)
						window.close(); // 성공 시 창 닫기
					 });
                 } else {
                	 // 비밀번호 일치하지 않을경우 값 초기화
                	 $('#emp_pw').val('');
                	 $('#emp_newPw1').val('');
                	 $('#emp_newPw2').val('');
       
                	 $('#passmsg').css('color','red');
             		 $('#passmsg').text("현재 비밀번호가 일치하지 않습니다."); 
                 }
             },
             error: function () {
            	 Swal.fire('서버통신에 문제가 발생했습니다.', '실패', 'error');
             }
         });
    	
    });//submit기능 제어 끝
});
</script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
		crossorigin="anonymous"></script>
	
</body>
</html>