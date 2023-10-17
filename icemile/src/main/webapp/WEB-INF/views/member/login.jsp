<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>아이스마일</title>
 	    <link href="../resources/css/login.css" rel="stylesheet" />
 	    <link rel="icon" href="../resources/assets/img/favicon.ico" type="image/x-icon">
        <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
<style type="text/css">


</style>        
        
    </head>
    <body>
    <main>
    <div id="container">
	
		
		<img src="../resources/assets/img/icemile.png">
		
		
		<div class = "loginBox">
<!-- 		<div class ="loginTitle"><h2>로그인</h2></div> -->
		<form action="${pageContext.request.contextPath }/member/login" method="post" id ="checkForm">
		
			<div id ="checkFormInput">	  
			<input id="emp_num" name="emp_num" type="text" placeholder="사원번호" />
                                             
			<input id="emp_pw" name="emp_pw" type="password" placeholder="비밀번호" />
                                                
			<div class="inputRememberPassword"><input id="inputRememberPassword" type="checkbox" value="" />
                                                <label class="form-check-label" for="inputRememberPassword">사원번호 기억하기</label></div><br>
				
			</div>	
		 	
			<c:if test="${not empty msg}">
        	  <div class="msg">${msg}</div>
       	    </c:if>

        	<div class="loginBtn">
		
		<input type="submit" value="로그인" class="btnSubmit">
		
		</div> 
  		  </form>     
	
        </div>      
                                                      
	
	</div>
	</main>
    
      
<!-- 푸터 -->
<jsp:include page="../include/footer.jsp"></jsp:include>
<!-- 푸터 -->  


        
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="../resources/js/jquery.cookie.js"></script>
<script>
// 전역 변수 선언
var isChecked = false;
var myId = document.getElementById("emp_num");
	// J쿼리 함수 시작점
	$(document).ready(function() {
		
		// 쿠키에서 값을 가져와서 변수에 저장
		var savedId = $.cookie("emp_num");
		// 쿠키에 값이 있다면 아이디창에 출력 및 체크박스 버튼 활성화
		if (savedId) {
			myId.value = savedId;
			$("#inputRememberPassword").prop("checked", true);
			isChecked = true;
		}
		
		// 아이디 기억 체크박스가 체크되어있는지 유무를 변수에 저장
		$("#inputRememberPassword").change(function () {
			isChecked = $(this).prop("checked");
			// 체크 될때 "emp_num" 쿠키값에 아이디값 저장
			$.cookie("emp_num", myId.value, {expires : 7});
		});
		
		// 기억박스가 체크되어있다면 키이벤트 함수 활성화 및 쿠키 저장 활성화
		if(isChecked){
			// 아이디창 입력이 감지될때마다도 마찬가지로 저장
			$("#emp_num").on("keyup", function() {
				$.cookie("emp_num", myId.value, {expires : 7}); // 7일 동안 유지
			});
		} else {
			// 체크박스 풀경우 키이벤트 삭제
			$("#emp_num").off("keyup");
		}
	});
	// 쿠키 삭제 기능 하고싶으면 이함수사용 
	// $.removeCookie("emp_num");
	// 쿠키확인 방법 f12>어플리케이션>왼쪽패널에서 쿠키선택
</script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="../resources/js/scripts.js"></script>
    </body>
</html>
