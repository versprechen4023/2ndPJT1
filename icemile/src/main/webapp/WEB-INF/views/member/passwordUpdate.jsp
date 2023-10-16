<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>아이스마일</title>
	  	<script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
 		<link href="../resources/css/addTableVertical.css" rel="stylesheet" />
</head>

<body>
	 			<!-- 내용들어가는곳 -->
	<form action="#" id="signup" name="signup" method="POST">
		<h1>비밀번호 변경</h1>
		
<table>
<tr><td  class="tdbold">현재 비밀번호</td><td>
	  <input type="password" name="emp_pw" id="emp_pw">
	  </td></tr>

<tr><td  class="tdbold">변경할 비밀번호</td><td>
	  <input type="password" name="emp_newPw1" id="emp_newPw1">
	  </td></tr>

<tr><td  class="tdbold">변경할 비밀번호 재확인</td><td>
	  <input type="password" name="emp_newPw2" id="emp_newPw2">
	  </td></tr>
</table>    

		<span id="passmsg"></span>
		
		<!-- 등록 버튼 -->
		<div id="bottomContainer"> 
			<input type="submit" id="btn" value="등록">
		</div>

	</form>
	
<!-- 푸터 --> 
<jsp:include page="../include/footer.jsp"></jsp:include> 
<!-- 푸터 -->   


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
    	
    	if($('#emp_newPw1').val() == ""){
    		$('#passmsg').css('color','red');
    		$('#passmsg').text("변경할 비밀번호를 입력하십시오."); 
    		$('#emp_newPw1').focus();
    		return false;
    	}
    	
    	if($('#emp_newPw2').val() == ""){
    		$('#passmsg').css('color','red');
    		$('#passmsg').text("비밀번호 재확인 부분을 입력하십시오."); 
    		$('#emp_newPw2').focus();
    		return false;
    	}
    	
    	if($('#emp_newPw1').val() !== $('#emp_newPw2').val()){
    		$('#passmsg').css('color','red');
    		$('#passmsg').text("비밀번호 확인부분이 서로 일치하지 않습니다."); 
    		$('#emp_newPw1').focus();
    		return false;
    	}
    	
    	// 정규식검사
    	var regPass = /^(?=.*[a-zA-Z])(?=.*\d)(?=.*[#^()_=+@$!%*?&])[A-Za-z\d#^()_=+@$!%*?&]{6,}$/;
    	
    	if (!regPass.test($('#emp_newPw1').val())) {
    		$('#passmsg').css('color','red');
    		$('#emp_newPw1').text("변경할 비밀번호는 6자이상의 영문, 숫자, 특수문자가 포함되어야 합니다.");
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
                	 Swal.fire({
                		 title: '<div style="font-size:18px">비밀번호 변경이 완료되었습니다.</div>',
              		   	 icon: 'success',
              		   	 confirmButtonText: '확인',
              		   	 width: '400px',
              		   	 heigh: '20px'
                	 }).then(result => {
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